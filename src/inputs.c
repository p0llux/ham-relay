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

void
pio0_handler (void)
{
  static uint32_t last_tx_enable_tick;
  uint32_t status;

  status = Chip_GPIO_GetRawInts (LPC_GPIO, 0);

  if (status & (1 << RXE_PIN)) {
    Chip_GPIO_ClearInts (LPC_GPIO, RXE_PORT, (1 << RXE_PIN));

    if (Chip_GPIO_GetPinState (LPC_GPIO, RXE_PORT, RXE_PIN)) {
      tx_disable ();
      tx_enabled = false;

      roger_beep_start_timer ();
    } else {
      if (HAS_TIMED_OUT (last_tx_enable_tick, 30)) {
	if (!tx_enabled) {
	  roger_beep_stop_timer ();

	  tx_enable ();
	  tx_enable ();
	  tx_enabled = true;
	  last_tx_enable_tick = gSysTicks;
	}
      }
    }
  }

  if (status & (1 << EXT_PIN)) {
    Chip_GPIO_ClearInts (LPC_GPIO, EXT_PORT, (1 << EXT_PIN));
    //call_force_transmit ();

    if (Chip_GPIO_GetPinState (LPC_GPIO, EXT_PORT, EXT_PIN)) {
      tone_set_frequency (TONE_DEFAULT_HZ);
    } else {
      tone_set_frequency (TONE_EXT_HZ);
    }
  }
}
