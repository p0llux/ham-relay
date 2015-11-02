#include <chip.h>
#include <debug.h>

#define LED_STATUS_PIO   IOCON_PIO3_0
#define LED_STATUS_PORT  3
#define LED_STATUS_PIN   0

void
main (void)
{
  volatile int i;

  SystemInit ();

  debug_init ();
#ifdef DEBUG_LEVEL
  debug_set_level (DEBUG_LEVEL);
#endif

  /* configure LED output */
  Chip_IOCON_PinMuxSet (LPC_IOCON, LED_STATUS_PIO, IOCON_MODE_INACT | IOCON_FUNC0);
  Chip_GPIO_SetPinDIROutput (LPC_GPIO, LED_STATUS_PORT, LED_STATUS_PIN);
  Chip_GPIO_SetPinState (LPC_GPIO, LED_STATUS_PORT, LED_STATUS_PIN, false);

  DBG_NEWLINE (DBG_LEVEL_INFO);
  DBG (DBG_LEVEL_INFO, "Debug test firmware (" __GIT_SHA1__ ")");
  DBG (DBG_LEVEL_INFO, "Compiled " __DATE__ " at " __TIME__ " on " __BUILD_HOSTNAME__ " using GCC " __VERSION__ " (%d.%d-%d)", __CS_SOURCERYGXX_MAJ__, __CS_SOURCERYGXX_MIN__, __CS_SOURCERYGXX_REV__);
  DBG (DBG_LEVEL_INFO, "MCU running at %d MHz", SystemCoreClock / 1000000);

  for (i = 0; i < 0x800000; i++);

  while (1) {
    /* toggle LED */
    Chip_GPIO_SetPinToggle (LPC_GPIO, LED_STATUS_PORT, LED_STATUS_PIN);

    DBG (DBG_LEVEL_INFO, "Hello world !!!");

    for (i = 0; i < 0x400000; i++);
  }
}
