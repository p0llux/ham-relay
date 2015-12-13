#include <ham-relay.h>

static void generate_1khz (void);

static volatile bool send_code = false;

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

  /* configure input */
  Chip_IOCON_PinMuxSet (LPC_IOCON, RXE_PIO, (IOCON_FUNC0 | IOCON_MODE_PULLUP | IOCON_DIGMODE_EN));
  Chip_GPIO_SetPinDIRInput (LPC_GPIO, RXE_PORT, RXE_PIN);

  Chip_GPIO_SetPinModeEdge (LPC_GPIO, RXE_PORT, (1 << RXE_PIN));
  Chip_GPIO_SetEdgeModeSingle (LPC_GPIO, RXE_PORT, (1 << RXE_PIN));
  Chip_GPIO_SetModeLow (LPC_GPIO, RXE_PORT, (1 << RXE_PIN));

  Chip_GPIO_EnableInt (LPC_GPIO, RXE_PORT, (1 << RXE_PIN));
  NVIC_EnableIRQ (EINT2_IRQn);

  systick_init ();
  tx_init ();
  mixer_init ();

  generate_1khz ();

  while (1) {
    if (send_code) {
      morse_send ("ON0LBN", 6);
      NVIC_DisableIRQ (EINT2_IRQn);
      send_code = false;
      NVIC_EnableIRQ (EINT2_IRQn);
    }

    //volatile int i;


    //for (i = 0; i < (0x80000 * 6); i++);

    __WFI ();
  }

  return 0;
}

static void
generate_1khz (void)
{
  Chip_IOCON_PinMuxSet (LPC_IOCON, TONE_PIO, IOCON_MODE_INACT | IOCON_FUNC0);
  Chip_GPIO_SetPinDIROutput (LPC_GPIO, TONE_PORT, TONE_PIN);
  Chip_GPIO_SetPinState (LPC_GPIO, TONE_PORT, TONE_PIN, false);

  Chip_TIMER_Init (LPC_TIMER16_0);
  Chip_TIMER_Reset (LPC_TIMER16_0);
  Chip_TIMER_MatchEnableInt (LPC_TIMER16_0, 0);
  Chip_TIMER_SetMatch (LPC_TIMER16_0, 0, (Chip_Clock_GetSystemClockRate () / (SIGNAL_FREQ * 2)));
  Chip_TIMER_ResetOnMatchEnable (LPC_TIMER16_0, 0);
  Chip_TIMER_Enable (LPC_TIMER16_0);
  Chip_GPIO_SetPinState (LPC_GPIO, TONE_PORT, TONE_PIN, false);
  NVIC_ClearPendingIRQ (TIMER_16_0_IRQn);
  NVIC_EnableIRQ (TIMER_16_0_IRQn);
}

void
timer16_0_handler (void)
{
  if (Chip_TIMER_MatchPending (LPC_TIMER16_0, 0)) {
    Chip_TIMER_ClearMatch (LPC_TIMER16_0, 0);

    Chip_GPIO_SetPinToggle (LPC_GPIO, TONE_PORT, TONE_PIN);
  }
}

void
pio2_handler (void)
{
  Chip_GPIO_ClearInts (LPC_GPIO, RXE_PORT, (1 << RXE_PIN));
  send_code = true;
}
