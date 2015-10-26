#include <stdint.h>

extern uint32_t __cs3_stack;
extern uint32_t __interrupt_vector_crc;

/* Default empty handler */
void __attribute__ ((section (".cs3.reset"))) dummy_handler (void);

/* Cortex-M0 core handlers */
void __cs3_reset (void);
void nmi_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void hard_fault_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void svc_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void pend_sv_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void systick_handler (void) __attribute__ ((weak, alias ("dummy_handler")));

/* Peripherals handlers */
void wakeup_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void can_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void ssp0_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void ssp1_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void i2c_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void timer16_0_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void timer16_1_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void timer32_0_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void timer32_1_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void uart_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void adc_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void wdt_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void bod_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void pio0_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void pio1_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void pio2_handler (void) __attribute__ ((weak, alias ("dummy_handler")));
void pio3_handler (void) __attribute__ ((weak, alias ("dummy_handler")));

__attribute__ ((section (".interrupt_vector")))
const void * exception_table[] = {
  /* Configure Initial Stack Pointer, using linker-generated symbols */
  (void *) &__cs3_stack,
  (void *) __cs3_reset,

  (void *) nmi_handler,
  (void *) hard_fault_handler,
  (void *) (0UL),
  (void *) (0UL),
  (void *) (0UL),
  (void *) &__interrupt_vector_crc, /* CRC */
  (void *) (0UL),                   /* Reserved */
  (void *) (0UL),                   /* Reserved */
  (void *) (0UL),                   /* Reserved */
  (void *) svc_handler,
  (void *) (0UL),
  (void *) (0UL),                   /* Reserved */
  (void *) pend_sv_handler,
  (void *) systick_handler,

  /* Configurable interrupts */
  (void *) wakeup_handler,       /* 0:  Wakeup PIO0_0                */
  (void *) wakeup_handler,       /* 1:  Wakeup PIO0_1                */
  (void *) wakeup_handler,       /* 2:  Wakeup PIO0_2                */
  (void *) wakeup_handler,       /* 3:  Wakeup PIO0_3                */
  (void *) wakeup_handler,       /* 4:  Wakeup PIO0_4                */
  (void *) wakeup_handler,       /* 5:  Wakeup PIO0_5                */
  (void *) wakeup_handler,       /* 6:  Wakeup PIO0_6                */
  (void *) wakeup_handler,       /* 7:  Wakeup PIO0_7                */
  (void *) wakeup_handler,       /* 8:  Wakeup PIO0_8                */
  (void *) wakeup_handler,       /* 9:  Wakeup PIO0_9                */
  (void *) wakeup_handler,       /* 10: Wakeup PIO0_10               */
  (void *) wakeup_handler,       /* 11: Wakeup PIO0_11               */
  (void *) wakeup_handler,       /* 12: Wakeup PIO1_0                */

  (void *) can_handler,          /* 13: CAN                          */
  (void *) ssp1_handler,         /* 14: SSP1                         */
  (void *) i2c_handler,          /* 15: I2C0                         */
  (void *) timer16_0_handler,    /* 16: CT16B0                       */
  (void *) timer16_1_handler,    /* 17: CT16B1                       */
  (void *) timer32_0_handler,    /* 18: CT32B0                       */
  (void *) timer32_1_handler,    /* 19: CT32B1                       */
  (void *) ssp0_handler,         /* 20: SSP0                         */
  (void *) uart_handler,         /* 21: UART                         */

  (void *) (0UL),                /* 22: Reserved                     */
  (void *) (0UL),                /* 23: Reserved                     */

  (void *) adc_handler,          /* 24: A/D Converter                */
  (void *) wdt_handler,          /* 25: Watchdog                     */
  (void *) bod_handler,          /* 26: Brown-Out Detect             */

  (void *) (0UL),                /* 27: Reserved                     */

  (void *) pio3_handler,         /* 28: PIO3                         */
  (void *) pio2_handler,         /* 29: PIO2                         */
  (void *) pio1_handler,         /* 30: PIO1                         */
  (void *) pio0_handler,         /* 31: PIO0                         */
};

void __attribute__ ((section (".cs3.reset")))
dummy_handler (void)
{
  while (1);
}
