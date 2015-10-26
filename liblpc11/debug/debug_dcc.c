#include <stdint.h>

#define TARGET_REQ_TRACEMSG              0x00
#define TARGET_REQ_DEBUGMSG_ASCII        0x01
#define TARGET_REQ_DEBUGMSG_HEXMSG(size) (0x01 | ((size & 0xff) << 8))
#define TARGET_REQ_DEBUGCHAR             0x02

/* we use the System Control Block DCRDR reg to simulate a arm7_9 dcc channel
 * DCRDR[7:0] is used by target for status
 * DCRDR[15:8] is used by target for write buffer
 * DCRDR[23:16] is used for by host for status
 * DCRDR[31:24] is used for by host for write buffer */

#define NVIC_DBG_DATA_R   (*((volatile unsigned short *)0xE000EDF8))

#define BUSY  1

static void dcc_write (uint32_t dcc_data);

void
debug_init (void)
{
}

void
debug_write (char msg)
{
  dcc_write (TARGET_REQ_DEBUGCHAR | ((msg & 0xff) << 16));
}

static void
dcc_write (uint32_t dcc_data)
{
  int len = 4;

  while (len--)
  {
    /* wait for data ready */
    while (NVIC_DBG_DATA_R & BUSY);

    /* write our data and set write flag - tell host there is data*/
    NVIC_DBG_DATA_R = (unsigned short)(((dcc_data & 0xff) << 8) | BUSY);
    dcc_data >>= 8;
  }
}

void
debug_write_n_str (const char * str, int len)
{
  uint32_t dcc_data;

  if (len < 0)
    for (len = 0; str[len] && (len < 65536); len++);

  dcc_write (TARGET_REQ_DEBUGMSG_ASCII | ((len & 0xffff) << 16));

  while (len > 0) {
    dcc_data = str[0]
      | ((len > 1) ? str[1] << 8 : 0x00)
      | ((len > 2) ? str[2] << 16 : 0x00)
      | ((len > 3) ? str[3] << 24 : 0x00);
    dcc_write(dcc_data);

    str += 4;
    len -= 4;
  }
}

void
debug_flush (void)
{
}
