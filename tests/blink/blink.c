#include <chip.h>
#include <debug.h>

#define LED_STATUS_PIO   IOCON_PIO3_0
#define LED_STATUS_PORT  3
#define LED_STATUS_PIN   0

static const blink_mask = 0xFEFEFFFF;

void
main (void)
{
  SystemInit ();

  Chip_IOCON_PinMuxSet (LPC_IOCON, LED_STATUS_PIO, IOCON_MODE_INACT | IOCON_FUNC0);
  Chip_GPIO_SetPinDIROutput (LPC_GPIO, LED_STATUS_PORT, LED_STATUS_PIN);
  Chip_GPIO_SetPinState (LPC_GPIO, LED_STATUS_PORT, LED_STATUS_PIN, false);

  Chip_TIMER_Init (LPC_TIMER32_0);
  Chip_TIMER_Reset (LPC_TIMER32_0);
  Chip_TIMER_MatchEnableInt (LPC_TIMER32_0, 1);
  Chip_TIMER_SetMatch (LPC_TIMER32_0, 1, (Chip_Clock_GetSystemClockRate () / (1 * 32)));
  Chip_TIMER_ResetOnMatchEnable (LPC_TIMER32_0, 1);
  Chip_TIMER_Enable (LPC_TIMER32_0);

  /* Enable timer interrupt */
  NVIC_ClearPendingIRQ (TIMER_32_0_IRQn);
  NVIC_EnableIRQ (TIMER_32_0_IRQn);

  while (1) {
    __WFI ();
  }
}

void
timer32_0_handler (void)
{
  static uint32_t pos = 0;

  if (Chip_TIMER_MatchPending(LPC_TIMER32_0, 1)) {
    Chip_TIMER_ClearMatch(LPC_TIMER32_0, 1);

    Chip_GPIO_SetPinState (LPC_GPIO, LED_STATUS_PORT, LED_STATUS_PIN, (blink_mask & (1 << (pos++ & 0x1F))));
  }
}
