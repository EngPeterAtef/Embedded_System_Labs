#line 1 "D:/CMP/third_Year/second_semester/embedded system/Labs/Embedded_System_Labs/Lab 6/Req2.c"
int i;
void main()
{

 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL);
 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL);

 GPIOD_ODR = 0;
 GPIOE_ODR = 0;
 while (1)
 {

 for (i = 0; i < 4; i++)
 {

 if (i == 0)
 {

 GPIOD_ODR = 0b0001000100010001;
 GPIOE_ODR = 0b0001000100000000;
 }
 else
 {

 GPIOD_ODR |= GPIOD_ODR << 1;
 GPIOE_ODR |= GPIOE_ODR << 1;
 }
 Delay_ms(100);

 }

 for (i = 0; i < 4; i++)

 {
 if (i == 0)
 {
 GPIOD_ODR = 0b1110111011101110;
 GPIOE_ODR = 0b1110111000000000;
 }
 else
 {
 GPIOD_ODR &= GPIOD_ODR << 1;
 GPIOE_ODR &= GPIOE_ODR << 1;
 }
 Delay_ms(100);
 }
 }
}
