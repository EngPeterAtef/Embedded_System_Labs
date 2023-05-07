#include "MyProject_objects.h"
#include "MyProject_resources.h"

//--------------------- User code ---------------------//

//----------------- End of User code ------------------//

// Event Handlers
void BoxRound1OnClick() {
 GPIOD_ODR = 0xFFFF;
}
void BoxRound2OnClick() {
GPIOD_ODR = 0x0000;
}
void BoxRound3OnClick() {
     GPIOD_ODR = GPIOD_ODR ^ 0xFFFF;
}
void Label1OnClick() {
GPIOD_ODR = 0xFFFF;
}
void Label2OnClick() {
     GPIOD_ODR = 0x0000;
}
void Label3OnClick() {
GPIOD_ODR = GPIOD_ODR ^ 0xFFFF;
}