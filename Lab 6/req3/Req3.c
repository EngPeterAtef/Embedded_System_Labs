int i = 0;
unsigned int prev0 = 0;
unsigned int curr0 = 0;
unsigned int prev1 = 0;
unsigned int curr1 = 0;

void main()
{
    GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_3 | _GPIO_PINMASK_2); // Set PORTD as digital output
    GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);                                      // Set PORTE as digital output
    GPIOD_ODR = 0;                                                                                           // Toggle PORTD

    while (1)
    {
        /* code */
        curr0 = Button(&GPIOB_IDR, 0, 1, 1);
        curr1 = Button(&GPIOB_IDR, 1, 1, 1);
        if (curr0 & prev0 == 0) //if button is pressed "rising edge" 
        {
            /* code */
            prev0 = curr0;
            i++;//increment i
            if (i > 15)
            {
                /* code */
                i = 15;//if i is greater than 15 set i to 15 34an yban en al button m4 by3ml 7aga
            }
        }
        if (curr1 & prev1 == 0) //if buttin is pressed "rising edge"
        {
            /* code */
            prev1 = curr1;
            i--;//decrement i
            if (i < 0)
            {
                /* if I become less than zero then set to zero 34an yban al button m4 by3l 7aga*/
                i = 0;
            }
        }
        if (!curr0)//if the button is not pressed
        {
            prev0 = 0;//then set prev to zero 34an akon 3arf en a5er mara 3aml checn 3lah hoa mkn4 mdas
            //same if you said: prev0 = curr0;
        }

        if (!curr1)
        {
            prev1 = 0;
        }
        GPIOD_ODR = i;//give the value to portd
    }
}