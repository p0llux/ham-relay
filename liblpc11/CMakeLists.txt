set (CMAKE_AR arm-none-eabi-ar)

set (BOOT_SRC boot/interrupt_vector.c boot/reset.s boot/start.s)
set (LIB_SRC 
        src/debug.c
        src/system.c
        src/adc_1125.c
        src/adc_11xx.c
        src/chip_11xx.c
        src/clock_11xx.c
        src/gpio_11xx_1.c
        src/gpio_11xx_2.c
        src/gpiogroup_11xx.c
        src/i2c_11xx.c
        src/iap.c
        src/iocon_11xx.c
        src/pinint_11xx.c
        src/pmu_11xx.c
        src/ring_buffer.c
        src/ssp_11xx.c
        src/sysctl_11xx.c
        src/sysinit_11xx.c
        src/timer_11xx.c
        src/uart_11xx.c
        src/wwdt_11xx.c)

set_property (SOURCE src/debug.c PROPERTY COMPILE_DEFINITIONS __INTERNAL__)

add_library (lpc11 ${BOOT_SRC} ${LIB_SRC})
add_library (debug_uart debug/debug_uart.c)
add_library (debug_dcc debug/debug_dcc.c)
