#include "regx51.h"

void main()
{
    IT0 = 0; //開啟外部中斷信號種類-負緣觸發(TCON)
    EX0 = 1; //致能外部中斷EX0(IE)
    EA = 1; //開全部中斷致能位元(IE)
    P3 &= 0xef; //11101111 WR(P3.4)設為0 ADC開始轉換
    P3 |= 0x10; //WR=1，停止持續轉換
    while(1) //主程式持續執行
    {
    }
}

void int_0(void) interrupt 0 //INT0中斷函式
{
    P3 &= 0xDF; //設定RD為0，開啟資料讀取接腳
    if(P1 > 256/2)
    {
        P2=0;
    }
    else
    {
        P2=255;
    }
    P3 |= 0x20; //RD=1，停止讀取
    P3 &= 0xef; //11101111 WR(P3.4)設為0 ADC開始轉換
    P3 |= 0x10; //WR=1，暫停持續轉換
}
