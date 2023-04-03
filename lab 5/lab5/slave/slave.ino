#include <util/delay.h>

// Slave

void SPI_init()
{
  
  DDRB &= ~((1 << 3) | (1 << 5) | (1 << 2)); 
  DDRB |= (1 << 4); 
  SPCR = (1 << SPE) | (1 << SPR1); 
  SPCR &= ~(1 << DORD);
  SPSR &= ~(1 << SPI2X);

}

char SPI_Receive()
{
  while(!(SPSR & (1 << SPIF)));
  return SPDR;
}

void SPI_Send(char data)
{
  SPDR = data;
  while(!(SPSR & (1 << SPIF)));
  char dummy = SPDR;
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  SPI_init();
}

void loop() {
  uint8_t c;
 c = SPI_Receive()+100;
 delay(1000);
    SPI_Send((char)c);
    delay(1000);
    Serial.println((uint8_t)c);
  
    

}
//#include <util/delay.h>
//#include <avr/io.h>
//void SPI_int()
//{
//    DDRB &= ~(1 << PB3) & ~(1 << PB5) & ~(1 << PB2);
//    DDRB |= (1 << PB4);
//    //PORTB |= (1 << PB2);
//    SPCR &= ~(1 << MSTR);
//    SPSR &= ~(1 << SPI2X);
//
//}
//char SPI_Write(char data)
//{
//    char flush_buffer;
//    SPDR = data;
//    while (!(SPSR & (1 << SPIF)))
//    {
//        /* code */
//    }
//    flush_buffer = SPDR;
//}
//char SPI_Read()
//{
////    SPDR = 0xff;
//    while (!(SPSR & (1 << SPIF)))
//    {
//        /* code */
//    }
//    return SPDR;
//}
//
//int main()
//{
//    Serial.begin(9600);
//    uint8_t count;
//    SPI_int();
//    _delay_ms(1000);
//
//    while (true)
//    {
//        /* code */
//        count = (uint8_t)SPI_Read() + 100;
//        Serial.println(count);
//        _delay_ms(1000);
//        SPI_Write(count);
//        _delay_ms(1000);
//    }
//
//    return 0;
//}
///*
//*/
