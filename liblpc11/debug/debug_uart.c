#include <chip.h>

void
debug_init (void)
{
  Chip_IOCON_PinMuxSet (LPC_IOCON, IOCON_PIO1_6, IOCON_MODE_INACT | IOCON_FUNC1);
  Chip_IOCON_PinMuxSet (LPC_IOCON, IOCON_PIO1_7, IOCON_MODE_INACT | IOCON_FUNC1);

  Chip_UART_Init (LPC_USART);
  Chip_UART_SetBaud (LPC_USART, 57600);
  Chip_UART_ConfigData (LPC_USART, (UART_LCR_WLEN8 | UART_LCR_SBS_1BIT));
  Chip_UART_TXEnable (LPC_USART);
}

void
debug_write (char c)
{
  Chip_UART_SendBlocking (LPC_USART, &c, 1);
}

void
debug_flush (void)
{
}
