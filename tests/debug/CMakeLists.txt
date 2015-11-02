set (TARGET debug.elf)

set (CMAKE_AR arm-none-eabi-ar)

set (SRC debug.c)
set_property (SOURCE debug.c PROPERTY COMPILE_DEFINITIONS
	        __GIT_SHA1__=\"${GIT_SHA1_SHORT}\"
	        __BUILD_HOSTNAME__=\"${BUILD_HOSTNAME}\")


add_nxp_executable (${TARGET} "${SRC}")
enable_debug (debug.elf UART DBG_LEVEL_DEBUG)

target_link_libraries (${TARGET} lpc11)

