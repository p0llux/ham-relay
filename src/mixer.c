#include <ham-relay.h>

void
mixer_init (void)
{
  Chip_IOCON_PinMuxSet (LPC_IOCON, TONE_SW_PIO, IOCON_MODE_INACT | IOCON_FUNC0);
  Chip_GPIO_SetPinDIROutput (LPC_GPIO, TONE_SW_PORT, TONE_SW_PIN);
  Chip_GPIO_SetPinState (LPC_GPIO, TONE_SW_PORT, TONE_SW_PIN, true);
}

void
mixer_enable_1khz (uint32_t duration_ms)
{
  uint32_t start_systick;

  start_systick = gSysTicks;
  while (gSysTicks == start_systick);

  Chip_GPIO_SetPinState (LPC_GPIO, TONE_SW_PORT, TONE_SW_PIN, false);

  while (gSysTicks < (start_systick + 1 + (duration_ms / 10)));

  Chip_GPIO_SetPinState (LPC_GPIO, TONE_SW_PORT, TONE_SW_PIN, true);
}
