# 實驗7 計時計數器
## 實驗目的
• 了解8051之Timer與相關暫存器

## 實驗電路
![image](https://github.com/conner1231230/Microprocessor-and-Interface-Design/assets/94916111/65d0931c-97b1-4879-9431-965e30950af0)

### 進階題

使8051通電後點亮P2.0的LED，並設計一顆按鈕，當按住它之後，每兩秒鐘會使點亮的LED向左平移，也就是像實驗五的跑馬燈一樣，只是間隔變成兩秒且只有按住按鈕時會跑動。

Hint：Timer請使用mode 1，並設定其為外部啟動（gate = high）
