#include <chip.h>
#include <debug.h>

volatile uint32_t gSysTicks = 0;

void
systick_init (void)
{
  SysTick_Config (SystemCoreClock / 1000);
}

void
systick_delay (uint32_t delay_ms)
{
  uint32_t t_start = gSysTicks;

  while ((gSysTicks - t_start) < delay_ms);
}

void
systick_handler_default (void)
{
  gSysTicks++;
}

void systick_handler (void) __attribute__ ((weak, alias ("systick_handler_default")));
