set (VERSION_MAJOR 0)
set (VERSION_MINOR 1)
set (VERSION_REV 0)

add_definitions (-DVERSION_STR=\"${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_REV}\"
                 -DVERSION_MAJOR=${VERSION_MAJOR}
		 -DVERSION_MINOR=${VERSION_MINOR}
		 -DVERSION_REV=${VERSION_REV})
set_property (SOURCE main.c PROPERTY COMPILE_DEFINITIONS
	      __GIT_SHA1__=\"${GIT_SHA1_SHORT}\"
	      __BUILD_HOSTNAME__=\"${BUILD_HOSTNAME}\")


set (SRC
	call.c
	inputs.c
	main.c
	morse.c
	roger-beep.c
	status.c
	systick.c
	tone.c
	tx.c
	)

set (TARGET ham-relay.elf)

add_nxp_executable (${TARGET} "${SRC}")
enable_debug (${TARGET} UART DBG_LEVEL_DEBUG)
target_link_libraries (${TARGET} lpc11)

