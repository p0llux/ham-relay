#include <ham-relay.h>

extern void SystemInit (void);

int
main (void)
{
  uint32_t last_call_sent_tick;

  last_call_sent_tick = 0;

  SystemInit ();

  debug_init ();
#ifdef DEBUG_LEVEL
  debug_set_level (DEBUG_LEVEL);
#endif

  /* configure watchdog */
  Chip_WWDT_Init (LPC_WWDT);
  Chip_SYSCTL_PowerUp (SYSCTL_POWERDOWN_WDTOSC_PD);
  Chip_Clock_SetWDTOSC (WDTLFO_OSC_1_05, 42);
  Chip_Clock_SetWDTClockSource (SYSCTL_WDTCLKSRC_WDTOSC, 1);
  Chip_WWDT_SetOption(LPC_WWDT, WWDT_WDMOD_WDRESET);

  Chip_WWDT_SetTimeOut (LPC_WWDT, (Chip_Clock_GetWDTOSCRate() / 4) * WDT_TIMEOUT_SEC);

  Chip_WWDT_ClearStatusFlag (LPC_WWDT, WWDT_WDMOD_WDTOF);
  Chip_WWDT_Start (LPC_WWDT);

  DBG_NEWLINE (DBG_LEVEL_INFO);
  DBG (DBG_LEVEL_INFO, "HAM relay firmware v" VERSION_STR " (" __GIT_SHA1__ ")");
  DBG (DBG_LEVEL_INFO, "Compiled " __DATE__ " at " __TIME__ " on " __BUILD_HOSTNAME__ " using GCC " __VERSION__ " (%d.%d-%d)", __CS_SOURCERYGXX_MAJ__, __CS_SOURCERYGXX_MIN__, __CS_SOURCERYGXX_REV__);
  DBG (DBG_LEVEL_INFO, "MCU running at %d MHz", SystemCoreClock / 1000000);

  status_init ();
  systick_init ();
  tx_init ();
  tone_init ();
  roger_beep_init ();
  call_init ();

  inputs_init ();

  status_set_pattern (STATUS_PATTERN_OK);

  call_transmit_delay (5);

  while (1) {
    if (roger_beep_transmit_if_needed ()) {
      call_transmit_delay (CALL_DELAY_AFTER_TX);
    }

    if (call_transmit_if_needed ()) {
      last_call_sent_tick = gSysTicks;

      Chip_WWDT_Feed (LPC_WWDT);
    }

    if (HAS_TIMED_OUT (last_call_sent_tick, CALL_INTERVAL_SEC * 1000)) {
      call_force_transmit ();
      continue;
    }

    __WFI ();
  }

  return 0;
}
