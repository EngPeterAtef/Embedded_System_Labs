#line 1 "D:/CMP/third_Year/second_semester/embedded system/Labs/Embedded_System_Labs/Lab 6/req3/Req3.c"
int i = 0;
unsigned int prev0 = 0;
unsigned int curr0 = 0;
unsigned int prev1 = 0;
unsigned int curr1 = 0;

void main()
{
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_3 | _GPIO_PINMASK_2);
 GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);
 GPIOD_ODR = 0;

 while (1)
 {

 curr0 = Button(&GPIOB_IDR, 0, 1, 1);
 curr1 = Button(&GPIOB_IDR, 1, 1, 1);
 if (curr0 & prev0 == 0)
 {

 prev0 = curr0;
 i++;
 if (i > 15)
 {

 i = 15;
 }
 }
 if (curr1 & prev1 == 0)
 {

 prev1 = curr1;
 i--;
 if (i < 0)
 {

 i = 0;
 }
 }
 if (!curr0)
 {
 prev0 = 0;
 }

 if (!curr1)
 {
 prev1 = 0;
 }
 GPIOD_ODR = i;
 }
}
