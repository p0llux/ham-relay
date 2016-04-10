#include <ham-relay.h>

static uint32_t tx_state;

void
tx_init (void)
{
  tx_state = 0;

  Chip_IOCON_PinMuxSet (LPC_IOCON, TXE_PIO, TXE_CONFIG);
  Chip_GPIO_SetPinDIROutput (LPC_GPIO, TXE_PORT, TXE_PIN);
  Chip_GPIO_SetPinState (LPC_GPIO, TXE_PORT, TXE_PIN, false);
}

void
tx_set_state (uint32_t state)
{
  __disable_irq ();
  tx_state |= state;

  Chip_GPIO_SetPinState (LPC_GPIO, TXE_PORT, TXE_PIN, tx_state != 0);

  __enable_irq ();

  DBG (DBG_LEVEL_DEBUG, "TX state = %x", tx_state);
}

void
tx_clear_state (uint32_t state)
{
  __disable_irq ();
  tx_state &= ~state;

  Chip_GPIO_SetPinState (LPC_GPIO, TXE_PORT, TXE_PIN, tx_state != 0);

  __enable_irq ();

  DBG (DBG_LEVEL_DEBUG, "TX state = %x", tx_state);
}
