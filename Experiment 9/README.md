# 實驗9 ADC的轉換應用
## 實驗內容 
• 利用可變電阻輸入電壓分壓給ADC0804轉為數位訊號，8051接收後判定是否超過電壓門檻(設為輸入最大輸入類比電壓的一半)，若超過則LED燈全亮。


## 學習重點
• 了解ADC轉換訊號的原理

• 了解ADC0804轉換IC的使用方法

• 比較Polling和Interrupt轉換方式的差別

## 實驗電路圖
![image](https://github.com/conner1231230/Microprocessor-and-Interface-Design/assets/94916111/3b012bb9-3d48-4c9d-b2ab-8d2387b3d644)


## 軟體流程圖 - 中斷
![image](https://github.com/conner1231230/Microprocessor-and-Interface-Design/assets/94916111/0f87ac04-2c04-4857-8665-aeb90830c16d)

## 軟體流程圖 - 輪詢法
![image](https://github.com/conner1231230/Microprocessor-and-Interface-Design/assets/94916111/ed6e4f80-4c9f-4629-a2d8-61d75573649e)


### 進階題

利用可變電阻輸入電壓分壓給ADC0804轉為數位訊號，並由8051接收後控制8顆LED燈在可變電阻旋轉時由全不亮漸多到全亮(漸亮的間隔要平均)。

注意: 請使用中斷方法。
