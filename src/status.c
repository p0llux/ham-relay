#include <ham-relay.h>

static uint32_t blink_mask = 0;

void
status_init (void)
{
  Chip_IOCON_PinMuxSet (LPC_IOCON, LED_STATUS_PIO, IOCON_MODE_INACT | IOCON_FUNC1);
  Chip_GPIO_SetPinDIROutput (LPC_GPIO, LED_STATUS_PORT, LED_STATUS_PIN);
  Chip_GPIO_SetPinState (LPC_GPIO, LED_STATUS_PORT, LED_STATUS_PIN, false);

  Chip_TIMER_Init (LPC_TIMER32_1);
  Chip_TIMER_Reset (LPC_TIMER32_1);
  Chip_TIMER_MatchEnableInt (LPC_TIMER32_1, 1);
  Chip_TIMER_SetMatch (LPC_TIMER32_1, 1, ((Chip_Clock_GetSystemClockRate () * 2) / 32));
  Chip_TIMER_ResetOnMatchEnable (LPC_TIMER32_1, 1);
  Chip_TIMER_Enable (LPC_TIMER32_1);

  /* Enable timer interrupt */
  NVIC_ClearPendingIRQ (TIMER_32_1_IRQn);
  NVIC_EnableIRQ (TIMER_32_1_IRQn);
}

void
status_set_pattern (uint32_t pattern)
{
  NVIC_DisableIRQ (TIMER_32_1_IRQn);
  blink_mask = pattern;
  NVIC_EnableIRQ (TIMER_32_1_IRQn);
}

void
timer32_1_handler (void)
{
  static uint32_t pos = 0;

  if (Chip_TIMER_MatchPending(LPC_TIMER32_1, 1)) {
    Chip_TIMER_ClearMatch(LPC_TIMER32_1, 1);

    Chip_GPIO_SetPinState (LPC_GPIO, LED_STATUS_PORT, LED_STATUS_PIN, (blink_mask & (1 << (pos++ & 0x1F))));
  }
}
