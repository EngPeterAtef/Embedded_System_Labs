int i;
// #include "PWM";
unsigned int period = 0;
void main()
{
    GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL); // Set PORTD as digital output
    GPIOD_ODR = 0;                                       // Toggle PORTE

    period = PWM_TIM1_Init(4000); // initializes timer 1 in PWM mode with 25 kHz frequency
    // sets timer 8 duty ratio to 200, non inverted signal, channel 4
    // starts timer 3 PWM generation to channel 2 and maps the output to PC7
    while (1)
    {
        for (i = 0; i <= period; i++)
        {
            PWM_TIM1_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL1);
            PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PD12);
            Delay_us(500);
        }
        // stops timer 4 channel 1 from generating PWM output
        PWM_TIM4_Stop(_PWM_CHANNEL1);
        for (i = 0; i <= period; i++)
        {
            PWM_TIM1_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL2);
            PWM_TIM1_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM1_CH2_PD13);
            Delay_us(500);
        }
        // stops timer 4 channel 1 from generating PWM output
        PWM_TIM4_Stop(_PWM_CHANNEL2);
        for (i = 0; i <= period; i++)
        {
            PWM_TIM1_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL3);
            PWM_TIM1_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM1_CH3_PD14);
            Delay_us(500);
        }
        // stops timer 4 channel 1 from generating PWM output
        PWM_TIM4_Stop(_PWM_CHANNEL3);
        for (i = 0; i <= period; i++)
        {
            PWM_TIM1_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
            PWM_TIM1_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM1_CH4_PD15);
            Delay_us(500);
        }
        // stops timer 4 channel 1 from generating PWM output
        PWM_TIM4_Stop(_PWM_CHANNEL4);
        for (i = period; i >= 0; i--)
        {
            PWM_TIM1_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL1);
            PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PD12);
            Delay_us(500);
        }
        // stops timer 4 channel 1 from generating PWM output
        PWM_TIM4_Stop(_PWM_CHANNEL1);
        for (i = period; i >= 0; i--)
        {
            PWM_TIM1_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL2);
            PWM_TIM1_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM1_CH2_PD13);
            Delay_us(500);
        }
        // stops timer 4 channel 1 from generating PWM output
        PWM_TIM4_Stop(_PWM_CHANNEL2);
        for (i = period; i >= 0; i--)
        {
            PWM_TIM1_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL3);
            PWM_TIM1_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM1_CH3_PD14);
            Delay_us(500);
        }
        // stops timer 4 channel 1 from generating PWM output
        PWM_TIM4_Stop(_PWM_CHANNEL3);
        for (i = period; i >= 0; i--)
        {
            PWM_TIM1_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
            PWM_TIM1_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM1_CH4_PD15);
            Delay_us(500);
        }
        // stops timer 4 channel 1 from generating PWM output
        PWM_TIM4_Stop(_PWM_CHANNEL4);
    }
}