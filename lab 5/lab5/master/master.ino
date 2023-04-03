#include <util/delay.h>

// MASTER
void SPI_init()
{
  DDRB |= (1 << 3) | (1 << 5) | (1 << 2); 
  DDRB &= ~(1 << 4); 
  PORTB |= (1 << 2);
 // char dummy = 
  SPCR = (1 << SPE) | (1 << SPR1) | (1 << MSTR); 
  SPCR &= ~(1 << DORD);
  SPSR &= ~(1 << SPI2X);

//  Serial.println(SPCR, BIN);
}

void SPI_Write(char data)
{
  char buff;
  SPDR = data;

  while(!(SPSR & (1 << SPIF)));

  buff = SPDR;
}

char SPI_Read()
{
  SPDR = 0xFF;
  while(!(SPSR & (1 << SPIF)));
  return SPDR;
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  SPI_init();

  PORTB &= ~(1 << 2);  
  delay(1000);
}

void loop() {
  // put your main code here, to run repeatedly:  

  
  // first send from 1 to 100
  for (uint8_t i = 1; i <= 100; i++) {
    SPI_Write((char)i);
    delay(1000);
    Serial.println((uint8_t)SPI_Read());
    delay(1000);
  }

  // wait 1 second
  delay(10000);
}
//#include <util/delay.h>
//#include <avr/io.h>
//void SPI_int()
//{
//  DDRB |= (1 << PB3) | (1 << PB5) | (1 << PB2);
//  DDRB &= ~(1 << PB4);
//  PORTB |= (1 << PB2);
//  SPCR |= (1 << SPE) | (1 << MSTR) | (1 << SPR0);
//  SPSR &= ~(1 << SPI2X);
//
//}
//char SPI_Write(char data)
//{
//  char flush_buffer;
//  SPDR = data;
//  while (!(SPSR & (1 << SPIF)))
//  {
//    /* code */
//  }
//  flush_buffer = SPDR;
//}
//char SPI_Read()
//{
//  SPDR = 0xff;
//  while (!(SPSR & (1 << SPIF)))
//  {
//    /* code */
//  }
//  return SPDR;
//}
//
//int main()
//{
//  Serial.begin(9600);
//
//  uint8_t count;
//  uint8_t count_received;
//  char buffer[8];
//  SPI_int();
//  PORTB &= ~(1<<PB2); // delay
//  _delay_ms(1000);
//  count = 0;
////  while(true){
////    SPI_Write(1);
////    _delay_ms(1000);
////    }
//  while (count<=100)
//  {
//    /* code */
//    SPI_Write((char)count);
//    _delay_ms(1000);
//    count_received = (uint8_t)SPI_Read();
//    _delay_ms(1000);
//    Serial.println(count_received);
//    count++;
//  }
//
//  return 0;
//}
