#include <Arduino.h>
#include <avr/io.h>
void adc_init()
{
  // AREF = AVcc
  ADMUX = (1 << REFS0);
  // ADC Enable and prescaler of 128
  // 16000000/128 = 125000
  ADCSRA = (1 << ADEN) | (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0);
}
// void adc_init() interrupt
// {
//   // AREF = AVcc
//   ADMUX = (1 << REFS0);
//   // ADC Enable and prescaler of 128
//   // 16000000/128 = 125000
//   // (1<<ADIE)=1 à set ADC interrupt enable
//   ADCSRA = (1 << ADEN) | (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0) | (1 << ADIE);
//   // Set global interrupt
//   sei();
// }
uint16_t adc_read(uint8_t ch) // ch is the channgel number
{
  // select the corresponding channel 0~5
  // ANDing with ’7′ will always keep the value
  // of ‘ch’ between 0 and 5
  ch &= 0b00000111;            // AND operation with 7
  ADMUX = (ADMUX & 0xF8) | ch; // clears the bottom 3 bits before ORing
  // start single conversion
  // write ’1′ to ADSC
  ADCSRA |= (1 << ADSC);
  // wait for conversion to complete
  // ADSC becomes ’0′ again
  // till then, run loop continuously
  while (ADCSRA & (1 << ADSC))
    ;
  return (ADC);
}
// int16_t adc_read(uint8_t ch) interrupt
// {
//   // select the corresponding channel 0~5
//   // ANDing with ’7′ will always keep the value
//   // of ‘ch’ between 0 and 5
//   ch &= 0b00000111;            // AND operation with 7
//   ADMUX = (ADMUX & 0xF8) | ch; // clears the bottom 3 bits before ORing
//   // start single conversion
//   // write ’1′ to ADSC
//   ADCSRA |= (1 << ADSC);
//   // wait for conversion to complete
//   // ADSC becomes ’0′ again
//   // till then, run loop continuously
//   return (ADC);
// }


//Interrupt

// volatile uint16_t adc_result0; interrupt
// ISR(ADC_vect)
// {
//   Serial.println(adc_result0);
// }
// int main()
// {
//   DDRB = 0x20; // to connect led to PB5
//   // initialize adc
//   adc_init();
//   Serial.begin(9600);
//   while (1)
//   {
//     adc_result0 = adc_read(0); // read adc value at PC0
//     // condition for led to turn on or off
//   }
//   return 0;
// }
/*
0->1023
0->5V
x-> 7/1023
*/
int main(){
  DDRB = 0x07; // to connect led to PB0, PB1, PB2
  adc_init();
  uint16_t adc_result0;
  PORTB = 0;
  while (true)
  {
    /* code */
    adc_result0 = adc_read(0); // read adc value at PC0
    PORTB= (adc_result0*7)/1023;
    
  }
  
  return 0;
}