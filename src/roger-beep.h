#ifndef __HAVE_ROGER_BEEP_HEADER
#define __HAVE_ROGER_BEEP_HEADER

void roger_beep_init (void);

void roger_beep_start_timer (void);
void roger_beep_stop_timer (void);

void roger_beep_transmit_if_needed (void);

#endif /* __HAVE_ROGER_BEEP_HEADER */
