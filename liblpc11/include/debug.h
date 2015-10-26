#ifndef __HAVE_DEBUG_H
#define __HAVE_DEBUG_H

#define LEVEL_ERROR_PREFIX   "-E- "
#define LEVEL_WARNING_PREFIX "-W- "
#define LEVEL_INFO_PREFIX    "-I- "
#define LEVEL_DEBUG_PREFIX   "-D- "

#define NEWLINE       "\r\n"

typedef enum {
  DBG_LEVEL_DEBUG = 0,
  DBG_LEVEL_INFO,
  DBG_LEVEL_WARNING,
  DBG_LEVEL_ERROR,
  DBG_LEVEL_NONE,
} debug_level_t;

#if defined(DEBUG) || defined(__INTERNAL__)

void debug_init (void);
debug_level_t debug_get_level (void);
void debug_set_level (debug_level_t level);
void debug_printf (debug_level_t level, int prefix, int ln, const char *format, ...);
void debug_newline (debug_level_t level);
void debug_write (char c);
void debug_write_n_str (const char * str, int len) __attribute__ ((weak));
void debug_flush ();

#else

#define debug_init()
#define debug_get_level()
#define debug_set_level(l)
#define debug_printf(l,p,f,...)
#define debug_newline(l)
#define debug_write(c)
#define debug_write_n_str(s,l)
#define debug_flush()

#endif

#define debug_write_str(str) debug_write_n_str (str, -1)

#define DBG_NEWLINE(l)               debug_newline(l)
#define DBG(l,f,...)                 debug_printf(l, 1, 1, f, ##__VA_ARGS__)
#define DBG_NO_LN(l,f,...)           debug_printf(l, 1, 0, f, ##__VA_ARGS__)
#define DBG_NO_PREFIX(l,f,...)       debug_printf(l, 0, 1, f, ##__VA_ARGS__)
#define DBG_NO_PREFIX_NO_LN(l,f,...) debug_printf(l, 0, 0, f, ##__VA_ARGS__)

#endif /* __HAVE_DEBUG_H */
