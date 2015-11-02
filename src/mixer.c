#include <ham-relay.h>

void
mixer_init (void)
{
  Chip_IOCON_PinMuxSet (LPC_IOCON, MIX_1KHZ_PIO, IOCON_MODE_INACT | IOCON_FUNC0);
  Chip_GPIO_SetPinDIROutput (LPC_GPIO, MIX_1KHZ_PORT, MIX_1KHZ_PIN);
  Chip_GPIO_SetPinState (LPC_GPIO, MIX_1KHZ_PORT, MIX_1KHZ_PIN, MIX_INVERTED_LOGIC);
}

void
mixer_enable_1khz (uint32_t duration_ms)
{
  uint32_t start_systick;

  start_systick = gSysTicks;
  while (gSysTicks == start_systick);

  Chip_GPIO_SetPinState (LPC_GPIO, MIX_1KHZ_PORT, MIX_1KHZ_PIN, !MIX_INVERTED_LOGIC);
  while (gSysTicks < (start_systick + 1 + (duration_ms / 10)));
  Chip_GPIO_SetPinState (LPC_GPIO, MIX_1KHZ_PORT, MIX_1KHZ_PIN, MIX_INVERTED_LOGIC);
}