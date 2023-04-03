#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

ISR(INT1_vect){
  for (int i=0; i<5; i++) {
    PORTC = 0x07;
    _delay_ms(500);
    PORTC = 0x00;
    _delay_ms(500);
  }
  }
void INT1_Init(void){
  SREG = SREG &(~(1<<7));
  DDRD = DDRD & ~(1<<PD2);//input pin
  EIMSK = EIMSK |(1<<INT1);//listen to int1
 //rising edge
  EICRA = EICRA |(1<<ISC11);
  EICRA = EICRA |(1<<ISC10);
  SREG = SREG |(1<<7);
}

int main(){
  INT1_Init();
  //pin 0 , 1,2 are output leds
   DDRC = DDRC | (1<<PC0)| (1<<PC1)| (1<<PC2);
   PORTC = 0x00;//initally off
  
  
  while(true){
    PORTC = 0x01;
    _delay_ms(500);
  PORTC = 0x2;
    _delay_ms(500);
      PORTC = 0x04;
    _delay_ms(500);
    }
  return 0;
}
