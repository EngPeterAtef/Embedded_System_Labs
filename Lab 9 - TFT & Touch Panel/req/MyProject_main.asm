_main:
;MyProject_main.c,19 :: 		void main() {
;MyProject_main.c,21 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_ALL); // Set PORTD as digital Input
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;MyProject_main.c,22 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL); // Set PORTD as digital output
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;MyProject_main.c,23 :: 		GPIOD_ODR = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;MyProject_main.c,25 :: 		Start_TP();
BL	_Start_TP+0
;MyProject_main.c,27 :: 		while (1) {
L_main0:
;MyProject_main.c,28 :: 		Check_TP();
BL	_Check_TP+0
;MyProject_main.c,30 :: 		if(Button(&GPIOC_IDR, 0, 50, 1)){
MOVS	R3, #1
MOVS	R2, #50
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main2
;MyProject_main.c,31 :: 		if(screen==1){
MOVW	R0, #lo_addr(_screen+0)
MOVT	R0, #hi_addr(_screen+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main3
;MyProject_main.c,32 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;MyProject_main.c,33 :: 		screen = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_screen+0)
MOVT	R0, #hi_addr(_screen+0)
STRH	R1, [R0, #0]
;MyProject_main.c,34 :: 		}
IT	AL
BAL	L_main4
L_main3:
;MyProject_main.c,36 :: 		DrawScreen(&Screen2);
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
BL	_DrawScreen+0
;MyProject_main.c,37 :: 		screen = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_screen+0)
MOVT	R0, #hi_addr(_screen+0)
STRH	R1, [R0, #0]
;MyProject_main.c,38 :: 		}
L_main4:
;MyProject_main.c,39 :: 		while(Button(&GPIOC_IDR, 0, 50, 1));
L_main5:
MOVS	R3, #1
MOVS	R2, #50
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main6
IT	AL
BAL	L_main5
L_main6:
;MyProject_main.c,40 :: 		}
L_main2:
;MyProject_main.c,41 :: 		}
IT	AL
BAL	L_main0
;MyProject_main.c,42 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
