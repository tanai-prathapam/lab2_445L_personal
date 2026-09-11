################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
ADC.o: C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/inc/ADC.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"C:/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug" -I"C:/ti/mspm0_sdk_2_10_00_04/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_10_00_04/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

Clock.o: C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/inc/Clock.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"C:/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug" -I"C:/ti/mspm0_sdk_2_10_00_04/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_10_00_04/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

I2C.o: C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/inc/I2C.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"C:/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug" -I"C:/ti/mspm0_sdk_2_10_00_04/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_10_00_04/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

%.o: ../%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"C:/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug" -I"C:/ti/mspm0_sdk_2_10_00_04/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_10_00_04/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

LaunchPad.o: C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/inc/LaunchPad.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"C:/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug" -I"C:/ti/mspm0_sdk_2_10_00_04/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_10_00_04/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

SSD1306.o: C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/inc/SSD1306.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"C:/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug" -I"C:/ti/mspm0_sdk_2_10_00_04/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_10_00_04/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

Timer.o: C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/inc/Timer.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"C:/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug" -I"C:/ti/mspm0_sdk_2_10_00_04/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_10_00_04/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

UART.o: C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/inc/UART.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"C:/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug" -I"C:/ti/mspm0_sdk_2_10_00_04/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_10_00_04/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

UARTbusywait.o: C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/inc/UARTbusywait.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"C:/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug" -I"C:/ti/mspm0_sdk_2_10_00_04/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_10_00_04/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"C:/Users/aleen/Documents/College/Fall2026/Embedded/ece445l_fall26_lab_2-team-08/sw/src/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


