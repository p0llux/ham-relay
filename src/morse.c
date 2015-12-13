#include <ctype.h>

#include <ham-relay.h>

typedef struct {
  uint8_t length;
  uint8_t code;
} morse_char_t;

static void send_pause (void);
static void send_space (void);
static void send_char (const unsigned char c);
static void send_digit (const unsigned char c);

static const morse_char_t morse_alphabet[] = {
  {.length = 2, .code = 0b01},   /* A */
  {.length = 4, .code = 0b1000}, /* B */
  {.length = 4, .code = 0b1010}, /* C */
  {.length = 3, .code = 0b100},  /* D */
  {.length = 1, .code = 0b0},    /* E */
  {.length = 4, .code = 0b0010}, /* F */
  {.length = 3, .code = 0b110},  /* G */
  {.length = 4, .code = 0b0000}, /* H */
  {.length = 2, .code = 0b00},   /* I */
  {.length = 4, .code = 0b0111}, /* J */
  {.length = 3, .code = 0b101},  /* K */
  {.length = 4, .code = 0b0100}, /* L */
  {.length = 2, .code = 0b11},   /* M */
  {.length = 2, .code = 0b10},   /* N */
  {.length = 3, .code = 0b111},  /* O */
  {.length = 4, .code = 0b0110}, /* P */
  {.length = 4, .code = 0b1101}, /* Q */
  {.length = 3, .code = 0b010},  /* R */
  {.length = 3, .code = 0b000},  /* S */
  {.length = 1, .code = 0b1},    /* T */
  {.length = 3, .code = 0b001},  /* U */
  {.length = 4, .code = 0b0001}, /* V */
  {.length = 3, .code = 0b011},  /* W */
  {.length = 4, .code = 0b1001}, /* X */
  {.length = 4, .code = 0b1011}, /* Y */
  {.length = 4, .code = 0b1100}, /* Z */
};

static const morse_char_t morse_number[] = {
  {.length = 5, .code = 0b01111}, /* 1 */
  {.length = 5, .code = 0b00111}, /* 2 */
  {.length = 5, .code = 0b00011}, /* 3 */
  {.length = 5, .code = 0b00001}, /* 4 */
  {.length = 5, .code = 0b00000}, /* 5 */
  {.length = 5, .code = 0b10000}, /* 6 */
  {.length = 5, .code = 0b11000}, /* 7 */
  {.length = 5, .code = 0b11100}, /* 8 */
  {.length = 5, .code = 0b11110}, /* 9 */
  {.length = 5, .code = 0b11111}, /* 0 */
};

void
morse_send (const char * msg, size_t msg_len)
{
  int i;

  for (i = 0; i < msg_len; i++) {
    const unsigned char c = msg[i];

    if (isalpha (c)) {
      send_char (c);
    } else if (isdigit (c)) {
      send_digit (c);
    } else {
      send_space ();
    }

    send_pause ();
  }
}

static void
do_pause (uint32_t duration_ms)
{
  uint32_t start_systick;

  start_systick = gSysTicks;
  while (gSysTicks == start_systick);
  while (gSysTicks < (start_systick + 1 + (duration_ms / 10)));
}

static void
do_send_morse_char (const morse_char_t * c)
{
  int pos;

  if ((c->length == 0) || (c->length > 8)) {
    DBG (DBG_LEVEL_ERROR, "Invalid morse character length");
    send_space ();
    return;
  }

  for (pos = c->length; pos > 0; pos--) {
    if (c->code & (1 << (pos - 1))) {
      tone_enable_1khz (MORSE_LONG_DURATION_MS);
    } else {
      tone_enable_1khz (MORSE_SHORT_DURATION_MS);
    }

    do_pause (MORSE_SHORT_DURATION_MS);
  }
}

static void
send_pause (void)
{
  do_pause (MORSE_PAUSE_DURATION_MS);
}

static void
send_space (void)
{
  do_pause (MORSE_SPACE_DURATION_MS);
}

static void
send_char (const unsigned char c)
{
  int offset;

  offset = toupper (c) - 'A';
  if (offset < 26) {
    do_send_morse_char (&(morse_alphabet[offset]));
  } else {
    DBG (DBG_LEVEL_ERROR, "Invalid character '%c'", c);
    send_space ();
  }
}

static void
send_digit (const unsigned char c)
{
  if (c == '0') {
    do_send_morse_char (&(morse_number[9]));
  } else {
    int offset;

    offset = c - '0';
    if (offset < 9) {
      do_send_morse_char (&(morse_number[offset - 1]));
    } else {
      DBG (DBG_LEVEL_ERROR, "Invalid digit '%c'", c);
      send_space ();
    }
  }
}
