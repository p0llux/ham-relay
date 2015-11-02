#include <ham-relay.h>

static void generate_1khz (void);

int
main (void)
{
  SystemInit ();

  debug_init ();
#ifdef DEBUG_LEVEL
  debug_set_level (DEBUG_LEVEL);
#endif

  DBG_NEWLINE (DBG_LEVEL_INFO);
  DBG (DBG_LEVEL_INFO, "HAM relay firmware v" VERSION_STR " (" __GIT_SHA1__ ")");
  DBG (DBG_LEVEL_INFO, "Compiled " __DATE__ " at " __TIME__ " on " __BUILD_HOSTNAME__ " using GCC " __VERSION__ " (%d.%d-%d)", __CS_SOURCERYGXX_MAJ__, __CS_SOURCERYGXX_MIN__, __CS_SOURCERYGXX_REV__);
  DBG (DBG_LEVEL_INFO, "MCU running at %d MHz", SystemCoreClock / 1000000);

  systick_init ();
  
  generate_1khz ();

  while (1) {
    __WFI ();
  }

  return 0;
}

static void
generate_1khz (void)
{
  Chip_IOCON_PinMuxSet (LPC_IOCON, OUT_1KHZ_PIO, IOCON_MODE_INACT | IOCON_FUNC0);
  Chip_GPIO_SetPinDIROutput (LPC_GPIO, OUT_1KHZ_PORT, OUT_1KHZ_PIN);
  Chip_GPIO_SetPinState (LPC_GPIO, OUT_1KHZ_PORT, OUT_1KHZ_PIN, false);

  Chip_TIMER_Init (LPC_TIMER16_0);
  Chip_TIMER_Reset (LPC_TIMER16_0);
  Chip_TIMER_MatchEnableInt (LPC_TIMER16_0, 0);
  Chip_TIMER_SetMatch (LPC_TIMER16_0, 0, (Chip_Clock_GetSystemClockRate () / 1000));
  Chip_TIMER_ResetOnMatchEnable (LPC_TIMER16_0, 0);
  Chip_TIMER_Enable (LPC_TIMER16_0);

  NVIC_ClearPendingIRQ (TIMER_16_0_IRQn);
  NVIC_EnableIRQ (TIMER_16_0_IRQn);
}

void
timer16_0_handler (void)
{
  if (Chip_TIMER_MatchPending (LPC_TIMER16_0, 0)) {
    Chip_TIMER_ClearMatch (LPC_TIMER16_0, 0);

    Chip_GPIO_SetPinToggle (LPC_GPIO, OUT_1KHZ_PORT, OUT_1KHZ_PIN);
  }
}
