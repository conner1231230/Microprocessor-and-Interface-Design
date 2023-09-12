        ORG 0            ; code start from 0
        MOV DPTR, #TABLE ; DPTR = ‘TABLE’ label address
        MOV A, #01H      ; A = 01H
        MOVC A, @A+DPTR  ; A = ??? 02H
        SJMP $           ; infinite loop
TABLE:  DB 01H    ; save 01H at ‘TABLE’ label address
        DB 02H           ; save 02H at ‘TABLE’ label +1 address
        END
