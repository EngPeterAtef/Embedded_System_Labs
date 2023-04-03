#include <avr/io.h>
void timer2_init()
{
  // set up timer with no prescaling
  TCCR2B |= (1 << CS21) | (1 << CS22);
  TCCR2B &= ~(1 << CS20);
  TCCR2B |= (1 << FOC2B);
  TCCR2A &= ~(1 << WGM20) & ~(1 << WGM21);
  TCCR2A &= ~(1 << COM2A0) & ~(1 << COM2A1);

  // initialize counter
  TCNT2 = 0;
  TIMSK2 |= (1 << TOIE2);
}
volatile uint8_t tot_overflow;
int sevenSegment = 0;
ISR(TIMER2_OVF_vect)
{
  tot_overflow++;
}
int main()
{
  // connect led to pin PC0
  DDRC |= (1 << PC0);
  PORTC = 0;
  sei();
  timer2_init();
  while (1)
  {
    // check if no. of overflows = 12
    if (tot_overflow >= 244) // NOTE: '>=' is used
    {
      // check if the timer count reaches 53
      if (TCNT2 >= 36)
      {
        if(sevenSegment==0){
          PORTC = 0x3F;
        }
        else if(sevenSegment==1){
          PORTC = 0x06;
        }
         else if(sevenSegment==2){
          PORTC = 0x5B;
        }
         else if(sevenSegment==3){
          PORTC = 0x4f;
        }
         else if(sevenSegment==4){
          PORTC = 0x66;
        }
         else if(sevenSegment==5){
          PORTC = 0x6D;
        }
         else if(sevenSegment==6){
          PORTC = 0x7D;
        }
         else if(sevenSegment==7){
          PORTC = 0x07;
        }
         else if(sevenSegment==8){
          PORTC = 0xFF;
        }
         else if(sevenSegment==9){
          PORTC = 0x6f;
          sevenSegment = -1;
        }
          sevenSegment++;

        TCNT2 = 0;           // reset counter
        tot_overflow = 0;    // reset overflow counte
      }
    }
  }
  return 0;
}
