_BoxRound1OnClick:
;MyProject_events_code.c,9 :: 		void BoxRound1OnClick() {
;MyProject_events_code.c,10 :: 		GPIOD_ODR = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;MyProject_events_code.c,11 :: 		}
L_end_BoxRound1OnClick:
BX	LR
; end of _BoxRound1OnClick
_BoxRound2OnClick:
;MyProject_events_code.c,12 :: 		void BoxRound2OnClick() {
;MyProject_events_code.c,13 :: 		GPIOD_ODR = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;MyProject_events_code.c,14 :: 		}
L_end_BoxRound2OnClick:
BX	LR
; end of _BoxRound2OnClick
_BoxRound3OnClick:
;MyProject_events_code.c,15 :: 		void BoxRound3OnClick() {
;MyProject_events_code.c,16 :: 		GPIOD_ODR = GPIOD_ODR ^ 0xFFFF;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R1, [R0, #0]
MOVW	R0, #65535
EORS	R1, R0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;MyProject_events_code.c,17 :: 		}
L_end_BoxRound3OnClick:
BX	LR
; end of _BoxRound3OnClick
_Label1OnClick:
;MyProject_events_code.c,18 :: 		void Label1OnClick() {
;MyProject_events_code.c,19 :: 		GPIOD_ODR = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;MyProject_events_code.c,20 :: 		}
L_end_Label1OnClick:
BX	LR
; end of _Label1OnClick
_Label2OnClick:
;MyProject_events_code.c,21 :: 		void Label2OnClick() {
;MyProject_events_code.c,22 :: 		GPIOD_ODR = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;MyProject_events_code.c,23 :: 		}
L_end_Label2OnClick:
BX	LR
; end of _Label2OnClick
_Label3OnClick:
;MyProject_events_code.c,24 :: 		void Label3OnClick() {
;MyProject_events_code.c,25 :: 		GPIOD_ODR = GPIOD_ODR ^ 0xFFFF;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R1, [R0, #0]
MOVW	R0, #65535
EORS	R1, R0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;MyProject_events_code.c,26 :: 		}
L_end_Label3OnClick:
BX	LR
; end of _Label3OnClick
