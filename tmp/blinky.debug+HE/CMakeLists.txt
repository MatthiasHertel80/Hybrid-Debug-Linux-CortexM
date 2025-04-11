cmake_minimum_required(VERSION 3.27)

# Roots
include("../roots.cmake")

set(CONTEXT blinky.debug+HE)
set(TARGET ${CONTEXT})
set(OUT_DIR "${SOLUTION_ROOT}/out/blinky/HE/debug")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(BIN_FILE "blinky.bin")
set(LD_SCRIPT "${SOLUTION_ROOT}/blinky/RTE/Device/AE722F80F55D5LS_M55_HE/gcc_M55_HE.ld")
set(LD_SCRIPT_PP ${LD_SCRIPT})

# Processor Options
set(CPU Cortex-M55)
set(FPU DP_FPU)
set(DSP DSP)
set(MVE FP_FVE)
set(BYTE_ORDER Little-endian)

# Toolchain config map
include("toolchain.cmake")

# Setup project
project(${CONTEXT} LANGUAGES C)

# Compilation database
add_custom_target(database
  COMMAND ${CMAKE_COMMAND} -E make_directory "${OUT_DIR}"
  COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json" "${OUT_DIR}"
)
set(CMAKE_C_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES})

# Setup context
add_executable(${CONTEXT})
set_target_properties(${CONTEXT} PROPERTIES PREFIX "" SUFFIX ".elf" OUTPUT_NAME "blinky")
set_target_properties(${CONTEXT} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${OUT_DIR})
add_library(${CONTEXT}_GLOBAL INTERFACE)

# Includes
target_include_directories(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:C,CXX>:
    ${SOLUTION_ROOT}/blinky
    ${SOLUTION_ROOT}/board
    ${SOLUTION_ROOT}/libs/board
  >
  ${SOLUTION_ROOT}/blinky/RTE/_debug_HE
  ${SOLUTION_ROOT}/blinky/RTE/Device/AE722F80F55D5LS_M55_HE
  ${CMSIS_PACK_ROOT}/ARM/CMSIS/6.0.0/CMSIS/Core/Include
  ${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/Alif_CMSIS/Include
  ${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/Device/common/include
  ${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/Device/core/M55_HE/include
  ${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/drivers/include
)

# Defines
target_compile_definitions(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:C,CXX>:
    UNICODE
    _UNICODE
    CORE_M55_HE
    _DEBUG
    M55_HE
    _RTE_
  >
)

# Compile options
target_compile_options(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:C>:
    "SHELL:${CC_CPU}"
    "SHELL:${CC_FLAGS}"
    "SHELL:${CC_BYTE_ORDER}"
    "SHELL:-std=c99"
    "SHELL:-fdata-sections"
  >
)

# Compile Options Abstractions
add_library(${CONTEXT}_ABSTRACTIONS INTERFACE)
cbuild_set_options_flags(CC "none" "on" "" "" CC_OPTIONS_FLAGS_${CONTEXT})
target_compile_options(${CONTEXT}_ABSTRACTIONS INTERFACE
  $<$<COMPILE_LANGUAGE:C>:
    "SHELL:${CC_OPTIONS_FLAGS_${CONTEXT}}"
  >
)

# Add groups and components
include("groups.cmake")
include("components.cmake")

target_link_libraries(${CONTEXT} PUBLIC
  Group_App
  Group_Board
  ARM_CMSIS_CORE_6_0_0
  AlifSemiconductor_Device_SOC_Peripherals_GPIO_1_3_0
  AlifSemiconductor_Device_SOC_Peripherals_PINCONF_1_3_0
  AlifSemiconductor_Device_Startup_C_Startup_1_3_0
  -lm -lc -lgcc
)

# Linker options
target_link_options(${CONTEXT} PUBLIC
  "SHELL:${LD_CPU}"
  "SHELL:${_LS}\"${LD_SCRIPT_PP}\""
  "SHELL:--specs=nosys.specs"
  "SHELL:--entry=Reset_Handler"
  "SHELL:-Wl,-Map=linker.map,--cref,-print-memory-usage,--gc-sections,--no-warn-rwx-segments"
)
set_target_properties(${CONTEXT} PROPERTIES LINK_DEPENDS ${LD_SCRIPT})

# Bin Conversion
 add_custom_command(TARGET ${CONTEXT} POST_BUILD COMMAND ${CMAKE_OBJCOPY} ${ELF2BIN})
