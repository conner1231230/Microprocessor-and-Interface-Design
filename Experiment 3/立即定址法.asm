ORG 0         ; code start from 0
MOV R0, #30H  ; R0 = 30H
MOV R1, #10H  ; R0 = 10H
MOV 30H, #55H ; address 30H = 55H
MOV 31H, #24H ; address 31H = 24H
MOV A, #31H   ; A = ??? 31H
SJMP $        ; infinite loop
END
