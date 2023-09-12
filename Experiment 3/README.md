# 實驗3 內部RAM與Flash空間定址與存取
## 實驗內容
• 利用8051的六種定址法變更A暫存器的內容。

    1. 直接定址法 (Direct addressing)
    MOV A, 10H
    2. 間接定址法 (Indirect addressing)
    MOV A, @R0
    3. 暫存器定址法 (Register addressing)
    MOV A, R0
    4. 立即定址法 (Immediate addressing)
    MOV A, #10H
    5. 索引定址法 (Index addressing)
    MOVC A, @A+DPTR
    6. 位元定址法 (Bit addressing)
    SETB 03H
• 使用Keil C51 debug mode觀察8051內部暫存器的變化。

• 本週基礎題課程為純軟體模擬，不用接電路。
## 學習重點
• 8051內部記憶體 (Flash與RAM) 配置。

• 8051 register bank使用方式。

• 8051 的各種定址法使用，使用的指令包含了MOV、MOVC、SETB、
CLR。



