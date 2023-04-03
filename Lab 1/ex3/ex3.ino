#include <avr/io.h>
#include <util/delay.h>
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  DDRB = DDRB & (~(1<<PB0));
  DDRC = DDRC | ((1<<PC0));
  PORTC = PORTC & ~(1<<PC0);
    PORTB = PORTB | (1<<PB0);

}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.println(!(PINB & (1<<PB0)));
  
  if(!(PINB & (1<<PB0)))
  {
    _delay_ms(30);
    if(!(PINB & (1<<PB0)))
    {
            Serial.println("INSIDE IF");

      PORTC ^= (1<<PC0);
      while(!(PINB & (1<<PB0)));
      //PORTC = PORTC ^ (1 << PC0);
    }
   
  } 
}
