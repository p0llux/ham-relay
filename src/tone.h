#ifndef __HAVE_TONE_H
#define __HAVE_TONE_H

void tone_init (void);

void tone_set_frequency (uint16_t frequency);

void tone_enable (uint32_t duration_ms);

#endif /* __HAVE_TONE_H */
