# 實驗4 算術及邏輯運算指令
## 實驗內容 
• 算術運算實驗：
  計算 (32h − 06h) × 7h 與 (64h + 0Dh) ÷ 06h ，觀察Debug Mode中的
  特殊功能暫存器，分別換算出算式的十進制答案。
  
• 邏輯運算實驗：
  利用邏輯運算指令先將 #10111101B 中的第4位元變為0，存入暫存器B，
  再將 #01000010B 中的第4位元變為1，最後透過NOT邏輯運算，使第二個值
與第一個值相同

## 學習重點
• 熟悉組合語言中算術運算指令 (如：ADD、SUBB、MUL、DIV等)

• 熟悉組合語言中邏輯運算指令 (如：ANL、ORL、NOT等)

• 了解8051與運算相關的特殊功能暫存器 (如：PSW、ACC、B等)

## 軟體流程圖
![image](https://github.com/conner1231230/Microprocessor-and-Interface-Design/assets/94916111/abfe29bd-abd8-4823-a0f1-7caec18712d8)




### 進階題
在單顆七段顯示器上執行2、3、5的四則運算。

選擇鍵盤上的其中一列或其中一行，假設選擇的一行依序為A、B、C、D：

按下鍵盤上的 "A"，則執行 3+2=5 的運算，並將和 "5" 顯示在七段顯示器上。

按下鍵盤上的 "B"，則執行 3-2=1 的運算，並將差 "1" 顯示在七段顯示器上。

按下鍵盤上的 "C"，則執行 3×2=6 的運算，並將積 "6" 顯示在七段顯示器上。

按下鍵盤上的 "D"，則執行 5÷2=2…1 的運算，先將商 "2" 顯示在七段顯示器上，延遲125毫秒後，顯示餘數 "1"。

注意：請使用加減乘除的指令，並利用查表法找到要顯示的數字，不要直接把答案移入七段顯示器!!在四合一七段顯示器上顯示學號後四碼
![image](https://github.com/conner1231230/Microprocessor-and-Interface-Design/assets/94916111/5ceda3c8-cc7f-480c-9767-a6ae1c32e8a0)

