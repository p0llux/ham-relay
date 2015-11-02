cmake_minimum_required (VERSION 2.6)

# remove -rdynamic at link time
set (CMAKE_SHARED_LIBRARY_LINK_C_FLAGS)

set (CMAKE_SYSTEM_NAME Generic)

set (CMAKE_ASM_COMPILER arm-none-eabi-as)
set (CMAKE_C_COMPILER arm-none-eabi-gcc)
set (CMAKE_AR arm-none-eabi-ar)
set (CMAKE_SIZE arm-none-eabi-size)
set (CMAKE_OBJCOPY arm-none-eabi-objcopy)
set (CMAKE_OBJDUMP arm-none-eabi-objdump)
set (CMAKE_OPENOCD openocd)
set (CMAKE_SOCAT socat)

set (OPENOCD_HOST localhost)
set (OPENOCD_PORT 4444)

set_property (GLOBAL PROPERTY ALLOW_DUPLICATE_CUSTOM_TARGETS 1)

project (arm ASM C)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMakeModules/")
include(GetGitRevisionDescription)
get_git_head_revision(GIT_REFSPEC GIT_SHA1)
string (SUBSTRING ${GIT_SHA1} 0 12 GIT_SHA1_SHORT)

site_name (BUILD_HOSTNAME)

function(add_hex_target INPUT)
  get_filename_component (BIN_NAME ${INPUT} NAME_WE)
  get_directory_property (CLEAN_FILES ADDITIONAL_MAKE_CLEAN_FILES)
  add_custom_target (hex
    COMMAND ${CMAKE_OBJCOPY} -O ihex ${INPUT} ${BIN_NAME}.hex
    DEPENDS ${INPUT}
    COMMENT "Building HEX file")
  set_directory_properties(PROPERTIES ADDITIONAL_MAKE_CLEAN_FILES "${CLEAN_FILES};${BIN_NAME}.hex")
endfunction(add_hex_target)

function(make_bin_firmware INPUT)
  get_filename_component (BIN_NAME ${INPUT} NAME_WE)
  get_directory_property (CLEAN_FILES ADDITIONAL_MAKE_CLEAN_FILES)
  add_custom_command(TARGET ${INPUT}
    COMMAND ${CMAKE_OBJCOPY} -O binary ${INPUT} ${BIN_NAME}.bin
    COMMENT "Creating ${BIN_NAME}.bin")
  set_directory_properties(PROPERTIES ADDITIONAL_MAKE_CLEAN_FILES "${CLEAN_FILES};${BIN_NAME}.bin")
endfunction(make_bin_firmware)

function(make_objdump INPUT)
  get_filename_component (LST_NAME ${INPUT} NAME_WE)
  get_directory_property (CLEAN_FILES ADDITIONAL_MAKE_CLEAN_FILES)
  add_custom_command(TARGET ${INPUT}
    COMMAND ${CMAKE_OBJDUMP} -h -S ${INPUT} > ${LST_NAME}.lst
    COMMENT "Creating ${LST_NAME}.lst")
  set_directory_properties(PROPERTIES ADDITIONAL_MAKE_CLEAN_FILES "${CLEAN_FILES};${LST_NAME}.lst")
endfunction(make_objdump)

function(show_bin_size INPUT)
  add_custom_command(TARGET ${INPUT}
    COMMAND ${CMAKE_SIZE} ${INPUT}
    COMMENT "Flash usage of ${INPUT}:")
endfunction(show_bin_size)

function(generate_map_file INPUT)
  get_filename_component (MAP_NAME ${INPUT} NAME_WE)
  get_directory_property (CLEAN_FILES ADDITIONAL_MAKE_CLEAN_FILES)
  set_target_properties(${INPUT} PROPERTIES LINK_FLAGS "-Wl,-Map,${MAP_NAME}.map")
  set_directory_properties(PROPERTIES ADDITIONAL_MAKE_CLEAN_FILES "${CLEAN_FILES};${MAP_NAME}.map")
endfunction(generate_map_file)

function(enable_debug TARGET MODE DBG_LEVEL)
  set_property (TARGET ${TARGET} PROPERTY COMPILE_DEFINITIONS DEBUG)
  add_definitions (-DDEBUG_${MODE} -DDEBUG_LEVEL=${DBG_LEVEL})
  string (TOLOWER ${MODE} LIB_SUFFIX)
  target_link_libraries (${TARGET} debug_${LIB_SUFFIX})
endfunction(enable_debug)

function(add_flash_server_target INPUT TARGET_SUFFIX SERVER_PORT)
  get_filename_component (BIN_NAME ${INPUT} NAME_WE)
  add_custom_target (flash-${TARGET_SUFFIX}
    COMMAND echo 'reset init' | ${CMAKE_SOCAT} - TCP:${OPENOCD_HOST}:${SERVER_PORT} > /dev/null
    COMMAND echo 'flash write_image erase unlock ${CMAKE_CURRENT_SOURCE_DIR}/${BIN_NAME}.bin 0x00' | ${CMAKE_SOCAT} - TCP:${OPENOCD_HOST}:${SERVER_PORT} > /dev/null
    COMMAND echo 'verify_image ${CMAKE_CURRENT_SOURCE_DIR}/${BIN_NAME}.bin 0x00' | ${CMAKE_SOCAT} - TCP:${OPENOCD_HOST}:${SERVER_PORT} > /dev/null
    COMMAND echo 'sleep 500' | ${CMAKE_SOCAT} - TCP:${OPENOCD_HOST}:${SERVER_PORT} > /dev/null
    COMMAND echo 'reset run' | ${CMAKE_SOCAT} - TCP:${OPENOCD_HOST}:${SERVER_PORT} > /dev/null
    DEPENDS ${INPUT}
    COMMENT "Flashing board through OpenOCD server")
  add_custom_target (reset-${TARGET_SUFFIX}
    COMMAND echo 'reset init' | ${CMAKE_SOCAT} - TCP:${OPENOCD_HOST}:${SERVER_PORT} > /dev/null
    COMMAND echo 'reset run' | ${CMAKE_SOCAT} - TCP:${OPENOCD_HOST}:${SERVER_PORT} > /dev/null
    COMMENT "Resetting board through OpenOCD server")
endfunction(add_flash_server_target)

function(add_nxp_executable TARGET_NAME SOURCES)
  add_executable (${TARGET_NAME} ${SOURCES})
  add_flash_server_target (${TARGET_NAME} server ${OPENOCD_PORT})

  include_directories (${PROJECT_SOURCE_DIR}/liblpc)
  generate_map_file (${TARGET_NAME})
  make_bin_firmware (${TARGET_NAME})
  make_objdump (${TARGET_NAME})
  show_bin_size (${TARGET_NAME})

  add_hex_target (${TARGET_NAME})

  get_target_property(TEMP ${TARGET_NAME} LINK_FLAGS)
  if(TEMP STREQUAL "TEMP-NOTFOUND")
    SET(TEMP "-Tlpc1114.ld")
  else()
    SET(TEMP "-Tlpc1114.ld ${TEMP}" )
  endif()
  set_target_properties(${TARGET_NAME} PROPERTIES LINK_FLAGS ${TEMP} )
endfunction(add_nxp_executable)

set (COMMON_FLAGS "-DCORE_M0 -Os -mthumb -mcpu=cortex-m0 -msoft-float -mno-sched-prolog -ffunction-sections -fdata-sections -ggdb")
set (CMAKE_C_FLAGS ${COMMON_FLAGS})
set (CMAKE_EXE_LINKER_FLAGS "-Os -Wl,-gc-sections -Os -mthumb -mcpu=cortex-m0")

set (CMAKE_INCLUDE_CURRENT_DIR ON)

include_directories (${PROJECT_SOURCE_DIR}/liblpc11/include)
link_directories (${PROJECT_SOURCE_DIR}/liblpc11)

add_subdirectory (liblpc11)

#add_subdirectory (src)
add_subdirectory (tests)

