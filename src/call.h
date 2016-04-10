#ifndef __HAVE_CALL_H
#define __HAVE_CALL_H

void call_init (void);

bool call_transmit_if_needed (void);
void call_force_transmit (void);

void call_transmit_delay (uint32_t seconds);

#endif /* __HAVE_CALL_H */
