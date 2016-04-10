#include <ham-relay.h>

static volatile bool transmit_roger_beep;

void
roger_beep_init (void)
{
  transmit_roger_beep = false;

  Chip_TIMER_Init (LPC_TIMER16_1);
  Chip_TIMER_Reset (LPC_TIMER16_1);
  Chip_TIMER_MatchEnableInt (LPC_TIMER16_1, 0);
  Chip_TIMER_PrescaleSet (LPC_TIMER16_1, Chip_Clock_GetSystemClockRate () / 1000);
  Chip_TIMER_SetMatch (LPC_TIMER16_1, 0, ROGER_BEEP_DELAY_MS);
  Chip_TIMER_ResetOnMatchDisable (LPC_TIMER16_1, 0);

  NVIC_ClearPendingIRQ (TIMER_16_1_IRQn);
  NVIC_EnableIRQ (TIMER_16_1_IRQn);
}

void
roger_beep_start_timer (void)
{
  Chip_TIMER_Reset (LPC_TIMER16_1);

  NVIC_DisableIRQ (TIMER_16_1_IRQn);
  transmit_roger_beep = false;
  NVIC_ClearPendingIRQ (TIMER_16_1_IRQn);
  NVIC_EnableIRQ (TIMER_16_1_IRQn);

  Chip_TIMER_Enable (LPC_TIMER16_1);
}

void
roger_beep_stop_timer (void)
{
  Chip_TIMER_Disable (LPC_TIMER16_1);
}

void
roger_beep_transmit_if_needed (void)
{
  NVIC_DisableIRQ (TIMER_16_1_IRQn);

  if (transmit_roger_beep) {
    DBG (DBG_LEVEL_INFO, "Roger beep");

    tx_enable ();
    tone_enable (ROGER_BEEP_DURATION_MS);
    tx_disable ();

    transmit_roger_beep = false;

    call_transmit_delay (CALL_DELAY_AFTER_TX);
    Chip_TIMER_Disable (LPC_TIMER16_1);
  }

  NVIC_EnableIRQ (TIMER_16_1_IRQn);
}

void
timer16_1_handler (void)
{
  if (Chip_TIMER_MatchPending (LPC_TIMER16_1, 0)) {
    Chip_TIMER_ClearMatch (LPC_TIMER16_1, 0);

    transmit_roger_beep = true;
  }
}
