#include <chip.h>

#define LED_STATUS_PIO   IOCON_PIO3_0
#define LED_STATUS_PORT  3
#define LED_STATUS_PIN   0

#define UART_PORT LPC_USART

static void
configure_uart (void)
{
  Chip_IOCON_PinMuxSet (LPC_IOCON, IOCON_PIO1_6, IOCON_MODE_INACT | IOCON_FUNC1);
  Chip_IOCON_PinMuxSet (LPC_IOCON, IOCON_PIO1_7, IOCON_MODE_INACT | IOCON_FUNC1);

  Chip_UART_Init (UART_PORT);
  Chip_UART_SetBaud (UART_PORT, 115200);
  Chip_UART_ConfigData (UART_PORT, (UART_LCR_WLEN8 | UART_LCR_SBS_1BIT));
  Chip_UART_TXEnable (UART_PORT);
}

void
main (void)
{
  volatile int i;

  SystemInit ();

  /* configure UART */
  configure_uart ();

  /* configure LED output */
  Chip_IOCON_PinMuxSet (LPC_IOCON, LED_STATUS_PIO, IOCON_MODE_INACT | IOCON_FUNC0);
  Chip_GPIO_SetPinDIROutput (LPC_GPIO, LED_STATUS_PORT, LED_STATUS_PIN);
  Chip_GPIO_SetPinState (LPC_GPIO, LED_STATUS_PORT, LED_STATUS_PIN, false);

  for (i = 0; i < 0x800000; i++);

  while (1) {
    /* toggle LED */
    Chip_GPIO_SetPinToggle (LPC_GPIO, LED_STATUS_PORT, LED_STATUS_PIN);

    Chip_UART_SendBlocking (UART_PORT, "Hello world !!!\n\r", 17);

    for (i = 0; i < 0x400000; i++);
  }
}
