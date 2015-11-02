#ifndef __HAVE_SYSTICK_H
#define __HAVE_SYSTICK_H

#define HAS_TIMED_OUT(tick_start,timeout_ms) ((gSysTicks - tick_start) > (timeout_ms / 10))

extern volatile uint32_t gSysTicks;

void systick_init (void);

void systick_delay (uint32_t delay);

#endif /* __HAVE_SYSTICK_H */
