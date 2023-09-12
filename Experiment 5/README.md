# 實驗5 
## 實驗目的 
• 觀察並了解PC、SP等暫存器變化

• 熟悉CALL、RET等指令

• 了解CALL與JMP不同之處

• 了解8051之堆疊觀念

• 熟悉PUSH、POP等堆疊相關指令

## 實驗問題 - 按鈕觸發跑馬燈
• 按下連接P1.0的按鈕後啟動
• 連接於P2的8個LED依序發亮
• 利用堆疊便能僅用R0一個暫存器達成多層迴圈

## 實驗電路圖
![image](https://github.com/conner1231230/Microprocessor-and-Interface-Design/assets/94916111/5f19817a-a8ba-46ad-9a67-7b3e4e2da4af)



### 進階題
請達成以下要求：

1.當8051通電後，連接於P2的8個LED開始以跑馬燈的方式依序點亮，一次亮兩顆
範例：O表示亮的LED，X表示暗的
第零秒	XXXXXXOO
第一秒	XXXXXOOX
第二秒	XXXXOOXX
第八秒	OXXXXXXO
第九秒  XXXXXXOO

2.於P1連接上兩顆按鈕，一顆為PUSH功能鈕，另一顆則為POP功能鈕
PUSH鈕的功能為將目前的跑馬燈狀態儲存進堆疊中
POP鈕的功能則為將儲存在堆疊的跑馬燈狀態依序展現出來
範例：我在以下的燈號狀態下按下PUSH鈕
XXXXOOXX
XXXXXXOO
XOOXXXXX
OXXXXXXO
XOOXXXXX
當我按下POP鈕後，跑馬燈會停止，且LED會以以下順序點亮
XOOXXXXX
OXXXXXXO
XOOXXXXX
XXXXXXOO
XXXXOOXX

Hint：

1.本題沒有要求要檢查堆疊的東西是否POP完了，因此按下POP鈕後除非RESET 8051，否則LED不會再次進入跑馬燈狀態。

2.因為是使用按鈕，請記得程式中要有DEBOUNCE的功能，以免按下PUSH鈕後多次儲存重複的資料到堆疊。

3.跑馬燈的部分不建議沿用基礎題的程式，除非你對基礎題的程式流程十分了解，否則最好自己重寫一個。

4.P2的記憶體位址是A0h
