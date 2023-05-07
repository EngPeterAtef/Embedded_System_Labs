#line 1 "D:/CMP/third_Year/second_semester/embedded system/Labs/Embedded_System_Labs/Lab 9 - TFT & Touch Panel/req/MyProject_main.c"
#line 1 "d:/cmp/third_year/second_semester/embedded system/labs/embedded_system_labs/lab 9 - tft & touch panel/req/myproject_objects.h"
typedef struct Screen TScreen;

typedef const struct CLabel {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCLabel;

typedef struct Image {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Picture_Name;
 char Visible;
 char Active;
 char Picture_Type;
 char Picture_Ratio;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TImage;

typedef struct Box {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TBox;

typedef const struct CBox_Round {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCBox_Round;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
 unsigned int CLabelsCount;
 TCLabel * const code *CLabels;
 unsigned int ImagesCount;
 TImage * const code *Images;
 unsigned int BoxesCount;
 TBox * const code *Boxes;
 unsigned int CBoxes_RoundCount;
 TCBox_Round * const code *CBoxes_Round;
};

extern TScreen Screen1;
extern TCBox_Round BoxRound1;
extern TCLabel Label1;
extern TCBox_Round BoxRound2;
extern TCBox_Round BoxRound3;
extern TCLabel Label2;
extern TCLabel Label3;
extern TCLabel * const code Screen1_CLabels[3];
extern TCBox_Round * const code Screen1_CBoxes_Round[3];

extern TScreen Screen2;
extern TBox Box1;
extern TBox Box2;
extern TImage Image1;
extern TImage * const code Screen2_Images[1];
extern TBox * const code Screen2_Boxes[2];




void BoxRound1OnClick();
void BoxRound2OnClick();
void BoxRound3OnClick();
void Label1OnClick();
void Label2OnClick();
void Label3OnClick();




extern const char BoxRound1_Caption[];
extern const char Label1_Caption[];
extern const char BoxRound2_Caption[];
extern const char BoxRound3_Caption[];
extern const char Label2_Caption[];
extern const char Label3_Caption[];
extern char Box1_Caption[];
extern char Box2_Caption[];
extern char Image1_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawCLabel(TCLabel *AClabel);
void DrawImage(TImage *AImage);
void DrawBox(TBox *ABox);
void DrawCRoundBox(TCBox_Round *ACround_box);
void Check_TP();
void Start_TP();
void Process_TP_Press(unsigned int X, unsigned int Y);
void Process_TP_Up(unsigned int X, unsigned int Y);
void Process_TP_Down(unsigned int X, unsigned int Y);
#line 18 "D:/CMP/third_Year/second_semester/embedded system/Labs/Embedded_System_Labs/Lab 9 - TFT & Touch Panel/req/MyProject_main.c"
int screen = 0;
void main() {

 GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_ALL);
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL);
 GPIOD_ODR = 0;

 Start_TP();

 while (1) {
 Check_TP();

 if(Button(&GPIOC_IDR, 0, 50, 1)){
 if(screen==1){
 DrawScreen(&Screen1);
 screen = 0;
 }
 else{
 DrawScreen(&Screen2);
 screen = 1;
 }
 while(Button(&GPIOC_IDR, 0, 50, 1));
 }
 }
}
