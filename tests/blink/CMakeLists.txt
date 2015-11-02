set (TARGET blink.elf)

set (CMAKE_AR arm-none-eabi-ar)

set (SRC blink.c)

add_nxp_executable (${TARGET} "${SRC}")
target_link_libraries (${TARGET} lpc11)

