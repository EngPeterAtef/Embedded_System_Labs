// int i;
// #include "PWM";
unsigned int period = 0;
void main()
{
    GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL); // Set PORTD as digital output
    GPIOE_ODR = 0;                                       // Toggle PORTE

    period = PWM_TIM1_Init(500); // initializes timer 1 in PWM mode with 25 kHz frequency
    // sets timer 8 duty ratio to 200, non inverted signal, channel 4
    PWM_TIM1_Set_Duty(0.2 * period, _PWM_NON_INVERTED, _PWM_CHANNEL4);
    // starts timer 3 PWM generation to channel 2 and maps the output to PC7
    PWM_TIM1_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM1_CH4_PE14);
    while (1)
    {
        /* code */
    }

    // stops timer 4 channel 1 from generating PWM output
    PWM_TIM4_Stop(_PWM_CHANNEL4);
}