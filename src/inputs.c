#include <ham-relay.h>

void
inputs_init (void)
{
  /* RXE */
  Chip_IOCON_PinMuxSet (LPC_IOCON, RXE_PIO, RXE_CONFIG);
  Chip_GPIO_SetPinDIRInput (LPC_GPIO, RXE_PORT, RXE_PIN);

  Chip_GPIO_SetPinModeEdge (LPC_GPIO, RXE_PORT, (1 << RXE_PIN));
  Chip_GPIO_SetEdgeModeBoth (LPC_GPIO, RXE_PORT, (1 << RXE_PIN));

  Chip_GPIO_EnableInt (LPC_GPIO, RXE_PORT, (1 << RXE_PIN));

  /* EXT */
  Chip_IOCON_PinMuxSet (LPC_IOCON, EXT_PIO, EXT_CONFIG);
  Chip_GPIO_SetPinDIRInput (LPC_GPIO, EXT_PORT, EXT_PIN);

  if (!Chip_GPIO_GetPinState (LPC_GPIO, EXT_PORT, EXT_PIN)) {
    tone_set_frequency (TONE_EXT_HZ);
  }

  Chip_GPIO_SetPinModeEdge (LPC_GPIO, EXT_PORT, (1 << EXT_PIN));
  Chip_GPIO_SetEdgeModeBoth (LPC_GPIO, EXT_PORT, (1 << EXT_PIN));

  Chip_GPIO_EnableInt (LPC_GPIO, EXT_PORT, (1 << EXT_PIN));

  NVIC_EnableIRQ (EINT0_IRQn);
}

bool
input_is_rxe_enabled (void)
{
  return !Chip_GPIO_GetPinState (LPC_GPIO, RXE_PORT, RXE_PIN);
}

void
pio0_handler (void)
{
  uint32_t status;

  status = Chip_GPIO_GetRawInts (LPC_GPIO, 0);

  if (status & (1 << RXE_PIN)) {
    static volatile bool tx_enabled = false;

    if (Chip_GPIO_GetPinState (LPC_GPIO, RXE_PORT, RXE_PIN)) {
      roger_beep_start_timer ();

      tx_disable ();
      tx_enabled = false;
    } else if (!tx_enabled) {
      roger_beep_stop_timer ();

      if (Chip_GPIO_GetPinState (LPC_GPIO, EXT_PORT, EXT_PIN)) {
        tone_set_frequency (TONE_DEFAULT_HZ);
      } else {
        tone_set_frequency (TONE_EXT_HZ);
      }
    }

    Chip_GPIO_ClearInts (LPC_GPIO, RXE_PORT, (1 << RXE_PIN));
  }

  if (status & (1 << EXT_PIN)) {
    static volatile bool ext_enabled = false;

    if (Chip_GPIO_GetPinState (LPC_GPIO, EXT_PORT, EXT_PIN)) {
      status_set_pattern (STATUS_PATTERN_OK);
      tone_set_frequency (TONE_DEFAULT_HZ);

      ext_enabled = false;
    } else if (!ext_enabled) {
      status_set_pattern (STATUS_PATTERN_EXT);
      tone_set_frequency (TONE_EXT_HZ);

      ext_enabled = true;
    }

    Chip_GPIO_ClearInts (LPC_GPIO, EXT_PORT, (1 << EXT_PIN));
  }
}
