# 實驗6 中斷
## 實驗內容 
• 利用一顆外接按鈕實現外部中斷，並藉由LED之閃爍呈現結果。
基礎題有兩小題，分別用兩種方式觸發中斷。
(1.負緣觸發2.低準位觸發)

## 學習重點
• 了解中斷用途。

• 認識8051的中斷源以及與中斷相關之暫存器。

• 熟悉8051中斷流程。

## 實驗電路圖

![image](https://github.com/conner1231230/Microprocessor-and-Interface-Design/assets/94916111/268f901d-c4d3-4f68-a49f-fe3db22eec83)
## 軟體流程圖

![image](https://github.com/conner1231230/Microprocessor-and-Interface-Design/assets/94916111/74239d24-b14b-4b3e-85a4-dbe7d14ec536)


### 進階題
請達成以下要求：

1.平時為8顆LED同時閃爍。

2.按下INT0的按鈕會執行三圈四顆LED跑馬燈，按下INT1的按鈕會執行兩圈單顆LED跑馬燈。

3.當四顆LED跑馬燈在跑的時候按下INT1需要先去跑完兩圈單顆LED跑馬燈，再回去繼續跑完四顆LED跑馬燈，而跑完四顆LED跑馬燈會八顆LED同時閃爍。

4.同時按下INT0和INT1會執行兩圈單顆LED跑馬燈。

5.INT0與INT1皆使用低準位觸發。

備註:
單顆LED跑馬燈示意圖:

XXXXXXXO

XXXXXXOX

XXXXXOXX

XXXXOXXX

XXXOXXXX

XXOXXXXX

XOXXXXXX

OXXXXXXX

四顆LED跑馬燈示意圖:
XXXXOOOO

XXXOOOOX

XXOOOOXX

XOOOOXXX

OOOOXXXX

OOOXXXXO

...(以此類推)

