#include <stdarg.h>
#include <stdint.h>

#include <chip.h>
#include <debug.h>

#define BUFFER_SIZE 256

static debug_level_t debug_level = DBG_LEVEL_NONE;

static char * dec_pos (unsigned int x, char * s);
static char * dec_neg (unsigned int x, char * s);
static char * hex (unsigned int x, char * s, char a);

static const char * debug_prefix[] = {
  LEVEL_DEBUG_PREFIX,
  LEVEL_INFO_PREFIX,
  LEVEL_WARNING_PREFIX,
  LEVEL_ERROR_PREFIX,
};

debug_level_t
debug_get_level (void)
{
  debug_level_t ret;

  __disable_irq ();
  ret = debug_level;
  __enable_irq ();

  return ret;
}

void
debug_set_level (debug_level_t level)
{
  __disable_irq ();

  if (level < 0 || level >= DBG_LEVEL_NONE)
    debug_level = DBG_LEVEL_NONE;
  else
    debug_level = level;

  __enable_irq ();
}

void
debug_write_n_str (const char * str, int len)
{
  int pos;

  if (len > 0) {
    for (pos = 0; pos < len; pos++)
      debug_write (*str++);
  } else {
    while (*str) {
      debug_write (*str++);
    }
  }
}

void
debug_newline (debug_level_t level)
{
  if (level < debug_get_level ())
    return;

  debug_write_str (NEWLINE);
}

void
debug_printf (debug_level_t level, int prefix, int ln, const char *format, ...)
{
  va_list ap;
  int d;
  char c, *s;
  int escaped = 0;
  int length = -1;
  char buffer[BUFFER_SIZE];

  if (level < debug_get_level ())
    return;

  if (prefix) {
    debug_write_str (debug_prefix[level]);
  }

  va_start (ap, format);
  while (*format) {
    if (escaped) {
      switch (*format) {
      case '%':
        debug_write ('%');
        break;
      case 'c':
        c = (char) va_arg (ap, int);
        debug_write (c);
        break;
      case 'd':
        d = va_arg (ap, int);
        if (d < 0)
          debug_write_str (dec_neg (d, &(buffer[BUFFER_SIZE])));
        else
          debug_write_str (dec_pos (d, &(buffer[BUFFER_SIZE])));
        break;
      case 'u':
        d = va_arg (ap, int);
        debug_write_str (dec_pos (d, &(buffer[BUFFER_SIZE])));
        break;
      case 's':
        s = va_arg (ap, char *);
        debug_write_n_str (s, length);
        break;
      case 'x':
        d = va_arg (ap, int);
        debug_write_str (hex (d, &(buffer[BUFFER_SIZE]), 'a'));
        break;
      case 'X':
        d = va_arg (ap, int);
        debug_write_str (hex (d, &(buffer[BUFFER_SIZE]), 'A'));
        break;
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        length = *format - '0';
        escaped = 2;
        break;
      }
      escaped--;
      format++;
    } else if (*format == '%') {
      escaped = 1;
      format++;
    } else {
      const char * pos = format;

      while (*pos) {
        if (*pos == '%')
          break;

        pos++;
      }

      debug_write_n_str ((char *) format, pos - format);

      format = pos;
    }
  }
  va_end (ap);

  if (ln) {
    debug_write_str (NEWLINE);
  }

  debug_flush ();
}

static char *
dec_pos (unsigned int x, char * s)
{
  *--s = 0;
  if (!x) *--s = '0';
  for (; x; x /= 10)
    *--s = '0' + (x % 10);

  return s;
}

static char *
dec_neg (unsigned int x, char * s)
{
  x ^= 0xFFFFFFFF;
  x += 1;

  *--s = 0;
  if (!x) *--s = '0';
  for (; x; x /= 10)
    *--s = '0' + (x % 10);

  *--s = '-';

  return s;
}

static char *
hex (unsigned int x, char * s, char a)
{
  char * start = s;

  *--s = 0;
  if (!x) *--s = '0';
  for (; x; x /= 16) {
    uint16_t mod = (x % 16);

    if (mod > 9) {
      *--s = a + (mod - 10);
    } else {
      *--s = '0' + mod;
    }
  }

  if (!((start - s) % 2)) {
    *--s = '0';
  }

  return s;
}
