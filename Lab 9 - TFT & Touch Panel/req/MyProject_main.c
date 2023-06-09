/*
 * Project name:
     MyProject.mcpar
 * Generated by:
     Visual TFT
 * Date of creation
     5/7/2023
 * Test configuration:
     MCU:             STM32F407VG
     Dev.Board:       EasyMx_PRO_v7_for_STM32_ARM_9A
     Oscillator:      16000000 Hz
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 */

#include "MyProject_objects.h"

int screen = 0;
void main() {

       GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_ALL); // Set PORTD as digital Input
       GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL); // Set PORTD as digital output
       GPIOD_ODR = 0;

  Start_TP();

  while (1) {
    Check_TP();

    if(Button(&GPIOC_IDR, 0, 50, 1)){
    if(screen==1){
    DrawScreen(&Screen1);
    screen = 0;
    }
    else{
    DrawScreen(&Screen2);
    screen = 1;
    }
     while(Button(&GPIOC_IDR, 0, 50, 1));
    }
  }
}