# components.cmake

# component ARM::CMSIS:CORE@6.0.0
add_library(ARM_CMSIS_CORE_6_0_0 INTERFACE)
target_include_directories(ARM_CMSIS_CORE_6_0_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/ARM/CMSIS/6.0.0/CMSIS/Core/Include
)
target_compile_definitions(ARM_CMSIS_CORE_6_0_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(ARM_CMSIS_CORE_6_0_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component AlifSemiconductor::Device:SOC Peripherals:GPIO@1.3.0
add_library(AlifSemiconductor_Device_SOC_Peripherals_GPIO_1_3_0 OBJECT
  "${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/Alif_CMSIS/Source/Driver_GPIO_Private.h"
  "${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/Alif_CMSIS/Source/Driver_GPIO.c"
)
target_include_directories(AlifSemiconductor_Device_SOC_Peripherals_GPIO_1_3_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/Alif_CMSIS/Include
  ${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/drivers/include
)
target_compile_definitions(AlifSemiconductor_Device_SOC_Peripherals_GPIO_1_3_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(AlifSemiconductor_Device_SOC_Peripherals_GPIO_1_3_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(AlifSemiconductor_Device_SOC_Peripherals_GPIO_1_3_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component AlifSemiconductor::Device:SOC Peripherals:PINCONF@1.3.0
add_library(AlifSemiconductor_Device_SOC_Peripherals_PINCONF_1_3_0 OBJECT
  "${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/drivers/source/pinconf.c"
)
target_include_directories(AlifSemiconductor_Device_SOC_Peripherals_PINCONF_1_3_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/drivers/include
)
target_compile_definitions(AlifSemiconductor_Device_SOC_Peripherals_PINCONF_1_3_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(AlifSemiconductor_Device_SOC_Peripherals_PINCONF_1_3_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(AlifSemiconductor_Device_SOC_Peripherals_PINCONF_1_3_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component AlifSemiconductor::Device:Startup&C Startup@1.3.0
add_library(AlifSemiconductor_Device_Startup_C_Startup_1_3_0 OBJECT
  "${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/Device/common/source/clk.c"
  "${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/Device/common/source/mpu_M55.c"
  "${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/Device/common/source/system_M55.c"
  "${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/Device/common/source/system_utils.c"
  "${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/Device/common/source/tcm_partition.c"
  "${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/Device/common/source/tgu_M55.c"
  "${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/Device/core/M55_HE/source/startup_M55_HE.c"
)
target_include_directories(AlifSemiconductor_Device_Startup_C_Startup_1_3_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${SOLUTION_ROOT}/blinky/RTE/Device/AE722F80F55D5LS_M55_HE
  ${CMSIS_PACK_ROOT}/AlifSemiconductor/Ensemble/1.3.0/Device/common/include
)
target_compile_definitions(AlifSemiconductor_Device_Startup_C_Startup_1_3_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(AlifSemiconductor_Device_Startup_C_Startup_1_3_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(AlifSemiconductor_Device_Startup_C_Startup_1_3_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)
