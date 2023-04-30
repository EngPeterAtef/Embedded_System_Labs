_main:
;req2.c,34 :: 		void main()
;req2.c,36 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL); // Set PORTD as digital output
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;req2.c,37 :: 		GPIOD_ODR = 0;                                       // Toggle PORTE
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;req2.c,39 :: 		period = PWM_TIM4_Init(4000); // initializes timer 1 in PWM mode with 25 kHz frequency
MOVW	R0, #4000
BL	_PWM_TIM4_Init+0
MOVW	R1, #lo_addr(_period+0)
MOVT	R1, #hi_addr(_period+0)
STRH	R0, [R1, #0]
;req2.c,42 :: 		while (1)
L_main0:
;req2.c,44 :: 		for (i = 0; i <= period; i++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main2:
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_main3
;req2.c,46 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;req2.c,47 :: 		PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PD12);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH1_PD12+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH1_PD12+0)
MOVS	R0, #0
BL	_PWM_TIM4_Start+0
;req2.c,48 :: 		Delay_us(500);
MOVW	R7, #2665
MOVT	R7, #0
NOP
NOP
L_main5:
SUBS	R7, R7, #1
BNE	L_main5
NOP
NOP
;req2.c,44 :: 		for (i = 0; i <= period; i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;req2.c,49 :: 		}
IT	AL
BAL	L_main2
L_main3:
;req2.c,52 :: 		for (i = 0; i <= period; i++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main7:
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_main8
;req2.c,54 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL2);
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #1
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;req2.c,55 :: 		PWM_TIM4_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM4_CH2_PD13);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH2_PD13+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH2_PD13+0)
MOVS	R0, #1
BL	_PWM_TIM4_Start+0
;req2.c,56 :: 		Delay_us(500);
MOVW	R7, #2665
MOVT	R7, #0
NOP
NOP
L_main10:
SUBS	R7, R7, #1
BNE	L_main10
NOP
NOP
;req2.c,52 :: 		for (i = 0; i <= period; i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;req2.c,57 :: 		}
IT	AL
BAL	L_main7
L_main8:
;req2.c,60 :: 		for (i = 0; i <= period; i++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main12:
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_main13
;req2.c,62 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;req2.c,63 :: 		PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PD14);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH3_PD14+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH3_PD14+0)
MOVS	R0, #2
BL	_PWM_TIM4_Start+0
;req2.c,64 :: 		Delay_us(500);
MOVW	R7, #2665
MOVT	R7, #0
NOP
NOP
L_main15:
SUBS	R7, R7, #1
BNE	L_main15
NOP
NOP
;req2.c,60 :: 		for (i = 0; i <= period; i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;req2.c,65 :: 		}
IT	AL
BAL	L_main12
L_main13:
;req2.c,68 :: 		for (i = 0; i <= period; i++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main17:
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_main18
;req2.c,70 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #3
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;req2.c,71 :: 		PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PD15);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH4_PD15+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH4_PD15+0)
MOVS	R0, #3
BL	_PWM_TIM4_Start+0
;req2.c,72 :: 		Delay_us(500);
MOVW	R7, #2665
MOVT	R7, #0
NOP
NOP
L_main20:
SUBS	R7, R7, #1
BNE	L_main20
NOP
NOP
;req2.c,68 :: 		for (i = 0; i <= period; i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;req2.c,73 :: 		}
IT	AL
BAL	L_main17
L_main18:
;req2.c,76 :: 		for (i = period; i >= 0; i--)
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main22:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L_main23
;req2.c,78 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;req2.c,79 :: 		PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PD12);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH1_PD12+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH1_PD12+0)
MOVS	R0, #0
BL	_PWM_TIM4_Start+0
;req2.c,80 :: 		Delay_us(500);
MOVW	R7, #2665
MOVT	R7, #0
NOP
NOP
L_main25:
SUBS	R7, R7, #1
BNE	L_main25
NOP
NOP
;req2.c,76 :: 		for (i = period; i >= 0; i--)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
STRH	R0, [R1, #0]
;req2.c,81 :: 		}
IT	AL
BAL	L_main22
L_main23:
;req2.c,83 :: 		PWM_TIM4_Stop(_PWM_CHANNEL1);
MOVS	R0, #0
BL	_PWM_TIM4_Stop+0
;req2.c,84 :: 		for (i = period; i >= 0; i--)
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main27:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L_main28
;req2.c,86 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL2);
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #1
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;req2.c,87 :: 		PWM_TIM4_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM4_CH2_PD13);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH2_PD13+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH2_PD13+0)
MOVS	R0, #1
BL	_PWM_TIM4_Start+0
;req2.c,88 :: 		Delay_us(500);
MOVW	R7, #2665
MOVT	R7, #0
NOP
NOP
L_main30:
SUBS	R7, R7, #1
BNE	L_main30
NOP
NOP
;req2.c,84 :: 		for (i = period; i >= 0; i--)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
STRH	R0, [R1, #0]
;req2.c,89 :: 		}
IT	AL
BAL	L_main27
L_main28:
;req2.c,91 :: 		PWM_TIM4_Stop(_PWM_CHANNEL2);
MOVS	R0, #1
BL	_PWM_TIM4_Stop+0
;req2.c,92 :: 		for (i = period; i >= 0; i--)
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main32:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L_main33
;req2.c,94 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;req2.c,95 :: 		PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PD14);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH3_PD14+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH3_PD14+0)
MOVS	R0, #2
BL	_PWM_TIM4_Start+0
;req2.c,96 :: 		Delay_us(500);
MOVW	R7, #2665
MOVT	R7, #0
NOP
NOP
L_main35:
SUBS	R7, R7, #1
BNE	L_main35
NOP
NOP
;req2.c,92 :: 		for (i = period; i >= 0; i--)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
STRH	R0, [R1, #0]
;req2.c,97 :: 		}
IT	AL
BAL	L_main32
L_main33:
;req2.c,99 :: 		PWM_TIM4_Stop(_PWM_CHANNEL3);
MOVS	R0, #2
BL	_PWM_TIM4_Stop+0
;req2.c,100 :: 		for (i = period; i >= 0; i--)
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main37:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LT
BLT	L_main38
;req2.c,102 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #3
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;req2.c,103 :: 		PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PD15);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH4_PD15+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH4_PD15+0)
MOVS	R0, #3
BL	_PWM_TIM4_Start+0
;req2.c,104 :: 		Delay_us(500);
MOVW	R7, #2665
MOVT	R7, #0
NOP
NOP
L_main40:
SUBS	R7, R7, #1
BNE	L_main40
NOP
NOP
;req2.c,100 :: 		for (i = period; i >= 0; i--)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
STRH	R0, [R1, #0]
;req2.c,105 :: 		}
IT	AL
BAL	L_main37
L_main38:
;req2.c,107 :: 		PWM_TIM4_Stop(_PWM_CHANNEL4);
MOVS	R0, #3
BL	_PWM_TIM4_Stop+0
;req2.c,108 :: 		}
IT	AL
BAL	L_main0
;req2.c,109 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
