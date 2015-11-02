#include <stdarg.h>
#include <string.h>

#include <debug.h>

#define BUFFER_SIZE 32

static char * dec_pos (unsigned int x, char * s);
static char * dec_neg (unsigned int x, char * s);
static char * hex (unsigned int x, char * s, char a);

int
ipow (int base, int exp)
{
  int result = 1;
  while (exp) {
    if (exp & 1)
      result *= base;
    exp >>= 1;
    base *= base;
  }

  return result;
}

int
vsprintf (char *str, const char *format, va_list ap)
{
  int d;
  char c, *s;
  int escaped = 0;
  int length = 0;
  int pos = 0;

  char buffer[BUFFER_SIZE];

  while (*format) {
    if (escaped) {
      switch (*format) {
      case '%':
        str[pos++] = '%';
        break;
      case 'c':
        str[pos++] = (char) va_arg (ap, int);
        break;
      case 'd':
        d = va_arg (ap, int);
        if (d < 0)
          s = dec_neg (d, &(buffer[BUFFER_SIZE]));
        else
          s = dec_pos (d, &(buffer[BUFFER_SIZE]));

        strcpy (&(str[pos]), s);
        pos += strlen (s);
        break;
      case 'u':
        d = va_arg (ap, int);
        s = dec_pos (d, &(buffer[BUFFER_SIZE]));

        strcpy (&(str[pos]), s);
        pos += strlen (s);
        break;
      case 's':
        s = va_arg (ap, char *);
        if (length > 0) {
          memcpy (&(str[pos]), s, length);
          pos += length;

          length = 0;
        } else {
          strcpy (&(str[pos]), s);
          pos += strlen (s);
        }
        break;
      case 'p':
        str[pos++] = '0';
        str[pos++] = 'x';
      case 'x':
        d = va_arg (ap, int);
        s = hex (d, &(buffer[BUFFER_SIZE]), 'a');

        strcpy (&(str[pos]), s);
        pos += strlen (s);
        break;
      case 'X':
        d = va_arg (ap, int);
        s = hex (d, &(buffer[BUFFER_SIZE]), 'A');

        strcpy (&(str[pos]), s);
        pos += strlen (s);
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
      str[pos++] = *format++;
    }
  }

  str[pos] = '\0';

  return pos;
}

int
sprintf (char *str, const char *format, ...)
{
  int ret;
  va_list ap;

  va_start (ap, format);
  ret = vsprintf (str, format, ap);
  va_end (ap);

  return ret;
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
