################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221/HTS221_Driver.c \
/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221/HTS221_Driver_HL.c \
/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb/LPS22HB_Driver.c \
/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb/LPS22HB_Driver_HL.c \
/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr/LSM303AGR_ACC_driver.c \
/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr/LSM303AGR_ACC_driver_HL.c \
/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr/LSM303AGR_MAG_driver.c \
/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr/LSM303AGR_MAG_driver_HL.c \
/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm/LSM6DSM_ACC_GYRO_driver.c \
/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm/LSM6DSM_ACC_GYRO_driver_HL.c \
/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115/STC3115_Driver.c 

OBJS += \
./Drivers/BSP/Components/HTS221_Driver.o \
./Drivers/BSP/Components/HTS221_Driver_HL.o \
./Drivers/BSP/Components/LPS22HB_Driver.o \
./Drivers/BSP/Components/LPS22HB_Driver_HL.o \
./Drivers/BSP/Components/LSM303AGR_ACC_driver.o \
./Drivers/BSP/Components/LSM303AGR_ACC_driver_HL.o \
./Drivers/BSP/Components/LSM303AGR_MAG_driver.o \
./Drivers/BSP/Components/LSM303AGR_MAG_driver_HL.o \
./Drivers/BSP/Components/LSM6DSM_ACC_GYRO_driver.o \
./Drivers/BSP/Components/LSM6DSM_ACC_GYRO_driver_HL.o \
./Drivers/BSP/Components/STC3115_Driver.o 

C_DEPS += \
./Drivers/BSP/Components/HTS221_Driver.d \
./Drivers/BSP/Components/HTS221_Driver_HL.d \
./Drivers/BSP/Components/LPS22HB_Driver.d \
./Drivers/BSP/Components/LPS22HB_Driver_HL.d \
./Drivers/BSP/Components/LSM303AGR_ACC_driver.d \
./Drivers/BSP/Components/LSM303AGR_ACC_driver_HL.d \
./Drivers/BSP/Components/LSM303AGR_MAG_driver.d \
./Drivers/BSP/Components/LSM303AGR_MAG_driver_HL.d \
./Drivers/BSP/Components/LSM6DSM_ACC_GYRO_driver.d \
./Drivers/BSP/Components/LSM6DSM_ACC_GYRO_driver_HL.d \
./Drivers/BSP/Components/STC3115_Driver.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/HTS221_Driver.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221/HTS221_Driver.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/Common" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/SensorTile" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Core/Inc"  -O0 -g1 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/Components/HTS221_Driver_HL.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221/HTS221_Driver_HL.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/Common" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/SensorTile" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Core/Inc"  -O0 -g1 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/Components/LPS22HB_Driver.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb/LPS22HB_Driver.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/Common" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/SensorTile" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Core/Inc"  -O0 -g1 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/Components/LPS22HB_Driver_HL.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb/LPS22HB_Driver_HL.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/Common" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/SensorTile" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Core/Inc"  -O0 -g1 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/Components/LSM303AGR_ACC_driver.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr/LSM303AGR_ACC_driver.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/Common" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/SensorTile" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Core/Inc"  -O0 -g1 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/Components/LSM303AGR_ACC_driver_HL.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr/LSM303AGR_ACC_driver_HL.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/Common" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/SensorTile" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Core/Inc"  -O0 -g1 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/Components/LSM303AGR_MAG_driver.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr/LSM303AGR_MAG_driver.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/Common" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/SensorTile" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Core/Inc"  -O0 -g1 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/Components/LSM303AGR_MAG_driver_HL.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr/LSM303AGR_MAG_driver_HL.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/Common" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/SensorTile" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Core/Inc"  -O0 -g1 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/Components/LSM6DSM_ACC_GYRO_driver.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm/LSM6DSM_ACC_GYRO_driver.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/Common" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/SensorTile" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Core/Inc"  -O0 -g1 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/Components/LSM6DSM_ACC_GYRO_driver_HL.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm/LSM6DSM_ACC_GYRO_driver_HL.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/Common" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/SensorTile" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Core/Inc"  -O0 -g1 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/Components/STC3115_Driver.o: /Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115/STC3115_Driver.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Projects/SensorTile/Applications/DataLog/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/CMSIS/Include" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/Common" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/hts221" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm6dsm" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lps22hb" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/lsm303agr" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/Components/stc3115" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Drivers/BSP/SensorTile" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/Third_Party/FatFs/src/drivers" -I"/Users/arunanelamaran/Development/v1.2.0UCLA/Middlewares/ST/STM32_USB_Device_Library/Core/Inc"  -O0 -g1 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


