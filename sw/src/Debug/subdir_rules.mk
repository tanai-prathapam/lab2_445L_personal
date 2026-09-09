################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
ADC.o: /Users/harishthehershey/Desktop/HW/ECE\ 445L\ -\ TA/ValvanoWareMSPM0_v1/inc/ADC.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"/Applications/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"ADC.d_raw" -MT"ADC.o" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

Clock.o: /Users/harishthehershey/Desktop/HW/ECE\ 445L\ -\ TA/ValvanoWareMSPM0_v1/inc/Clock.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"/Applications/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"Clock.d_raw" -MT"Clock.o" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

I2C.o: /Users/harishthehershey/Desktop/HW/ECE\ 445L\ -\ TA/ValvanoWareMSPM0_v1/inc/I2C.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"/Applications/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"I2C.d_raw" -MT"I2C.o" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

%.o: ../%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"/Applications/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

LaunchPad.o: /Users/harishthehershey/Desktop/HW/ECE\ 445L\ -\ TA/ValvanoWareMSPM0_v1/inc/LaunchPad.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"/Applications/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"LaunchPad.d_raw" -MT"LaunchPad.o" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

SSD1306.o: /Users/harishthehershey/Desktop/HW/ECE\ 445L\ -\ TA/ValvanoWareMSPM0_v1/inc/SSD1306.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"/Applications/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"SSD1306.d_raw" -MT"SSD1306.o" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

Timer.o: /Users/harishthehershey/Desktop/HW/ECE\ 445L\ -\ TA/ValvanoWareMSPM0_v1/inc/Timer.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"/Applications/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"Timer.d_raw" -MT"Timer.o" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

UART.o: /Users/harishthehershey/Desktop/HW/ECE\ 445L\ -\ TA/ValvanoWareMSPM0_v1/inc/UART.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"/Applications/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"UART.d_raw" -MT"UART.o" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

UARTbusywait.o: /Users/harishthehershey/Desktop/HW/ECE\ 445L\ -\ TA/ValvanoWareMSPM0_v1/inc/UARTbusywait.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Arm Compiler - building file: "$<"'
	"/Applications/ti/ccs2100/ccs/tools/compiler/ti-cgt-armllvm_5.1.1.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_2_11_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"UARTbusywait.d_raw" -MT"UARTbusywait.o" -I"/Users/harishthehershey/Desktop/HW/ECE 445L - TA/ValvanoWareMSPM0_v1/ECE445L_Lab2/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


