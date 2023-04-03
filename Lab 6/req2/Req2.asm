_main:
;Req2.c,2 :: 		void main()
;Req2.c,5 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL); // Set PORTD as digital output
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;Req2.c,6 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL); // Set PORTE as digital output
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Req2.c,8 :: 		GPIOD_ODR = 0; // Toggle PORTD
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;Req2.c,9 :: 		GPIOE_ODR = 0; // Toggle PORTE
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Req2.c,10 :: 		while (1)
L_main0:
;Req2.c,13 :: 		for (i = 0; i < 4; i++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main2:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #4
IT	GE
BGE	L_main3
;Req2.c,16 :: 		if (i == 0)
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main5
;Req2.c,19 :: 		GPIOD_ODR = 0b0001000100010001; // Toggle PORTD
MOVW	R1, #4369
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;Req2.c,20 :: 		GPIOE_ODR = 0b0001000100000000; // Toggle PORTE
MOVW	R1, #4352
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Req2.c,21 :: 		}
IT	AL
BAL	L_main6
L_main5:
;Req2.c,25 :: 		GPIOD_ODR |= GPIOD_ODR << 1; // Toggle PORTD
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;Req2.c,26 :: 		GPIOE_ODR |= GPIOE_ODR << 1; // Toggle PORTE
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Req2.c,27 :: 		}
L_main6:
;Req2.c,28 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main7:
SUBS	R7, R7, #1
BNE	L_main7
NOP
NOP
NOP
NOP
;Req2.c,13 :: 		for (i = 0; i < 4; i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Req2.c,30 :: 		}
IT	AL
BAL	L_main2
L_main3:
;Req2.c,32 :: 		for (i = 0; i < 4; i++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main9:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #4
IT	GE
BGE	L_main10
;Req2.c,35 :: 		if (i == 0)
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main12
;Req2.c,37 :: 		GPIOD_ODR = 0b1110111011101110; // Toggle PORTD
MOVW	R1, #61166
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;Req2.c,38 :: 		GPIOE_ODR = 0b1110111000000000; // Toggle PORTE
MOVW	R1, #60928
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Req2.c,39 :: 		}
IT	AL
BAL	L_main13
L_main12:
;Req2.c,42 :: 		GPIOD_ODR &= GPIOD_ODR << 1; // Toggle PORTD
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
AND	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;Req2.c,43 :: 		GPIOE_ODR &= GPIOE_ODR << 1; // Toggle PORTE
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
AND	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Req2.c,44 :: 		}
L_main13:
;Req2.c,45 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main14:
SUBS	R7, R7, #1
BNE	L_main14
NOP
NOP
NOP
NOP
;Req2.c,32 :: 		for (i = 0; i < 4; i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Req2.c,46 :: 		}
IT	AL
BAL	L_main9
L_main10:
;Req2.c,47 :: 		}
IT	AL
BAL	L_main0
;Req2.c,48 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
