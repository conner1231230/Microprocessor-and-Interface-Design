ORG 0         ; code start from 0
MOV 20H, #00H ; address 20H = 00H
SETB 20H.1    ; address 20H bit 1 = 1
MOV A, 20H    ; A = ??? 02H
SETB 03H      ; bit address 03H = 1
MOV A, 20H    ; A = ??? 0AH
SJMP $        ; infinite loop
END
