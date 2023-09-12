#include "regx51.h"


void init_uart() ; //declare UART initial function
char recivevalue[9] ; //accept input datas
char answer[9]="E94071136";
char cor[11]=" Correct\r\n\0";
char wro[9]=" Wrong\r\n\0";
int count=0,correct=0,i,f=0;

void main( )
 {
  init_uart(); //call UART
  while(1){}
 }

void init_uart(void)\
 {
  SCON=0x50; //set SCON mode 1
  TMOD=0x20; //call TIMR1's mode2
  TH1=0xe6; //set baud 1200
  TR1=1; //set Timer1 in TCON, TR1 = 1
  IE=0x90; //call UART interrupt setting, EA and ES be 1
 }

void UART_ISR(void) interrupt 4
{
 if(RI==1){ //if receive interrupt
  RI=0;
  if(count<8){
   recivevalue[count]=SBUF; //put SBUF value into recivevalue
   P2=recivevalue[count];//display input by LED to perceive
   count++;   
  }
  else{
   recivevalue[count]=SBUF;
   P2=recivevalue[count];
   count=0;
   for(i=8;i>=0;i--){
    if(recivevalue[i] == answer[i]){
     correct+=1;
    }
    else{
     correct+=0;
    }
   }
   if(correct==9){
    for(i=0;i<11;i++){
     SBUF=cor[i];
     for(f=10000;f>0;f--){}
    }
    correct=0;
   }
   else{
    for(i=0;i<9;i++){
     SBUF=wro[i];
     for(f=10000;f>0;f--){}
    }
    correct=0;
   }
  }
 }
 if(TI==1){ //if tran interrupt
  TI=0; //set TI back to 0
 }
}
