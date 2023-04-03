int i;
void main()
{

    GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL); // Set PORTD as digital output
    GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL); // Set PORTE as digital output

    GPIOD_ODR = 0; // Toggle PORTD
    GPIOE_ODR = 0; // Toggle PORTE
    while (1)
    {
        // Delay_ms(500);
        for (i = 0; i < 4; i++)
        {
            /* code */
            if (i == 0)
            {

                GPIOD_ODR = 0b0001000100010001; // Toggle PORTD
                GPIOE_ODR = 0b0001000100000000; // Toggle PORTE
            }
            else
            {

                GPIOD_ODR |= GPIOD_ODR << 1; // Toggle PORTD
                GPIOE_ODR |= GPIOE_ODR << 1; // Toggle PORTE
            }
            Delay_ms(100);
            /* code */
        }

        for (i = 0; i < 4; i++)
        /* code */
        {
            if (i == 0)
            {
                GPIOD_ODR = 0b1110111011101110; // Toggle PORTD
                GPIOE_ODR = 0b1110111000000000; // Toggle PORTE
            }
            else
            {
                GPIOD_ODR &= GPIOD_ODR << 1; // Toggle PORTD
                GPIOE_ODR &= GPIOE_ODR << 1; // Toggle PORTE
            }
            Delay_ms(100);
        }
    }
}