/**
  ******************************************************************************
  * @file    DataLog/Src/datalog_application.c
  * @author  Central Labs
  * @version V1.1.0
  * @date    27-Sept-2016
  * @brief   This file provides a set of functions to handle the datalog
  *          application.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT(c) 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "datalog_application.h"
#include "main.h"
#include "string.h"
#include "SensorTile.h"
#include <math.h>
    
/* FatFs includes component */
#include "ff_gen_drv.h"
#include "sd_diskio.h"

FRESULT res;                                          /* FatFs function common result code */
uint32_t byteswritten, bytesread;                     /* File write/read counts */
FATFS SDFatFs;  /* File system object for SD card logical drive */
FIL MyFile;     /* File object */
char SDPath[4]; /* SD card logical drive path */
    
volatile uint8_t SD_Log_Enabled = 0;
static uint8_t verbose = 0;  /* Verbose output to UART terminal ON/OFF. */

static char dataOut[256];
char newLine[] = "\r\n";

/**
  * @brief  Start SD-Card demo
  * @param  None
  * @retval None
  */
void DATALOG_SD_Init(void)
{
  char SDPath[4];
    
  if(FATFS_LinkDriver(&SD_Driver, SDPath) == 0)
  {
    /* Register the file system object to the FatFs module */
    if(f_mount(&SDFatFs, (TCHAR const*)SDPath, 0) != FR_OK)
    {
      /* FatFs Initialization Error */
      while(1)
      {
        BSP_LED_On(LED1);
        HAL_Delay(500);
        BSP_LED_Off(LED1);
        HAL_Delay(100);
      }
    }
  }
}
  
/**
  * @brief  Start SD-Card demo
  * @param  None
  * @retval None
  */
uint8_t DATALOG_SD_Log_Enable(void)
{
  static uint16_t sdcard_file_counter = 0;
  //char header[] = "Timestamp\tAccX [mg]\tAccY [mg]\tAccZ [mg]\tGyroX [mdps]\tGyroY [mdps]\tGyroZ [mdps]\tMagX [mgauss]\tMagY [mgauss]\tMagZ [mgauss]\tP [mB]\tT [�C]\tH [%]\tVOL [mV]\tBAT [%]\r\n";
  char header[] = " ";
  uint32_t byteswritten; /* written byte count */
  char file_name[30] = {0};
  
  /* SD SPI CS Config */
  SD_IO_CS_Init();
  
  sprintf(file_name, "%s%.3d%s", "SensorTile_Log_N", sdcard_file_counter, ".tsv");
  sdcard_file_counter++;

  HAL_Delay(100);

  if(f_open(&MyFile, (char const*)file_name, FA_CREATE_ALWAYS | FA_WRITE) != FR_OK)
  {
    return 0;
  }
  
  if(f_write(&MyFile, (const void*)&header, sizeof(header)-1, (void *)&byteswritten) != FR_OK)
  {
    return 0;
  }
  return 1;
}

/**
  * @brief  Disable SDCard Log
  * @param  None
  * @retval None
  */
void DATALOG_SD_Log_Disable(void)
{
  f_close(&MyFile);
  
  /* SD SPI Config */
  SD_IO_CS_DeInit();
}

/**
  * @brief  Write New Line to file
  * @param  None
  * @retval None
  */
void DATALOG_SD_NewLine(void)
{
  uint32_t byteswritten; /* written byte count */
  f_write(&MyFile, (const void*)&newLine, 2, (void *)&byteswritten);
}

void RTC_Handler( RTC_HandleTypeDef *RtcHandle)
{

	if(SendOverUSB) // Write data on the USB
	{
		sprintf( dataOut, "\r%d, ", HAL_GetTick());
		CDC_Fill_Buffer(( uint8_t * )dataOut, strlen( dataOut ));
	}
	else if(SD_Log_Enabled) // Write data to the file on the SDCard
	{
		uint8_t size;
		size = sprintf( dataOut, "\n%d, ", HAL_GetTick());
		res = f_write(&MyFile, dataOut, size, (void *)&byteswritten);
	}
}



/**
* @brief  Handles the accelerometer axes data getting/sending
* @param  handle the device handle
* @retval None
*/
void Accelero_Sensor_Handler( void *handle, uint32_t msTick, uint32_t *msTickStateChange, uint8_t *state )
{
  
  uint8_t who_am_i;
  float odr;
  float fullScale;
  float x, y, z;
  uint8_t id;
  SensorAxes_t acceleration;
  uint8_t status;
  int32_t d1, d2, d3, d4, d5, d6;
  

  BSP_ACCELERO_Get_Instance( handle, &id );
  
  BSP_ACCELERO_IsInitialized( handle, &status );
  
  if ( status == 1 )
  {
    if ( BSP_ACCELERO_Get_Axes( handle, &acceleration ) == COMPONENT_ERROR )
    {
      acceleration.AXIS_X = 0;
      acceleration.AXIS_Y = 0;
      acceleration.AXIS_Z = 0;
    }
    
    if(SendOverUSB) /* Write data on the USB */
    {
    	//convert the int32 data type into float data type to enable floating point computation
    	//Store float variable in respective variables
    	//x = (float) acceleration.AXIS_X;
    	//y = (float) acceleration.AXIS_Y;
    	//z = (float) acceleration.AXIS_Z;

    	sprintf( dataOut, "%d, %d, %i",
    			acceleration.AXIS_X, acceleration.AXIS_Y, (int) acceleration.AXIS_Z/10);

    	CDC_Fill_Buffer((uint8_t *)dataOut, strlen(dataOut));

      if ( verbose == 1 )
      {
        if ( BSP_ACCELERO_Get_WhoAmI( handle, &who_am_i ) == COMPONENT_ERROR )
        {
          sprintf( dataOut, "WHO AM I address[%d]: ERROR\n", id );
        }
        else
        {
          sprintf( dataOut, "WHO AM I address[%d]: 0x%02X\n", id, who_am_i );
        }
        
        CDC_Fill_Buffer(( uint8_t * )dataOut, strlen( dataOut ));
        
        if ( BSP_ACCELERO_Get_ODR( handle, &odr ) == COMPONENT_ERROR )
        {
          sprintf( dataOut, "ODR[%d]: ERROR\n", id );
        }
        else
        {
          floatToInt( odr, &d1, &d2, 3 );
          sprintf( dataOut, "ODR[%d]: %d.%03d Hz\n", (int)id, (int)d1, (int)d2 );
        }
        
        CDC_Fill_Buffer(( uint8_t * )dataOut, strlen( dataOut ));
        
        if ( BSP_ACCELERO_Get_FS( handle, &fullScale ) == COMPONENT_ERROR )
        {
          sprintf( dataOut, "FS[%d]: ERROR\n", id );
        }
        else
        {
          floatToInt( fullScale, &d1, &d2, 3 );
          sprintf( dataOut, "FS[%d]: %d.%03d g\n", (int)id, (int)d1, (int)d2 );
        }
        
        CDC_Fill_Buffer(( uint8_t * )dataOut, strlen( dataOut ));
      }
    }
    else if(SD_Log_Enabled) /* Write data to the file on the SDCard */
    {
      uint8_t size;
      size = sprintf(dataOut, "%d\t%d\t%d\t", (int)acceleration.AXIS_X, (int)acceleration.AXIS_Y, (int)acceleration.AXIS_Z);
      res = f_write(&MyFile, dataOut, size, (void *)&byteswritten);
    }
  }
}



/**
* @brief  Handles the gyroscope axes data getting/sending
* @param  handle the device handle
* @retval None
*/
void Gyro_Sensor_Handler( void *handle )
{
  
  uint8_t who_am_i;
  float odr;
  float fullScale;
  uint8_t id;
  SensorAxes_t angular_velocity;
  uint8_t status;
  int32_t d1, d2;
  
  BSP_GYRO_Get_Instance( handle, &id );
  
  BSP_GYRO_IsInitialized( handle, &status );
  
  if ( status == 1 )
  {
    if ( BSP_GYRO_Get_Axes( handle, &angular_velocity ) == COMPONENT_ERROR )
    {
      angular_velocity.AXIS_X = 0;
      angular_velocity.AXIS_Y = 0;
      angular_velocity.AXIS_Z = 0;
    }
    
    if(SendOverUSB) //Write data on the USB
    {
    	/*uint32_t abs_acc2;
    	abs_acc2 = ((int)angular_velocity.AXIS_X * (int)angular_velocity.AXIS_X);
    	abs_acc2 += ((int)angular_velocity.AXIS_Y * (int)angular_velocity.AXIS_Y);
    	abs_acc2 += ((int)angular_velocity.AXIS_Z * (int)angular_velocity.AXIS_Z);
    	abs_acc2 = sqrt((float) abs_acc2);*/


      sprintf( dataOut, ", %i, %i, %i\n",
    		  (int) angular_velocity.AXIS_X/1000, (int) angular_velocity.AXIS_Y/1000, (int) angular_velocity.AXIS_Z/1000);
      CDC_Fill_Buffer(( uint8_t * )dataOut, strlen( dataOut ));

      if ( verbose == 1 )
      {
        if ( BSP_GYRO_Get_WhoAmI( handle, &who_am_i ) == COMPONENT_ERROR )
        {
          sprintf( dataOut, "WHO AM I address[%d]: ERROR\n", id );
        }
        else
        {
          sprintf( dataOut, "WHO AM I address[%d]: 0x%02X\n", id, who_am_i );
        }
        
        CDC_Fill_Buffer(( uint8_t * )dataOut, strlen( dataOut ));
        
        if ( BSP_GYRO_Get_ODR( handle, &odr ) == COMPONENT_ERROR )
        {
          sprintf( dataOut, "ODR[%d]: ERROR\n", id );
        }
        else
        {
          floatToInt( odr, &d1, &d2, 3 );
          sprintf( dataOut, "ODR[%d]: %d.%03d Hz\n", (int)id, (int)d1, (int)d2 );
        }
        
        CDC_Fill_Buffer(( uint8_t * )dataOut, strlen( dataOut ));
        
        if ( BSP_GYRO_Get_FS( handle, &fullScale ) == COMPONENT_ERROR )
        {
          sprintf( dataOut, "FS[%d]: ERROR\n", id );
        }
        else
        {
          floatToInt( fullScale, &d1, &d2, 3 );
          sprintf( dataOut, "FS[%d]: %d.%03d dps\n", (int)id, (int)d1, (int)d2 );
        }
        
        CDC_Fill_Buffer(( uint8_t * )dataOut, strlen( dataOut ));
      }
    }
    else if(SD_Log_Enabled) // Write data to the file on the SDCard
    {
      uint8_t size;
      size = sprintf(dataOut, "%d\t%d\t%d\t", (int)angular_velocity.AXIS_X, (int)angular_velocity.AXIS_Y, (int)angular_velocity.AXIS_Z);
      res = f_write(&MyFile, dataOut, size, (void *)&byteswritten);
    }
  }
}




/**
* @brief  Splits a float into two integer values.
* @param  in the float value as input
* @param  out_int the pointer to the integer part as output
* @param  out_dec the pointer to the decimal part as output
* @param  dec_prec the decimal precision to be used
* @retval None
*/
void floatToInt( float in, int32_t *out_int, int32_t *out_dec, int32_t dec_prec )
{
  *out_int = (int32_t)in;
  if(in >= 0.0f)
  {
    in = in - (float)(*out_int);
  }
  else
  {
    in = (float)(*out_int) - in;
  }
  *out_dec = (int32_t)trunc(in * pow(10, dec_prec));
}

/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
