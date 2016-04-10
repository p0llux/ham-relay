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
  tx_set_state (TX_ROGER);

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
  if ((LPC_TIMER16_1->TCR & TIMER_ENABLE) != 0) {
    tx_clear_state (TX_ROGER);
  }

  Chip_TIMER_Disable (LPC_TIMER16_1);
}

bool
roger_beep_transmit_if_needed (void)
{
  bool sent;

  NVIC_DisableIRQ (TIMER_16_1_IRQn);

  if (transmit_roger_beep) {
    DBG (DBG_LEVEL_INFO, "Roger beep");

    tone_enable (ROGER_BEEP_DURATION_MS);

    tx_set_state (TX_CALL);
    tx_clear_state (TX_ROGER);

    transmit_roger_beep = false;

    Chip_TIMER_Disable (LPC_TIMER16_1);

    sent = true;
  } else {
    sent = false;
  }

  NVIC_EnableIRQ (TIMER_16_1_IRQn);

  return sent;
}

void
timer16_1_handler (void)
{
  if (Chip_TIMER_MatchPending (LPC_TIMER16_1, 0)) {
    Chip_TIMER_ClearMatch (LPC_TIMER16_1, 0);

    transmit_roger_beep = true;
  }
}
