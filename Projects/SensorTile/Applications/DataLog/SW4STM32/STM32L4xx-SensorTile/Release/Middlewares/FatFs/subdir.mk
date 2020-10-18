################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/diskio.c \
/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/ff.c \
/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/ff_gen_drv.c \
/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers/sd_diskio.c \
/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/option/syscall.c \
/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/option/unicode.c 

OBJS += \
./Middlewares/FatFs/diskio.o \
./Middlewares/FatFs/ff.o \
./Middlewares/FatFs/ff_gen_drv.o \
./Middlewares/FatFs/sd_diskio.o \
./Middlewares/FatFs/syscall.o \
./Middlewares/FatFs/unicode.o 

C_DEPS += \
./Middlewares/FatFs/diskio.d \
./Middlewares/FatFs/ff.d \
./Middlewares/FatFs/ff_gen_drv.d \
./Middlewares/FatFs/sd_diskio.d \
./Middlewares/FatFs/syscall.d \
./Middlewares/FatFs/unicode.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/FatFs/diskio.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/diskio.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/Common" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/SensorTile" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Core/Inc"  -O0 -g1 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/FatFs/ff.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/ff.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/Common" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/SensorTile" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Core/Inc"  -O0 -g1 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/FatFs/ff_gen_drv.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/ff_gen_drv.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/Common" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/SensorTile" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Core/Inc"  -O0 -g1 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/FatFs/sd_diskio.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers/sd_diskio.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/Common" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/SensorTile" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Core/Inc"  -O0 -g1 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/FatFs/syscall.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/option/syscall.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/Common" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/SensorTile" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Core/Inc"  -O0 -g1 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/FatFs/unicode.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/option/unicode.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/Common" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/SensorTile" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Core/Inc"  -O0 -g1 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


