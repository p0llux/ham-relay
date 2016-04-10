#ifndef __HAVE_TX_H
#define __HAVE_TX_H

#define TX_PTT   (1 << 0)
#define TX_ROGER (1 << 1)
#define TX_CALL  (1 << 2)

void tx_init (void);

void tx_set_state (uint32_t state);
void tx_clear_state (uint32_t state);

#endif /* __HAVE_TX_H */
