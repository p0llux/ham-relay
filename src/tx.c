#include <ham-relay.h>

static int tx_usage;

void
tx_init (void)
{
  tx_usage = 0;

  Chip_IOCON_PinMuxSet (LPC_IOCON, TXE_PIO, IOCON_MODE_INACT | IOCON_FUNC0);
  Chip_GPIO_SetPinDIROutput (LPC_GPIO, TXE_PORT, TXE_PIN);
  Chip_GPIO_SetPinState (LPC_GPIO, TXE_PORT, TXE_PIN, false);
}

void
tx_enable (void)
{
  __disable_irq ();

  if (tx_usage == 0) {
    Chip_GPIO_SetPinState (LPC_GPIO, TXE_PORT, TXE_PIN, true);
  }

  tx_usage++;

  __enable_irq ();

  DBG (DBG_LEVEL_DEBUG, "TX usage = %d", tx_usage);
}

void
tx_disable (void)
{
  __disable_irq ();

  if (tx_usage > 0) {
    tx_usage--;

    if (tx_usage == 0) {
      Chip_GPIO_SetPinState (LPC_GPIO, TXE_PORT, TXE_PIN, false);
    }
  }

  __enable_irq ();

  DBG (DBG_LEVEL_DEBUG, "TX usage = %d", tx_usage);
}
