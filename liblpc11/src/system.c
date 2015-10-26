#include <chip.h>

const uint32_t OscRateIn = 12000000;

__attribute__ ((section (".text.lpc.init")))
static void
SystemSetupClocking (void)
{
  volatile int i;

  /* Powerup main oscillator */
  Chip_SYSCTL_PowerUp(SYSCTL_POWERDOWN_SYSOSC_PD);

  /* Wait 200us for OSC to be stablized, no status
     indication, dummy wait. */
  for (i = 0; i < 0x100; i++) {}

  /* Set system PLL input to main oscillator */
  Chip_Clock_SetSystemPLLSource(SYSCTL_PLLCLKSRC_MAINOSC);

  /* Power down PLL to change the PLL divider ratio */
  Chip_SYSCTL_PowerDown(SYSCTL_POWERDOWN_SYSPLL_PD);

  /* Setup PLL for main oscillator rate (FCLKIN = 12MHz) * 4 = 48MHz
     MSEL = 3 (this is pre-decremented), PSEL = 1 (for P = 2)
     FCLKOUT = FCLKIN * (MSEL + 1) = 12MHz * 4 = 48MHz
     FCCO = FCLKOUT * 2 * P = 48MHz * 2 * 2 = 192MHz (within FCCO range) */
  Chip_Clock_SetupSystemPLL(3, 1);

  /* Powerup system PLL */
  Chip_SYSCTL_PowerUp(SYSCTL_POWERDOWN_SYSPLL_PD);

  /* Wait for PLL to lock */
  while (!Chip_Clock_IsSystemPLLLocked()) {}

  /* Set system clock divider to 1 */
  Chip_Clock_SetSysClockDiv(1);

  /* Setup FLASH access to 3 clocks */
  Chip_FMC_SetFLASHAccess(FLASHTIM_50MHZ_CPU);

  /* Set main clock source to the system PLL. This will drive 48MHz
     for the main clock and 48MHz for the system clock */
  Chip_Clock_SetMainClockSource(SYSCTL_MAINCLKSRC_PLLOUT);
}

__attribute__ ((section (".text.lpc.init")))
INLINE void
SystemInit (void)
{
  SystemSetupClocking ();

  SystemCoreClockUpdate ();

  Chip_GPIO_Init (LPC_GPIO);
  Chip_Clock_EnablePeriphClock(SYSCTL_CLOCK_IOCON);
}
