/**
******************************************************************************
* @file    DataLog/Src/main.c
* @author  Central Labs
* @version V1.1.1
* @date    06-Dec-2016
* @brief   Main program body
******************************************************************************
* @attention
*
* <h2><center>&copy; COPYRIGHT(c) 2016 STMicroelectronics</center></h2>
*
* Redistribution and use in source and binary forms, with or without modification,
* are permitted provided that the following conditions are met:
*   1. Redistributions of source code must retain the above copyright notice,
*      this list of conditions and the following disclaimer.
*   2. Redistributions in binary form must reproduce the above copyright notice,
*      this list of conditions and the following disclaimer in the documentation
*      and/or other materials provided with the distribution.
*   3. Neither the name of STMicroelectronics nor the names of its contributors
*      may be used to endorse or promote products derived from this software
*      without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
* CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
******************************************************************************
*/

/* Includes ------------------------------------------------------------------*/

#include <string.h> /* strlen */
#include <stdio.h>  /* sprintf */
#include <math.h>   /* trunc */
#include "main.h"

#include "datalog_application.h"
#include "usbd_cdc_interface.h"

/* FatFs includes component */
#include "ff_gen_drv.h"
#include "sd_diskio.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Data acquisition period [ms] */
#define DATA_PERIOD_MS (5) //Try out 5.
#define TOTAL_TIME     9000
#define INTERVAL       5
//#define NOT_DEBUGGING

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/

/* SendOverUSB = 0  --> Save sensors data on SDCard (enable with double click) */
/* SendOverUSB = 1  --> Send sensors data via USB */
uint8_t SendOverUSB = 1;

USBD_HandleTypeDef  USBD_Device;
static volatile uint8_t MEMSInterrupt = 0;
static volatile uint8_t acquire_data_enable_request  = 1;
static volatile uint8_t acquire_data_disable_request = 0;
static volatile uint8_t no_H_HTS221 = 0;
static volatile uint8_t no_T_HTS221 = 0;
static volatile uint8_t no_GG = 0;

static RTC_HandleTypeDef RtcHandle;
static void *LSM6DSM_X_0_handle = NULL;
static void *LSM6DSM_G_0_handle = NULL;
static void *LSM303AGR_X_0_handle = NULL;
static void *LSM303AGR_M_0_handle = NULL;
static void *LPS22HB_P_0_handle = NULL;
static void *LPS22HB_T_0_handle = NULL; 
static void *HTS221_H_0_handle = NULL; 
static void *HTS221_T_0_handle = NULL;
static void *GG_handle = NULL;

int arraylength = TOTAL_TIME/INTERVAL;
int dataps = 1000/INTERVAL;

/* Private function prototypes -----------------------------------------------*/

static void Error_Handler( void );
static void RTC_Config( void );
static void RTC_TimeStampConfig( void );
static void initializeAllSensors( void );

/* MOTION DATA STORAGE -----------------------------------------------*/

struct Motions
{
    double AX_avg;
    double AX_absavg;
    double AX_peakavg;
    double AX_peakspefavg;
};

float AX_vals[TOTAL_TIME/INTERVAL];


/* MOTION DATA VARIABLE DECLARATION -----------------------------------------------*/
	struct Motions Normal;
	struct Motions Ascent;
	struct Motions Descent;
	struct Motions New;

/* GLOBAL VARIABLE DECLARATION -----------------------------------------------*/
	int standavg = 0;
	int newrawavg = 0;
 //------------------------------------------------------------------------------------------------------------------------------------


/* Private functions prototype---------------------------------------------------------*/

void normalize(struct Motions *motionptr);
void analyze(struct Motions *motionptr);
void findPeaks(char* axis, struct Motions *motionptr);
 
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Main program
  * @param  None
  * @retval None
  */
int main( void )
{
  uint32_t msTick, msTickPrev = 0;
  uint8_t doubleTap = 0;

  /* STM32L4xx HAL library initialization:
  - Configure the Flash prefetch, instruction and Data caches
  - Configure the Systick to generate an interrupt each 1 msec
  - Set NVIC Group Priority to 4
  - Global MSP (MCU Support Package) initialization
  */
  HAL_Init();

  /* Configure the system clock */
  SystemClock_Config();

  if(SendOverUSB)
  {
    /* Initialize LED */
    BSP_LED_Init(LED1);
    //BSP_LED_On(LED1);
  }
#ifdef NOT_DEBUGGING
  else
  {
    /* Initialize LEDSWD: Cannot be used during debug because it overrides SWDCLK pin configuration */
    BSP_LED_Init(LEDSWD);
    BSP_LED_Off(LEDSWD);
  }
#endif

  /* Initialize RTC */
  RTC_Config();
  RTC_TimeStampConfig();

  /* enable USB power on Pwrctrl CR2 register */
  HAL_PWREx_EnableVddUSB();

  if(SendOverUSB) /* Configure the USB */
  {
    /*** USB CDC Configuration ***/
    /* Init Device Library */
    USBD_Init(&USBD_Device, &VCP_Desc, 0);
    /* Add Supported Class */
    USBD_RegisterClass(&USBD_Device, USBD_CDC_CLASS);
    /* Add Interface callbacks for AUDIO and CDC Class */
    USBD_CDC_RegisterInterface(&USBD_Device, &USBD_CDC_fops);
    /* Start Device Process */
    USBD_Start(&USBD_Device);
  }
  else /* Configure the SDCard */
  {
    DATALOG_SD_Init();
  }
  HAL_Delay(200);

  /* Configure and disable all the Chip Select pins */
  Sensor_IO_SPI_CS_Init_All();

  /* Initialize and Enable the available sensors */
  initializeAllSensors();
  enableAllSensors();

  BSP_ACCELERO_Set_FS_Value( LSM6DSM_X_0_handle , 104.0f);


  static char dataOut[256];


  //------------------------------------------------------------------------------------------------------------------------------------
  	   BSP_LED_Off(LED1);
       waitToProceed(&msTickPrev,10000);

      BSP_LED_On(LED1);
	  waitToProceed(&msTickPrev,3000); //start to stand still during this time
	  //STAND STILL MOTION DATA ACQUISITION
	  for(int r = 0; r < arraylength; r++)
	  {
		  AX_vals[r] = Accelero_Sensor_Handler( LSM6DSM_X_0_handle);; // = what is returned by accelero func
		  waitToProceed(&msTickPrev,DATA_PERIOD_MS);
	  }
	  BSP_LED_Off(LED1);
	  for(int r = 0; r < arraylength; r++)
	  {
		  standavg += AX_vals[r];
	  }
	  standavg /= arraylength;
	  waitToProceed(&msTickPrev,10000);


       BSP_LED_On(LED1);
       waitToProceed(&msTickPrev,3000); //start normally walking during this time
       //NORMAL WALK MOTION DATA ACQUISITION
       for(int r = 0; r < arraylength; r++)
       {
     	  AX_vals[r] = Accelero_Sensor_Handler( LSM6DSM_X_0_handle); // = what is returned by accelero func
     	  waitToProceed(&msTickPrev,DATA_PERIOD_MS);
       }
       BSP_LED_Off(LED1);
       normalize(&Normal);
       analyze(&Normal);
       findPeaks("AX", &Normal);
       waitToProceed(&msTickPrev,10000);


       BSP_LED_On(LED1);
       waitToProceed(&msTickPrev,3000); // start stair ascent during this time
       //STAIR ASCENT MOTION DATA ACQUISITION
       for(int r = 0; r < arraylength; r++)
       {
     	  AX_vals[r] = Accelero_Sensor_Handler( LSM6DSM_X_0_handle); // = what is returned by accelero func
     	  waitToProceed(&msTickPrev,DATA_PERIOD_MS);
       }
       BSP_LED_Off(LED1);
       normalize(&Ascent);
       analyze(&Ascent);
       findPeaks("AX", &Ascent);
       waitToProceed(&msTickPrev,10000);



       BSP_LED_On(LED1);
       waitToProceed(&msTickPrev,3000);//start stair descent during this time
       //STAIR DESCENT MOTION DATA ACQUISITION
       for(int r = 0; r < arraylength; r++)
       {
     	  AX_vals[r] = Accelero_Sensor_Handler( LSM6DSM_X_0_handle); // = what is returned by accelero func
     	 waitToProceed(&msTickPrev,DATA_PERIOD_MS);
       }
       BSP_LED_Off(LED1);
       normalize(&Descent);
       analyze(&Descent);
       findPeaks("AX", &Descent);

 //------------------------------------------------------------------------------------------------------------------------------------

       double mean1 = (Ascent.AX_peakspefavg+Descent.AX_peakspefavg+Normal.AX_peakspefavg)/3;
       Ascent.AX_peakspefavg /= mean1;
       Descent.AX_peakspefavg /= mean1;
       Normal.AX_peakspefavg /= mean1;

       double mean2 = (Ascent.AX_peakspefavg+Descent.AX_peakspefavg+Normal.AX_peakspefavg)/3;
       Ascent.AX_peakspefavg -= mean2;
       Descent.AX_peakspefavg -= mean2;
       Normal.AX_peakspefavg -= mean2;

 //------------------------------------------------------------------------------------------------------------------------------------

      waitToProceed(&msTickPrev,10000);
	  BSP_LED_On(LED1);
	  waitToProceed(&msTickPrev,3000);//start new motion during this time

	  //NEW MOTION DATA ACQUISITION
	  for(int r = 0; r < arraylength; r++)
	  {
		 AX_vals[r] = Accelero_Sensor_Handler( LSM6DSM_X_0_handle); // = what is returned by accelero func
		 waitToProceed(&msTickPrev,DATA_PERIOD_MS);
	  }
	  BSP_LED_Off(LED1);

	  newrawavg = 0;
	  for(int r = 0; r < arraylength; r++)
	  {
		  newrawavg += AX_vals[r];
	  }

       normalize(&New);
       analyze(&New);


       //if (New.AX_peakavg > 1000000) //just check to see if min and max value are not that different
       if ((abs(newrawavg - standavg) < 50) && (1))
       {
    	   sprintf( dataOut, "Still\n");
			 CDC_Fill_Buffer(( uint8_t * )dataOut, strlen( dataOut ));
		   for(int i = 0; i < 1; i++) //Still
		   {
			  BSP_LED_On(LED1);
			  waitToProceed(&msTickPrev,500);
			  BSP_LED_Off(LED1);
		   }

       }

       findPeaks("AX", &New);

       New.AX_peakspefavg /= mean1;
       New.AX_peakspefavg -= mean2;


       //1. percentage error to normal
       //2. which difference is less
       if((fabs(New.AX_absavg-Ascent.AX_absavg) > fabs(New.AX_absavg-Normal.AX_absavg)) &&
           (fabs(New.AX_absavg-Descent.AX_absavg) > fabs(New.AX_absavg-Normal.AX_absavg)))
       {
    	   sprintf( dataOut, "Normal\n");
    	     CDC_Fill_Buffer(( uint8_t * )dataOut, strlen( dataOut ));
		   for(int i = 0; i < 2; i++) //Normal
		   {
			  BSP_LED_On(LED1);
			  waitToProceed(&msTickPrev,500);
			  BSP_LED_Off(LED1);
		   }
       }

       else
       {
    	   if((fabs(New.AX_peakspefavg - Ascent.AX_peakspefavg)) <
               (fabs(New.AX_peakspefavg - Descent.AX_peakspefavg)))
           {
    		   sprintf( dataOut, "Ascent\n");
    		     CDC_Fill_Buffer(( uint8_t * )dataOut, strlen( dataOut ));
    		   for(int i = 0; i < 3; i++) //Ascent
			   {
				  BSP_LED_On(LED1);
				  waitToProceed(&msTickPrev,500);
				  BSP_LED_Off(LED1);
			   }
           }

           else
           {
        	   sprintf( dataOut, "Descent\n");
        	     CDC_Fill_Buffer(( uint8_t * )dataOut, strlen( dataOut ));
        	   for(int i = 0; i < 4; i++) //Descent
			   {
				  BSP_LED_On(LED1);
				  waitToProceed(&msTickPrev,500);
				  BSP_LED_Off(LED1);
			   }
           }
        }


 //------------------------------------------------------------------------------------------------------------------------------------

       while (1)
         {
           /* Get sysTick value and check if it's time to execute the task */
           msTick = HAL_GetTick();
           if(msTick % DATA_PERIOD_MS == 0 && msTickPrev != msTick)
           {
             msTickPrev = msTick;
             if(SendOverUSB)
             {
               //BSP_LED_On(LED1);
             }
       #ifdef NOT_DEBUGGING
             else if (SD_Log_Enabled)
             {
               BSP_LED_On(LEDSWD);
             }
       #endif


             Accelero_Sensor_Handler( LSM6DSM_X_0_handle);


             //BSP_LED_On(LED1);

             if(SD_Log_Enabled) /* Write data to the file on the SDCard */
             {
               DATALOG_SD_NewLine();
             }

             if(SendOverUSB)
             {
               BSP_LED_Off(LED1);
             }
       #ifdef NOT_DEBUGGING
             else if (SD_Log_Enabled)
             {
               BSP_LED_Off(LEDSWD);
             }
       #endif
           }

           /* Check LSM6DSM Double Tap Event  */
           if(MEMSInterrupt)
           {
             MEMSInterrupt = 0;
             BSP_ACCELERO_Get_Double_Tap_Detection_Status_Ext(LSM6DSM_X_0_handle,&doubleTap);
             if(doubleTap) { /* Double Tap event */
               if (SD_Log_Enabled)
               {
                 DATALOG_SD_Log_Disable();
                 SD_Log_Enabled=0;
               }
               else
               {
                 while(SD_Log_Enabled != 1)
                 {
                   if(DATALOG_SD_Log_Enable())
                   {
                     SD_Log_Enabled=1;
                   }
                   else
                   {
                     DATALOG_SD_Log_Disable();
                   }
                   HAL_Delay(100);
                 }
               }
             }
           }

           /* Go to Sleep */
           __WFI();
         }
       }



/**
* @brief  Initialize all sensors
* @param  None
* @retval None
*/
static void initializeAllSensors( void )
{
  if (BSP_ACCELERO_Init( LSM6DSM_X_0, &LSM6DSM_X_0_handle ) != COMPONENT_OK)
  {
    while(1);
  }
  
  if (BSP_GYRO_Init( LSM6DSM_G_0, &LSM6DSM_G_0_handle ) != COMPONENT_OK)
  {
    while(1);
  }
  
  if (BSP_ACCELERO_Init( LSM303AGR_X_0, &LSM303AGR_X_0_handle ) != COMPONENT_OK)
  {
    while(1);
  }
  
  if (BSP_MAGNETO_Init( LSM303AGR_M_0, &LSM303AGR_M_0_handle ) != COMPONENT_OK)
  {
    while(1);
  }
  
  if (BSP_PRESSURE_Init( LPS22HB_P_0, &LPS22HB_P_0_handle ) != COMPONENT_OK)
  {
    while(1);
  }
  
  if (BSP_TEMPERATURE_Init( LPS22HB_T_0, &LPS22HB_T_0_handle ) != COMPONENT_OK)
  {
    while(1);
  }
  
  if(BSP_TEMPERATURE_Init( HTS221_T_0, &HTS221_T_0_handle ) == COMPONENT_ERROR)
  {
    no_T_HTS221 = 1;
  }
  
  if(BSP_HUMIDITY_Init( HTS221_H_0, &HTS221_H_0_handle ) == COMPONENT_ERROR)
  {
    no_H_HTS221 = 1;
  }
  
  /* Inialize the Gas Gauge if the battery is present */
  if(BSP_GG_Init(&GG_handle) == COMPONENT_ERROR)
  {
    no_GG=1;
  }
  
  if(!SendOverUSB)
  {
    /* Enable HW Double Tap detection */
    BSP_ACCELERO_Enable_Double_Tap_Detection_Ext(LSM6DSM_X_0_handle);
    BSP_ACCELERO_Set_Tap_Threshold_Ext(LSM6DSM_X_0_handle, LSM6DSM_TAP_THRESHOLD_MID);
  }
  
  
}

/**
* @brief  Enable all sensors
* @param  None
* @retval None
*/
void enableAllSensors( void )
{
  BSP_ACCELERO_Sensor_Enable( LSM6DSM_X_0_handle );
  BSP_GYRO_Sensor_Enable( LSM6DSM_G_0_handle );
  BSP_ACCELERO_Sensor_Enable( LSM303AGR_X_0_handle );
  BSP_MAGNETO_Sensor_Enable( LSM303AGR_M_0_handle );
  BSP_PRESSURE_Sensor_Enable( LPS22HB_P_0_handle );
  BSP_TEMPERATURE_Sensor_Enable( LPS22HB_T_0_handle );
  if(!no_T_HTS221)
  {
    BSP_TEMPERATURE_Sensor_Enable( HTS221_T_0_handle );
    BSP_HUMIDITY_Sensor_Enable( HTS221_H_0_handle );
  }
  
}



/**
* @brief  Disable all sensors
* @param  None
* @retval None
*/
void disableAllSensors( void )
{
  BSP_ACCELERO_Sensor_Disable( LSM6DSM_X_0_handle );
  BSP_ACCELERO_Sensor_Disable( LSM303AGR_X_0_handle );
  BSP_GYRO_Sensor_Disable( LSM6DSM_G_0_handle );
  BSP_MAGNETO_Sensor_Disable( LSM303AGR_M_0_handle );
  BSP_HUMIDITY_Sensor_Disable( HTS221_H_0_handle );
  BSP_TEMPERATURE_Sensor_Disable( HTS221_T_0_handle );
  BSP_TEMPERATURE_Sensor_Disable( LPS22HB_T_0_handle );
  BSP_PRESSURE_Sensor_Disable( LPS22HB_P_0_handle );
}



/**
* @brief  Configures the RTC
* @param  None
* @retval None
*/
static void RTC_Config( void )
{
  /*##-1- Configure the RTC peripheral #######################################*/
  RtcHandle.Instance = RTC;
  
  /* Configure RTC prescaler and RTC data registers */
  /* RTC configured as follow:
  - Hour Format    = Format 12
  - Asynch Prediv  = Value according to source clock
  - Synch Prediv   = Value according to source clock
  - OutPut         = Output Disable
  - OutPutPolarity = High Polarity
  - OutPutType     = Open Drain */
  RtcHandle.Init.HourFormat     = RTC_HOURFORMAT_12;
  RtcHandle.Init.AsynchPrediv   = RTC_ASYNCH_PREDIV;
  RtcHandle.Init.SynchPrediv    = RTC_SYNCH_PREDIV;
  RtcHandle.Init.OutPut         = RTC_OUTPUT_DISABLE;
  RtcHandle.Init.OutPutPolarity = RTC_OUTPUT_POLARITY_HIGH;
  RtcHandle.Init.OutPutType     = RTC_OUTPUT_TYPE_OPENDRAIN;
  
  if ( HAL_RTC_Init( &RtcHandle ) != HAL_OK )
  {
    
    /* Initialization Error */
    Error_Handler();
  }
}

/**
* @brief  Configures the current time and date
* @param  None
* @retval None
*/
static void RTC_TimeStampConfig( void )
{
  
  RTC_DateTypeDef sdatestructure;
  RTC_TimeTypeDef stimestructure;
  
  /*##-3- Configure the Date using BCD format ################################*/
  /* Set Date: Monday January 1st 2000 */
  sdatestructure.Year    = 0x00;
  sdatestructure.Month   = RTC_MONTH_JANUARY;
  sdatestructure.Date    = 0x01;
  sdatestructure.WeekDay = RTC_WEEKDAY_MONDAY;
  
  if ( HAL_RTC_SetDate( &RtcHandle, &sdatestructure, FORMAT_BCD ) != HAL_OK )
  {
    
    /* Initialization Error */
    Error_Handler();
  }
  
  /*##-4- Configure the Time using BCD format#################################*/
  /* Set Time: 00:00:00 */
  stimestructure.Hours          = 0x00;
  stimestructure.Minutes        = 0x00;
  stimestructure.Seconds        = 0x00;
  stimestructure.TimeFormat     = RTC_HOURFORMAT12_AM;
  stimestructure.DayLightSaving = RTC_DAYLIGHTSAVING_NONE ;
  stimestructure.StoreOperation = RTC_STOREOPERATION_RESET;
  
  if ( HAL_RTC_SetTime( &RtcHandle, &stimestructure, FORMAT_BCD ) != HAL_OK )
  {   
    /* Initialization Error */
    Error_Handler();
  }
}

/**
* @brief  Configures the current time and date
* @param  hh the hour value to be set
* @param  mm the minute value to be set
* @param  ss the second value to be set
* @retval None
*/
void RTC_TimeRegulate( uint8_t hh, uint8_t mm, uint8_t ss )
{
  
  RTC_TimeTypeDef stimestructure;
  
  stimestructure.TimeFormat     = RTC_HOURFORMAT12_AM;
  stimestructure.Hours          = hh;
  stimestructure.Minutes        = mm;
  stimestructure.Seconds        = ss;
  stimestructure.SubSeconds     = 0;
  stimestructure.DayLightSaving = RTC_DAYLIGHTSAVING_NONE;
  stimestructure.StoreOperation = RTC_STOREOPERATION_RESET;
  
  if ( HAL_RTC_SetTime( &RtcHandle, &stimestructure, FORMAT_BIN ) != HAL_OK )
  {
    /* Initialization Error */
    Error_Handler();
  }
}



/**
* @brief  EXTI line detection callbacks
* @param  GPIO_Pin: Specifies the pins connected EXTI line
* @retval None
*/
void HAL_GPIO_EXTI_Callback( uint16_t GPIO_Pin )
{
  MEMSInterrupt=1;
}



/**
* @brief  This function is executed in case of error occurrence
* @param  None
* @retval None
*/
static void Error_Handler( void )
{
  
  while (1)
  {}
}


void normalize(struct Motions *motionptr)
{
	static char dataOut[256];

    int absum = 0;

    for(int r = 0; r < arraylength; r++)
    {
        absum += abs(AX_vals[r]);
    }

    //sprintf( dataOut, "final sum:  %i......arraylength: %i\n", absum, arraylength);
    //CDC_Fill_Buffer(( uint8_t * )dataOut, strlen( dataOut ));

    double absavg = (double)absum/arraylength;
    absavg = 0.00000123;
    //sprintf( dataOut, "absavg: %f\n", 0.3);
    //CDC_Fill_Buffer(( uint8_t * )dataOut, strlen( dataOut ));

    for(int r = 0; r < arraylength; r++)
    {
        AX_vals[r] /= absavg;
        AX_vals[r] -= 1;//Stand.AX_avg;
    }
}

void analyze(struct Motions *motionptr)
{
    double sum = 0;
    double absum = 0;

    for(int r = 0; r < arraylength; r++)
    {
        sum += AX_vals[r];
        absum += fabs(AX_vals[r]);
    }

    motionptr->AX_avg = sum/arraylength;
    motionptr->AX_absavg = absum/arraylength;
}

void findPeaks(char* axis, struct Motions *motionptr)
{
    double *ptr;

    if(!strcmp(axis, "AX"))
    {
        ptr = AX_vals;
    }

    else
    {
        printf("INVALID AXIS PROVIDED TO FINDPEAK FUNCTION");
        return;
    }

    double temppeakmax = -10000000000000;
    double peaksum = 0;

    for(int r = 0; r < arraylength; r++)
    {
        if(ptr[r] > temppeakmax)
        {
            temppeakmax = ptr[r];
        }

        if( ((r+1)%dataps) == 0)
        {
            peaksum += temppeakmax;
            temppeakmax = -10000000000;
        }
    }

    motionptr->AX_peakspefavg = peaksum/(TOTAL_TIME/1000);
}



#ifdef  USE_FULL_ASSERT

/**
* @brief  Reports the name of the source file and the source line number
*   where the assert_param error has occurred
* @param  file: pointer to the source file name
* @param  line: assert_param error line source number
* @retval None
*/
void assert_failed( uint8_t *file, uint32_t line )
{
  
  /* User can add his own implementation to report the file name and line number,
  ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  
  while (1)
  {}
}

#endif

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
