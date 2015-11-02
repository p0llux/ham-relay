#include <chip.h>
#include <debug.h>

#define LED_STATUS_PIO   IOCON_PIO3_0
#define LED_STATUS_PORT  3
#define LED_STATUS_PIN   0

#define BUTTON_PIO   IOCON_PIO2_9
#define BUTTON_PORT  2
#define BUTTON_PIN   9

void
main (void)
{
  SystemInit ();

  debug_init ();
#ifdef DEBUG_LEVEL
  debug_set_level (DEBUG_LEVEL);
#endif

  /* configure LED output */
  Chip_IOCON_PinMuxSet (LPC_IOCON, LED_STATUS_PIO, IOCON_MODE_INACT | IOCON_FUNC0);
  Chip_GPIO_SetPinDIROutput (LPC_GPIO, LED_STATUS_PORT, LED_STATUS_PIN);
  Chip_GPIO_SetPinState (LPC_GPIO, LED_STATUS_PORT, LED_STATUS_PIN, true);

  /* configure input */
  Chip_IOCON_PinMuxSet (LPC_IOCON, BUTTON_PIO, (IOCON_FUNC0 | IOCON_MODE_PULLUP | IOCON_DIGMODE_EN));
  Chip_GPIO_SetPinDIRInput (LPC_GPIO, BUTTON_PORT, BUTTON_PIN);

  Chip_GPIO_SetPinModeEdge (LPC_GPIO, BUTTON_PORT, (1 << BUTTON_PIN));
  Chip_GPIO_SetEdgeModeSingle (LPC_GPIO, BUTTON_PORT, (1 << BUTTON_PIN));
  Chip_GPIO_SetModeLow (LPC_GPIO, BUTTON_PORT, (1 << BUTTON_PIN));

  Chip_GPIO_EnableInt (LPC_GPIO, BUTTON_PORT, (1 << BUTTON_PIN));

  DBG_NEWLINE (DBG_LEVEL_INFO);
  DBG (DBG_LEVEL_INFO, "Button test firmware (" __GIT_SHA1__ ")");
  DBG (DBG_LEVEL_INFO, "Compiled " __DATE__ " at " __TIME__ " on " __BUILD_HOSTNAME__ " using GCC " __VERSION__ " (%d.%d-%d)", __CS_SOURCERYGXX_MAJ__, __CS_SOURCERYGXX_MIN__, __CS_SOURCERYGXX_REV__);
  DBG (DBG_LEVEL_INFO, "MCU running at %d MHz", SystemCoreClock / 1000000);

  NVIC_EnableIRQ (EINT2_IRQn);

  while (1) {
    __WFI ();
  }
}

void
pio2_handler (void)
{
  DBG (DBG_LEVEL_DEBUG, "button interrupt");

  Chip_GPIO_SetPinToggle (LPC_GPIO, LED_STATUS_PORT, LED_STATUS_PIN);
  Chip_GPIO_ClearInts (LPC_GPIO, BUTTON_PORT, (1 << BUTTON_PIN));
}
