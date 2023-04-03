#line 1 "D:/CMP/third_Year/second_semester/embedded system/Labs/Embedded_System_Labs/Lab 6/Req1.c"
void main() {

 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL);
 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL);
 GPIOD_ODR = 0;
 GPIOE_ODR = 0;
 while(1){
 GPIOD_ODR = ~GPIOD_ODR;
 GPIOE_ODR = ~GPIOE_ODR;
 Delay_ms(500);
 }

}
