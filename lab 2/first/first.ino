#include <avr/io.h>
#include <avr/interrupt.h>

ISR(INT0_vect){
    PORTC ^= 0x01;//toogle the PC0 pin
}
void INT0_Init(void){
  SREG = SREG &(~(1<<7));//don't listen to any interrupts before butting the configuation of the interrupt
  DDRD = 0x00;//interrpt is an input to my system as it's external
  EIMSK = EIMSK |(1<<INT0);//listen to INT0
  //int0 = rising edge
  EICRA = EICRA |(1<<ISC00);
  EICRA = EICRA |(1<<ISC01);
  //listen to all interrupts after configuration
  SREG = SREG |(1<<7);
}

int main(){
  INT0_Init();
  //PC0 is output
  DDRC = 0x01;
  //the inital value of PC0 is one
  PORTC = 0x01;
  while(true){
    }
  return 0;
}
