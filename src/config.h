#ifndef __HAVE_CONFIG_H
#define __HAVE_CONFIG_H

#define LED_STATUS_PIO     IOCON_PIO2_4
#define LED_STATUS_PORT    2
#define LED_STATUS_PIN     4
#define LED_INVERTED_LOGIC true

#define LED_TONE_PIO     IOCON_PIO2_5
#define LED_TONE_PORT    2
#define LED_TONE_PIN     5

#define TXE_PIO      IOCON_PIO2_3
#define TXE_PORT     2
#define TXE_PIN      3

#define RXE_PIO      IOCON_PIO2_9
#define RXE_PORT     2
#define RXE_PIN      9

#define TONE_PIO     IOCON_PIO3_0
#define TONE_PORT    3
#define TONE_PIN     0

#define TONE_SW_PIO  IOCON_PIO2_7
#define TONE_SW_PORT 2
#define TONE_SW_PIN  7

#define SIGNAL_FREQ  900

#define MORSE_SHORT_DURATION_MS 80
#define MORSE_LONG_DURATION_MS  (MORSE_SHORT_DURATION_MS * 3)
#define MORSE_PAUSE_DURATION_MS (MORSE_SHORT_DURATION_MS * 3)
#define MORSE_SPACE_DURATION_MS (MORSE_SHORT_DURATION_MS * 7)

#endif /* __HAVE_CONFIG_H */
