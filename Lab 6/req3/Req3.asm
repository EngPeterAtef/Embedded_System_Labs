_main:
;Req3.c,7 :: 		void main()
;Req3.c,9 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_3 | _GPIO_PINMASK_2); // Set PORTD as digital output
MOVW	R1, #15
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;Req3.c,10 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);                                      // Set PORTE as digital output
MOVW	R1, #3
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;Req3.c,11 :: 		GPIOD_ODR = 0;                                                                                           // Toggle PORTD
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;Req3.c,13 :: 		while (1)
L_main0:
;Req3.c,16 :: 		curr0 = Button(&GPIOB_IDR, 0, 1, 1);
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
MOVW	R1, #lo_addr(_curr0+0)
MOVT	R1, #hi_addr(_curr0+0)
STRH	R0, [R1, #0]
;Req3.c,17 :: 		curr1 = Button(&GPIOB_IDR, 1, 1, 1);
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
MOVW	R1, #lo_addr(_curr1+0)
MOVT	R1, #hi_addr(_curr1+0)
STRH	R0, [R1, #0]
;Req3.c,18 :: 		if (curr0 & prev0 == 0)
MOVW	R0, #lo_addr(_prev0+0)
MOVT	R0, #hi_addr(_prev0+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
MOVW	R1, #0
BNE	L__main9
MOVS	R1, #1
L__main9:
MOVW	R0, #lo_addr(_curr0+0)
MOVT	R0, #hi_addr(_curr0+0)
LDRH	R0, [R0, #0]
ANDS	R0, R1
CMP	R0, #0
IT	EQ
BEQ	L_main2
;Req3.c,21 :: 		prev0 = curr0;
MOVW	R0, #lo_addr(_curr0+0)
MOVT	R0, #hi_addr(_curr0+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_prev0+0)
MOVT	R0, #hi_addr(_prev0+0)
STRH	R1, [R0, #0]
;Req3.c,22 :: 		i++;
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Req3.c,23 :: 		if (i > 15)
CMP	R0, #15
IT	LE
BLE	L_main3
;Req3.c,26 :: 		i = 15;
MOVS	R1, #15
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
;Req3.c,27 :: 		}
L_main3:
;Req3.c,28 :: 		}
L_main2:
;Req3.c,29 :: 		if (curr1 & prev1 == 0)
MOVW	R0, #lo_addr(_prev1+0)
MOVT	R0, #hi_addr(_prev1+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
MOVW	R1, #0
BNE	L__main10
MOVS	R1, #1
L__main10:
MOVW	R0, #lo_addr(_curr1+0)
MOVT	R0, #hi_addr(_curr1+0)
LDRH	R0, [R0, #0]
ANDS	R0, R1
CMP	R0, #0
IT	EQ
BEQ	L_main4
;Req3.c,32 :: 		prev1 = curr1;
MOVW	R0, #lo_addr(_curr1+0)
MOVT	R0, #hi_addr(_curr1+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_prev1+0)
MOVT	R0, #hi_addr(_prev1+0)
STRH	R1, [R0, #0]
;Req3.c,33 :: 		i--;
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;Req3.c,34 :: 		if (i < 0)
CMP	R0, #0
IT	GE
BGE	L_main5
;Req3.c,37 :: 		i = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
;Req3.c,38 :: 		}
L_main5:
;Req3.c,39 :: 		}
L_main4:
;Req3.c,40 :: 		if (!curr0)
MOVW	R0, #lo_addr(_curr0+0)
MOVT	R0, #hi_addr(_curr0+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main6
;Req3.c,42 :: 		prev0 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_prev0+0)
MOVT	R0, #hi_addr(_prev0+0)
STRH	R1, [R0, #0]
;Req3.c,43 :: 		}
L_main6:
;Req3.c,45 :: 		if (!curr1)
MOVW	R0, #lo_addr(_curr1+0)
MOVT	R0, #hi_addr(_curr1+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main7
;Req3.c,47 :: 		prev1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_prev1+0)
MOVT	R0, #hi_addr(_prev1+0)
STRH	R1, [R0, #0]
;Req3.c,48 :: 		}
L_main7:
;Req3.c,49 :: 		GPIOD_ODR = i;
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;Req3.c,50 :: 		}
IT	AL
BAL	L_main0
;Req3.c,51 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
