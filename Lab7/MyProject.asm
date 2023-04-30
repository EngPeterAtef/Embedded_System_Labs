_main:
;MyProject.c,4 :: 		void main()
;MyProject.c,6 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL); // Set PORTD as digital output
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;MyProject.c,7 :: 		GPIOE_ODR = 0;                                       // Toggle PORTE
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;MyProject.c,9 :: 		period = PWM_TIM1_Init(500); // initializes timer 1 in PWM mode with 25 kHz frequency
MOVW	R0, #500
BL	_PWM_TIM1_Init+0
MOVW	R1, #lo_addr(_period+0)
MOVT	R1, #hi_addr(_period+0)
STRH	R0, [R1, #0]
;MyProject.c,11 :: 		PWM_TIM1_Set_Duty(0.2 * period, _PWM_NON_INVERTED, _PWM_CHANNEL4);
VMOV	S1, R0
VCVT.F32	#0, S1, S1
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
UXTH	R0, R0
MOVS	R2, #3
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;MyProject.c,13 :: 		PWM_TIM1_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM1_CH4_PE14);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH4_PE14+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH4_PE14+0)
MOVS	R0, #3
BL	_PWM_TIM1_Start+0
;MyProject.c,14 :: 		while (1)
L_main0:
;MyProject.c,17 :: 		}
IT	AL
BAL	L_main0
;MyProject.c,21 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
