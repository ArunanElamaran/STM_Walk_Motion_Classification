################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/SW4STM32/startup_stm32l476xx.s 

OBJS += \
./DataLog/SW4STM32/startup_stm32l476xx.o 


# Each subdirectory must supply rules for building sources it contributes
DataLog/SW4STM32/startup_stm32l476xx.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/SW4STM32/startup_stm32l476xx.s
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Assembler'
	@echo $(PWD)
	arm-none-eabi-as -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -I../../../Inc -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../../../../../../../Drivers/STM32L4xx_HAL_Driver/Inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../Drivers/BSP/Components/hts221 -I../../../../../../../Drivers/BSP/Components/lsm6dsm -I../../../../../../../Drivers/BSP/Components/lps22hb -I../../../../../../../Drivers/BSP/Components/lsm303agr -I../../../../../../../Drivers/BSP/SensorTile -I../../../../../../../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../../../../../../../Middlewares/Third_Party/FatFs/src -I../../../../../../../Middlewares/Third_Party/FatFs/src/drivers -I../../../../../../../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -g -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


