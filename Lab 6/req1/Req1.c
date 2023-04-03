void main() {

  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL); // Set PORTD as digital output
  GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL); // Set PORTE as digital output
  GPIOD_ODR = 0;
  GPIOE_ODR = 0;
  while(1){
    GPIOD_ODR = ~GPIOD_ODR; // Toggle PORTD
    GPIOE_ODR = ~GPIOE_ODR; // Toggle PORTE
    Delay_ms(500);
  }

}