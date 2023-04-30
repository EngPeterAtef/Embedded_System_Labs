#line 1 "D:/CMP/third_Year/second_semester/embedded system/Labs/Embedded_System_Labs/Lab7/req2.c"
#line 31 "D:/CMP/third_Year/second_semester/embedded system/Labs/Embedded_System_Labs/Lab7/req2.c"
int i;

unsigned int period = 0;
void main()
{
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL);
 GPIOD_ODR = 0;

 period = PWM_TIM4_Init(4000);


 while (1)
 {
 for (i = 0; i <= period; i++)
 {
 PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL1);
 PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PD12);
 Delay_us(500);
 }


 for (i = 0; i <= period; i++)
 {
 PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL2);
 PWM_TIM4_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM4_CH2_PD13);
 Delay_us(500);
 }


 for (i = 0; i <= period; i++)
 {
 PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL3);
 PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PD14);
 Delay_us(500);
 }


 for (i = 0; i <= period; i++)
 {
 PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
 PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PD15);
 Delay_us(500);
 }


 for (i = period; i >= 0; i--)
 {
 PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL1);
 PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PD12);
 Delay_us(500);
 }

 PWM_TIM4_Stop(_PWM_CHANNEL1);
 for (i = period; i >= 0; i--)
 {
 PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL2);
 PWM_TIM4_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM4_CH2_PD13);
 Delay_us(500);
 }

 PWM_TIM4_Stop(_PWM_CHANNEL2);
 for (i = period; i >= 0; i--)
 {
 PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL3);
 PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PD14);
 Delay_us(500);
 }

 PWM_TIM4_Stop(_PWM_CHANNEL3);
 for (i = period; i >= 0; i--)
 {
 PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
 PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PD15);
 Delay_us(500);
 }

 PWM_TIM4_Stop(_PWM_CHANNEL4);
 }
}
