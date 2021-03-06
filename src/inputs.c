#include <ham-relay.h>

static volatile bool tx_enabled;

void
inputs_init (void)
{
  tx_enabled = false;

  /* RXE */
  Chip_IOCON_PinMuxSet (LPC_IOCON, RXE_PIO, RXE_CONFIG);
  Chip_GPIO_SetPinDIRInput (LPC_GPIO, RXE_PORT, RXE_PIN);

  Chip_GPIO_SetPinModeEdge (LPC_GPIO, RXE_PORT, (1 << RXE_PIN));
  Chip_GPIO_SetEdgeModeBoth (LPC_GPIO, RXE_PORT, (1 << RXE_PIN));

  Chip_GPIO_EnableInt (LPC_GPIO, RXE_PORT, (1 << RXE_PIN));
  NVIC_EnableIRQ (EINT2_IRQn);

  /* EXT */
  Chip_IOCON_PinMuxSet (LPC_IOCON, EXT_PIO, EXT_CONFIG);
  Chip_GPIO_SetPinDIRInput (LPC_GPIO, EXT_PORT, EXT_PIN);

  Chip_GPIO_SetPinModeEdge (LPC_GPIO, EXT_PORT, (1 << EXT_PIN));
  Chip_GPIO_SetEdgeModeBoth (LPC_GPIO, EXT_PORT, (1 << EXT_PIN));

  Chip_GPIO_EnableInt (LPC_GPIO, EXT_PORT, (1 << EXT_PIN));
  NVIC_EnableIRQ (EINT1_IRQn);
}

void
pio1_handler (void)
{
  Chip_GPIO_ClearInts (LPC_GPIO, EXT_PORT, (1 << EXT_PIN));
  //call_force_transmit ();

  if (Chip_GPIO_GetPinState (LPC_GPIO, EXT_PORT, EXT_PIN)) {
    tone_set_frequency (TONE_DEFAULT_HZ);
  } else {
    tone_set_frequency (TONE_EXT_HZ);
  }
}

void
pio2_handler (void)
{
  Chip_GPIO_ClearInts (LPC_GPIO, RXE_PORT, (1 << RXE_PIN));

  if (Chip_GPIO_GetPinState (LPC_GPIO, RXE_PORT, RXE_PIN)) {
    tx_disable ();
    tx_enabled = false;

    roger_beep_start_timer ();
  } else if (!tx_enabled) {
    roger_beep_stop_timer ();

    tx_enable ();
    tx_enabled = true;
  }
}
