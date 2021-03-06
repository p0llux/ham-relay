#ifndef __HAVE_CONFIG_H
#define __HAVE_CONFIG_H

#define LED_STATUS_PIO     IOCON_PIO2_4
#define LED_STATUS_PORT    2
#define LED_STATUS_PIN     4
#define LED_INVERTED_LOGIC true

#define LED_TONE_PIO     IOCON_PIO2_5
#define LED_TONE_PORT    2
#define LED_TONE_PIN     5

#define TXE_PIO      IOCON_PIO2_6
#define TXE_PORT     2
#define TXE_PIN      6
#define TXE_CONFIG   IOCON_MODE_INACT | IOCON_FUNC0

#define RXE_PIO      IOCON_PIO2_9
#define RXE_PORT     2
#define RXE_PIN      9
#define RXE_CONFIG   (IOCON_FUNC0 | IOCON_MODE_PULLUP | IOCON_DIGMODE_EN)

#define EXT_PIO      IOCON_PIO1_4
#define EXT_PORT     1
#define EXT_PIN      4
#define EXT_CONFIG   (IOCON_FUNC0 | IOCON_MODE_PULLUP | IOCON_DIGMODE_EN)

#define TONE_PIO     IOCON_PIO3_0
#define TONE_PORT    3
#define TONE_PIN     0

#define TONE_SW_PIO  IOCON_PIO2_7
#define TONE_SW_PORT 2
#define TONE_SW_PIN  7

#define TX_READY_DELAY_MS 150

#define TONE_DEFAULT_HZ  900
#define TONE_EXT_HZ      400

#define MORSE_SHORT_DURATION_MS 80
#define MORSE_LONG_DURATION_MS  (MORSE_SHORT_DURATION_MS * 3)
#define MORSE_PAUSE_DURATION_MS (MORSE_SHORT_DURATION_MS * 3)
#define MORSE_SPACE_DURATION_MS (MORSE_SHORT_DURATION_MS * 7)

#define CALL_INTERVAL_SEC   30
#define CALL_DELAY_AFTER_TX 10
#define CALL_STRING         "ON0LBN"
#define CALL_POST_DELAY_MS  100

#define ROGER_BEEP_DELAY_MS    250
#define ROGER_BEEP_DURATION_MS 250

#endif /* __HAVE_CONFIG_H */
