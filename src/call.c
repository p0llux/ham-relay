#include <string.h>

#include <ham-relay.h>

static volatile bool transmit_call;

void
call_init (void)
{
  transmit_call = false;

  Chip_TIMER_Init (LPC_TIMER32_0);
  Chip_TIMER_Reset (LPC_TIMER32_0);
  Chip_TIMER_MatchEnableInt (LPC_TIMER32_0, 0);

  Chip_TIMER_PrescaleSet (LPC_TIMER32_0, Chip_Clock_GetSystemClockRate ());

  Chip_TIMER_SetMatch (LPC_TIMER32_0, 0, CALL_INTERVAL_SEC);
  Chip_TIMER_ResetOnMatchEnable (LPC_TIMER32_0, 0);
  Chip_TIMER_Enable (LPC_TIMER32_0);

  NVIC_ClearPendingIRQ (TIMER_32_0_IRQn);
  NVIC_EnableIRQ (TIMER_32_0_IRQn);
}

bool
call_transmit_if_needed (void)
{
  bool sent;

  NVIC_DisableIRQ (TIMER_32_0_IRQn);

  if (transmit_call) {
    DBG (DBG_LEVEL_INFO, "Transmitting station ID (%s)", CALL_STRING);
    tx_enable ();
    while (!tx_is_ready ());
    morse_send (CALL_STRING, strlen (CALL_STRING));
    systick_delay (CALL_POST_DELAY_MS);
    tx_disable ();

    transmit_call = false;

    Chip_TIMER_Reset (LPC_TIMER32_0);
    Chip_TIMER_ClearMatch(LPC_TIMER32_0, 0);
    Chip_TIMER_SetMatch (LPC_TIMER32_0, 0, CALL_INTERVAL_SEC);
    NVIC_ClearPendingIRQ (TIMER_32_0_IRQn);

    sent = true;
  } else {
    sent = false;
  }

  NVIC_EnableIRQ (TIMER_32_0_IRQn);

  return sent;
}

void
call_force_transmit (void)
{
  NVIC_DisableIRQ (TIMER_32_0_IRQn);
  transmit_call = true;
  NVIC_EnableIRQ (TIMER_32_0_IRQn);

  DBG (DBG_LEVEL_INFO, "Forced transmition of station ID");
}

void
call_transmit_delay (uint32_t seconds)
{
  NVIC_DisableIRQ (TIMER_32_0_IRQn);

  transmit_call = false;

  Chip_TIMER_Reset (LPC_TIMER32_0);
  Chip_TIMER_ClearMatch(LPC_TIMER32_0, 0);
  Chip_TIMER_SetMatch (LPC_TIMER32_0, 0, seconds);
  NVIC_ClearPendingIRQ (TIMER_32_0_IRQn);

  NVIC_EnableIRQ (TIMER_32_0_IRQn);
}

void
timer32_0_handler (void)
{
  if (Chip_TIMER_MatchPending (LPC_TIMER32_0, 0)) {
    Chip_TIMER_ClearMatch (LPC_TIMER32_0, 0);

    transmit_call = true;
  }
}
