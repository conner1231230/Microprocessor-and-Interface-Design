# 實驗8 UART傳輸
## 實驗內容 
• 利用終端機軟體輸入資料給8051並透過UART傳送給8051，8051接過判斷是否為正確字串後，傳送判斷結果給PUTTY終端機呈現結果

• 資料需以字元和數值方式傳送。


## 學習重點
• 了解UART傳輸的原理

• 了解鮑率的計算方式和石英震盪器頻率選的擇原因

• 比較Polling和Interrupt傳輸方式的差別

## 實驗電路圖 - 
![image](https://github.com/conner1231230/Microprocessor-and-Interface-Design/assets/94916111/b43ad5be-4058-4c3c-89bb-4e3e08c90a26)

## 軟體流程圖 - 中斷
![image](https://github.com/conner1231230/Microprocessor-and-Interface-Design/assets/94916111/a4b9337e-64be-4bfb-9f7a-6c17c246999c)

## 軟體流程圖 - 輪詢法
![image](https://github.com/conner1231230/Microprocessor-and-Interface-Design/assets/94916111/e9c9acae-570f-4192-9d63-366b9c7a3cb0)


### 進階題

利用終端機軟體輸入學號並透過UART傳送給8051，8051接收資料後判斷學號是否為正確，最後傳送判斷結果給PUTTY終端機呈現結果，正確回傳correct，錯誤則回傳wrong，且每次判定後回傳的字串要換行並從第一個字開始輸出。

(HINT:可用傳送數值方法傳送ASCII)。
