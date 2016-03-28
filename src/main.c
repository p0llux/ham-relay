#include <ham-relay.h>

int
main (void)
{
  SystemInit ();

  debug_init ();
#ifdef DEBUG_LEVEL
  debug_set_level (DEBUG_LEVEL);
#endif

  DBG_NEWLINE (DBG_LEVEL_INFO);
  DBG (DBG_LEVEL_INFO, "HAM relay firmware v" VERSION_STR " (" __GIT_SHA1__ ")");
  DBG (DBG_LEVEL_INFO, "Compiled " __DATE__ " at " __TIME__ " on " __BUILD_HOSTNAME__ " using GCC " __VERSION__ " (%d.%d-%d)", __CS_SOURCERYGXX_MAJ__, __CS_SOURCERYGXX_MIN__, __CS_SOURCERYGXX_REV__);
  DBG (DBG_LEVEL_INFO, "MCU running at %d MHz", SystemCoreClock / 1000000);

  inputs_init ();

  systick_init ();
  tx_init ();
  tone_init ();
  call_init ();

  call_transmit_delay (5);

  while (1) {
    call_transmit_if_needed ();

    __WFI ();
  }

  return 0;
}
