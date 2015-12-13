#include <ham-relay.h>

void
tone_init (void)
{
  /* configure TONE_SW pin */
  Chip_IOCON_PinMuxSet (LPC_IOCON, TONE_SW_PIO, IOCON_MODE_INACT | IOCON_FUNC0);
  Chip_GPIO_SetPinDIROutput (LPC_GPIO, TONE_SW_PORT, TONE_SW_PIN);
  Chip_GPIO_SetPinState (LPC_GPIO, TONE_SW_PORT, TONE_SW_PIN, true);

  /* configure TONE LED pin */
  Chip_IOCON_PinMuxSet (LPC_IOCON, LED_TONE_PIO, IOCON_MODE_INACT | IOCON_FUNC0);
  Chip_GPIO_SetPinDIROutput (LPC_GPIO, LED_TONE_PORT, LED_TONE_PIN);
  Chip_GPIO_SetPinState (LPC_GPIO, LED_TONE_PORT, LED_TONE_PIN, true);
  
  /* configure TONE pin */
  Chip_IOCON_PinMuxSet (LPC_IOCON, TONE_PIO, IOCON_MODE_INACT | IOCON_FUNC0);
  Chip_GPIO_SetPinDIROutput (LPC_GPIO, TONE_PORT, TONE_PIN);
  Chip_GPIO_SetPinState (LPC_GPIO, TONE_PORT, TONE_PIN, false);

  /* configure timer used to generate the tone */
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
tone_enable_1khz (uint32_t duration_ms)
{
  uint32_t start_systick;

  start_systick = gSysTicks;
  while (gSysTicks == start_systick);

  Chip_GPIO_SetPinState (LPC_GPIO, TONE_SW_PORT, TONE_SW_PIN, false);
  Chip_GPIO_SetPinState (LPC_GPIO, LED_TONE_PORT, LED_TONE_PIN, false);

  while (gSysTicks < (start_systick + 1 + (duration_ms / 10)));

  Chip_GPIO_SetPinState (LPC_GPIO, TONE_SW_PORT, TONE_SW_PIN, true);
  Chip_GPIO_SetPinState (LPC_GPIO, LED_TONE_PORT, LED_TONE_PIN, true);
}

void
timer16_0_handler (void)
{
  if (Chip_TIMER_MatchPending (LPC_TIMER16_0, 0)) {
    Chip_TIMER_ClearMatch (LPC_TIMER16_0, 0);

    Chip_GPIO_SetPinToggle (LPC_GPIO, TONE_PORT, TONE_PIN);
  }
}
