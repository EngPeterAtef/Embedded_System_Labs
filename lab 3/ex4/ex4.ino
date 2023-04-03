#include <avr/io.h>
void timer2_init()
{
  // set up timer with no prescaling
  TCCR2B |= (1 << CS20) | (1 << CS21) | (1 << CS22);//1024
  TCCR2B |= (1 << FOC2B);
  TCCR2A &= ~(1 << WGM20);
  TCCR2A |= (1<<WGM21);
  TCCR2A |= (1<<COM2A0);
  TCCR2A &= ~(1<<COM2A1);
  
  // initialize counter
  TCNT2 = 0;
  TIMSK2 |= (1 << OCIE2A);
  OCR2A = 250;
}
volatile uint8_t tot_overflow;

ISR(TIMER2_COMPA_vect)
{
  tot_overflow++;
}
int main()
{
  DDRB |= (1 << PB3);
  PORTB = 0;
  sei();
  timer2_init();
  while (1)
  {
//    // check if no. of overflows = 12
//    if (tot_overflow >= 30) // NOTE: '>=' is used
//    {
//      // check if the timer count reaches 53
//      if (TCNT2 >= 130)
//      {
//        PORTC ^= (1 << PC0); // toggles the led
//        TCNT2 = 0;           // reset counter
//        tot_overflow = 0;    // reset overflow counte
//      }
//    }
  }
  return 0;
}
