#line 1 "D:/CMP/third_Year/second_semester/embedded system/Labs/Embedded_System_Labs/Lab7/req3.c"


unsigned int period = 0;
void main()
{
 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL);
 GPIOE_ODR = 0;

 period = PWM_TIM4_Init(4000);

 while (1)
 {
 PWM_TIM4_Set_Duty(0.2 * period, _PWM_NON_INVERTED, _PWM_CHANNEL4);

 PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PE14);

 PWM_TIM4_Stop(_PWM_CHANNEL4);
 }

}
