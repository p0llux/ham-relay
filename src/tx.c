#include <ham-relay.h>

static int tx_usage;
static uint32_t tx_enable_tick;

void
tx_init (void)
{
  tx_usage = 0;

  Chip_IOCON_PinMuxSet (LPC_IOCON, TXE_PIO, TXE_CONFIG);
  Chip_GPIO_SetPinDIROutput (LPC_GPIO, TXE_PORT, TXE_PIN);
  Chip_GPIO_SetPinState (LPC_GPIO, TXE_PORT, TXE_PIN, false);
}

void
tx_enable (void)
{
  __disable_irq ();

  if (tx_usage == 0) {
    Chip_GPIO_SetPinState (LPC_GPIO, TXE_PORT, TXE_PIN, true);
    tx_enable_tick = gSysTicks;
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
      call_transmit_delay (CALL_DELAY_AFTER_TX);
    }
  }

  __enable_irq ();

  DBG (DBG_LEVEL_DEBUG, "TX usage = %d", tx_usage);
}

bool
tx_is_enabled (void)
{
  bool ret;

  __disable_irq ();
  ret = (tx_usage > 0);
  __enable_irq ();

  return ret;
}

bool
tx_is_ready (void)
{
  bool ret;

  __disable_irq ();
  ret = ((gSysTicks - tx_enable_tick) > TX_READY_DELAY_MS);
  __enable_irq ();

  return ret;
}
