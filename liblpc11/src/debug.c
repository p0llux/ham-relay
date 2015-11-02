#include <stdarg.h>
#include <stdint.h>

#include <chip.h>
#include <debug.h>

#define BUFFER_SIZE 256

static debug_level_t debug_level = DBG_LEVEL_NONE;

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
  char buffer[BUFFER_SIZE];
  int len;

  if (level < debug_get_level ())
    return;

  if (prefix) {
    debug_write_str (debug_prefix[level]);
  }

  va_start (ap, format);
  len = vsprintf (buffer, format, ap);
  va_end (ap);

  debug_write_n_str (buffer, len);

  if (ln) {
    debug_write_str (NEWLINE);
  }

  debug_flush ();
}
