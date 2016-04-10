#include <ham-relay.h>

extern void SystemInit (void);

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

  systick_init ();
  tx_init ();
  tone_init ();
  roger_beep_init ();
  call_init ();

  inputs_init ();

  call_transmit_delay (5);

  while (1) {
    roger_beep_transmit_if_needed ();

    if (call_transmit_if_needed () && !input_is_rxe_enabled ()) {
      tx_disable ();
    }

    __WFI ();
  }

  return 0;
}
