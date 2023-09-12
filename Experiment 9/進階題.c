#include "regx51.h"

 void main()
 {
  IT0 = 0; 
  EX0 = 1; 
  EA = 1; 
  P3 &= 0xef; 
  P3 |= 0x10; 
  while(1) 
  {
  }
 }
void int_0(void) interrupt 0
 {
  P3 &= 0xDF; 
  if(P1<5)
   {
    P2=255;
   } 
  else if(P1 < 32&&P1>5)
   {
    P2=254;
   }
  else if(P1 <64&& P1 >32)
   {
    P2=252;
   }
  else if(P1 <96&& P1>64)
   {
    P2=248;
   }
  else if(P1 <128&& P1>96)
   {
    P2=240;
   }
  else if(P1 <160&& P1>128)
   {
    P2=224;
   }
  else if(P1 <192&& P1>160)
   {
    P2=192;
   }
  else if(P1 <224&& P1>192)
   {
    P2=128;
   }
  else if(P1 <256&& P1>224)
   {
    P2=0;
   } 
 
 
  P3 |= 0x20; 
  P3 &= 0xef; 
  P3 |= 0x10; 
 }
