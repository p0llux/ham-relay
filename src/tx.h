#ifndef __HAVE_TX_H
#define __HAVE_TX_H

void tx_init (void);

void tx_enable (void);
void tx_disable (void);

bool tx_is_enabled (void);
bool tx_is_ready (void);

#endif /* __HAVE_TX_H */
