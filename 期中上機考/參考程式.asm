    ORG     0
    JMP     MAIN    ; main function

    ; ============== register usage =================|
    ; ------ RB0: ---------------------------------- |
    ; R0 -> keyboard scanning index                  |
    ; R1 -> row counter for scanning keyboard        |
    ; R2 -> keyboard scanning output                 |
    ; R5, R6, R7 -> delay counter                    |
    ; ------ RB1: ---------------------------------- |
    ; R0, R1, R2 -> seven segment current value      |
    ; R3 -> count down delay counter                 |
    ; R4, R5, R6 -> seven segment saved value by ISR |
    ; R7 -> delay counter                            |
    ; ===============================================|

    ; =============== ISR for saving 
    ORG     03H     
    PUSH    PSW
    PUSH    ACC
    SETB    RS0     ; switch to RB1
    MOV     A, R0   ; save R0 to R4
    MOV     R4, A   
    MOV     A, R1   ; save R1 to R5
    MOV     R5, A
    MOV     A, R2   ; save R2 to R6
    MOV     R6, A   
    POP     ACC
    POP     PSW
    RETI

MAIN:   ; ======== init ========
    MOV SP, #32H        ; move stack pointer
    MOV IE, #10000001B  ; init interrupt
    SETB IT0            ; init interrupt
    ; ======== init seven segment ======== 
    SETB RS0    ; using RB1
    MOV R0, #0  ; R0 ~ R6 in RB1 set to 0
    MOV R1, #0
    MOV R2, #0
    MOV R4, #0
    MOV R5, #0
    MOV R6, #0
    CLR RS0     ; switch back to RB0
    ; ======== finish init =======
    
; ############# MAIN LOOP START HERE ###############
START_SCAN:             ; ======== start keyboard scanning
    MOV R0, #0          ; keyboard scanning index init to 0
    MOV R1, #4          ; row counter for scanning keyboard set to 4
    MOV R2, #11110111B  ; keyboard scanning output
SCAN:                   ; =========== keyboard scanning =============|
    MOV A, R2           ;                                            |
    MOV P2, A           ; just like lab 2, send scanning signal      |
    JNB P2.7, KEY_IN    ; to P2, check if P2.7 - P2.4 is low,        |
    INC R0              ; and use R0 as counter to determined        |
    JNB P2.6, KEY_IN    ; whitch button was pressed.                 |
    INC R0              ;                                            |
    JNB P2.5, KEY_IN    ; if pressed, jump to KEYIN to handle,       |
    INC R0              ; if no one pressed, rotate right            |
    JNB P2.4, KEY_IN    ; scanning signal to scan next row.          |
    INC R0              ; after scanning four row, we                |
    RR A                ; finished scanning process.                 |
    MOV R2, A           ;                                            |
    DJNZ R1, SCAN       ; ===========================================|
KEY_OUT:                ; ======== finish scanning keyboard, now display seven seg
    CALL SHOW_SEG       ; ******** here show seven seg *********
    SJMP START_SCAN     ; jump to scan keyboard 
; ############# MAIN LOOP END HERE #################

; ############# KEY IN HANDLER #####################
KEY_IN:  
    CALL DEL_300_MS     ; debounce

    MOV DPTR, #KEYB_TBL ; ========================================|
    MOV A, R0           ; get witch key clicked by KEYB_TBL table |
    MOVC A, @A+DPTR     ; ========================================|
           
    CJNE A, #0CH, NEXT1 ; check if press 'C', if not, jump to NEXT1
    JMP COUNT_DOWN      ; press 'C', jump to COUNT_DOWN
NEXT1:  
    CJNE A, #0AH, NEXT2 ; check if press 'A', if not, jump to NEXT2
    JMP INC_CURRENT     ; press 'A', jump to COUNT_DOWN
NEXT2:  
    CJNE A, #0BH, NEXT3 ; check if press 'B', if not, jump to NEXT3
    JMP DEC_CURRENT     ; press 'B', jump to COUNT_DOWN
NEXT3:  
    CALL SAVE_KEY_IN     ; press number (0~9), handle it. 
    JMP KEY_OUT         ; jump to KEY_OUT (HACK: if press D E F, I dont care what will happen)
; ############# KEY IN HANDLER FINISHED #####################

; ############# INCREASE / DECREASE HANDLER #################
INC_CURRENT:
    PUSH PSW    ; push PSW 
    SETB RS0    ; switch to RB1
    INC R1      ; increase R1 (units digit)
    CJNE R1, #10, POP_AND_OUT ; if R1 != 10, jump out
    MOV R1, #0  ; R1 == 10, set to 0 and have to increase R0 
    INC R0      ; increase R0 (tens digit)
    JMP POP_AND_OUT ; jump out

DEC_CURRENT:
    PUSH PSW    ; push PSW 
    SETB RS0    ; switch to RB1
    DEC R1      ; decrease R1 (units digit)
    CJNE R1, #-1, POP_AND_OUT ; if R1 != -1, jump out (-1 == 255 == 11111111B)
    MOV R1, #9  ; R1 == -1, set to 9 and have to decrease R0 
    DEC R0      ; decrease R0 (tens digit)
    JMP POP_AND_OUT ; jump out

POP_AND_OUT: ; just pop and out
    POP PSW
    JMP KEY_OUT
; ############# INCREASE / DECREASE HANDLER FINISHED #############

; ############# SAVE KEY IN ############
SAVE_KEY_IN:    ; NOTE: now keyboard value saved in A
    PUSH PSW    ; push PSW
    SETB RS0    ; switch to RB1
    MOV R7, A   ; R7 just a temp, move A to R7
    MOV A, R1   ; move R1 to R0
    MOV R0, A   ; move R1 to R0
    MOV A, R7   ; move R7 to R1 (keyboard value)
    MOV R1, A   ; move R7 to R1 (keyboard value)
    POP PSW     ; pop PSW
    RET
; ############# SAVE KEY IN FINISHED ###

; ############# COUNT DOWN (press C) ###############
COUNT_DOWN:
    PUSH PSW    ; push PSW
    SETB RS0    ; switch to RB1

DECREASE_LOOP:  
    MOV R3, #100        ; just a counter
SHOW_LOOP: 
    CALL SHOW_SEG       ; show seven seg, NOTE: here takes about 1 ms
    DJNZ R3, SHOW_LOOP  ; loop 100 times, so takes about 100 ms, now we successfully delay 0.1 second 
    
; ------------- now decrease seven seg value ------------
    MOV A, R2           ; first for R2 (decimal value)
    JZ  DECREASE_R1     ; if R2 == 0, jump to DECREASE_R1 (JZ jump if A == 0)
    DEC R2              ; R2 != 0, decrease
    JMP DECREASE_LOOP   ; back to decrease loop
DECREASE_R1:
    MOV A, R1           ; for R1 (units value)
    JZ  DECREASE_R0     ; if R1 == 0, jump to DECREASE_R0 (JZ jump if A == 0)
    DEC R1              ; R1 != 0, decrease
    MOV R2, #9          ; set R2 = 9
    JMP DECREASE_LOOP   ; back to decrease loop
DECREASE_R0:
    MOV A, R0           ; for R0 (tens value)
    JZ ALL_ZERO         ; if R0 == 0, finish down count
    DEC R0              ; R0 != 0, decrease
    MOV R1, #9          ; set R1 = 9
    MOV R2, #9          ; set R2 = 9
    JMP DECREASE_LOOP   ; back to decrease loop
; ------------- decrease seven seg value ------------
ALL_ZERO:
    MOV A, R4   ; --- show value that saved by PSW (default 00.0) ---
    MOV R0, A   ; R4 -> R0
    MOV A, R5   ;
    MOV R1, A   ; R5 -> R1
    MOV A, R6   ;
    MOV R2, A   ; R6 -> R2
    POP PSW
    JMP KEY_OUT 
; ############# COUNT DOWN FINISHED #############

; ====== delay 300 ms for debounce ======
DEL_300_MS: MOV R5, #3
DEL_100_MS: MOV R6, #200
DEL_500_US: MOV R7, #250
            DJNZ R7, $
            DJNZ R6, DEL_500_US 
            DJNZ R5, DEL_100_MS 
            RET 
; ======  end for delay 300 ms ======

; show seven seg, takes about 1 ms
SHOW_SEG:
    MOV DPTR, #SHOW_TBL ; move to seven seg table
    PUSH PSW            ; push PSW
    SETB RS0            ; switch to RB1
    CLR P3.5            ; ======== tens digit ===================| 
    MOV A, R0           ; set P3.5 to low, get value from R0,    |
    MOVC A, @A+DPTR     ; and get seven seg's display signal     |
    MOV P1, A           ; from SHOW_TBL table.                   |
    CALL DEL_330_US     ; delay 330 us, and stop display.        |
    SETB P3.5           ; =======================================|
    CLR P3.6            ; ======== units digit ==================| 
    MOV A, R1           ; set P3.6 to low, get value from R1,    |
    MOVC A, @A+DPTR     ; and get seven seg's display signal     |
    MOV P1, A           ; from SHOW_TBL table.                   |
    CLR P1.7            ; --- display digit point ---            |
    CALL DEL_330_US     ; delay 330 us, and stop display.        |
    SETB P3.6           ; =======================================|
    CLR P3.7            ; ======== decimal ======================|
    MOV A, R2           ; set P3.6 to low, get value from R1,    |
    MOVC A, @A+DPTR     ; and get seven seg's display signal     |
    MOV P1, A           ; from SHOW_TBL table.                   |
    CALL DEL_330_US     ; delay 330 us, and stop display.        |
    SETB P3.7           ; ======== decimal ======================|
    POP PSW             ; pop PSW 
    RET

DEL_330_US:             ; Delay 330 us
    MOV R7, #164
    DJNZ R7, $      
    RET 

KEYB_TBL: ; keyboard table 
    DB 01H    
    DB 02H
    DB 03H
    DB 0AH
    DB 04H
    DB 05H
    DB 06H
    DB 0BH
    DB 07H
    DB 08H
    DB 09H
    DB 0CH
    DB 0EH
    DB 00H
    DB 0FH
    DB 0DH

SHOW_TBL: ; seven seg table
    DB 11000000B    ; 0
    DB 11111001B    ; 1
    DB 10100100B    ; 2
    DB 10110000B    ; 3
    DB 10011001B    ; 4
    DB 10010010B    ; 5
    DB 10000010B    ; 6
    DB 11111000B    ; 7
    DB 10000000B    ; 8
    DB 10010000B    ; 9
END
