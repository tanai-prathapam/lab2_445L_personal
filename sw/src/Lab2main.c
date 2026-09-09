/* Lab2main.c
 * This is a C language project that implements ECE445L Lab2.
 * Jonathan Valvano
 * June 25, 2026
 * Analog distance sensors, one sensor needed
 *   PB24 is center IR distance sensor, ADC0 channel 5
 * Debugging pins
 *   PB22 BLUE LED triple toggles in ISR sampling
 *   PB27 GREEN LED toggles during main program
 * SSD1306 I2C OLED (optional)
 *   PB2  SCL I2C clock
 *   PB3  SDA I2C data
 * Timer G12 continous counting at 12.5ns for profiling
 * Timer G0 periodic 1kHz sampling
 */

#include <ti/devices/msp/msp.h>
#include "../inc/LaunchPad.h"
#include "../inc/Clock.h"
#include "../inc/SSD1306.h"
#include "../inc/Timer.h"
#include "../inc/UART.h"
#define SSD1306 1
int32_t Averaging=0; // 0 to 6 to study CLT

void ADC_Init5(void){ // initialize ADCO channel 5
   // ****ECE445L write this ****

}
int32_t ADC_In5(void){
   // ****ECE445L write this ****
 return 42;
}
int32_t ADC_InAverage(void){
   // ****ECE445L write this ****
  return 42;
}
// debugging dump variables
#define BUFSIZE 1000
uint32_t TimeBuf[BUFSIZE]; // in bus cycles
int32_t DataBuf[BUFSIZE];  // 0 to 4095 assuming constant analog input
volatile uint32_t Num;     // index from 0 to BUFSIZE-1

// time jitter variables
uint32_t MinT;    // minimum(TimeBuf[i-1] – TimeBuf[i]) for i equals 1 to BUFSIZE-1
uint32_t MaxT;    // maximum(TimeBuf[i-1] – TimeBuf[i]) for i equals 1 to BUFSIZE-1
uint32_t Jitter;  // MaxT – MinT (in bus cycles)
#define MAXPERIOD 64
uint16_t Periods[MAXPERIOD];  // histogram of times between ADC triggers, optional

// SNR variables
uint32_t Vmin, Vmax, PMFmax;
int32_t Signal,Noise,SNR,Distance;
uint16_t PMF[100];  // histogram of ADC samples

// Samples ADC at 1000 Hz
void TIMG0_IRQHandler(void){
  if((TIMG0->CPU_INT.IIDX) == 1){ // this will acknowledge
    int32_t ADCvalue;
    GPIOB->DOUTTGL31_0 = BLUE;  // profile PB22
    GPIOB->DOUTTGL31_0 = BLUE;  // profile PB22
   // ****ECE445L write this ****

  }
  GPIOB->DOUTTGL31_0 = BLUE;  // profile PB22
}
void CalculateJitter(void){int i;
// MaxT = maximum(Time[i-1] – Time[i]) for i equals 1 to 999
// MinT = minimum(Time[i-1] – Time[i]) for i equals 1 to 999
// Jitter = MaxT – MinT 
   // ****ECE445L write this ****



}
uint32_t sqrt2(uint32_t s){ int n; // loop counter
uint32_t t;            // t*t will become s
  t = s/16+1;          // initial guess
  for(n = 16; n; --n){ // will finish
    t = ((t*t+s)/t)/2;
  }
  return t;
}

void CalculateSNR(void){
  // signal is the average of BUFSIZE ADC samples
  // noise is the standard deviation of the BUFSIZE ADC samples
  // SNR = signal/noisem(no floating point allowed)
   // ****ECE445L write this ****
   
   
}
void CreatePMF(void){
  int i;
  Vmin = 0xFFFFFFFF; Vmax = 0;
  for(i=0; i<BUFSIZE; i++){uint32_t v;
    v = DataBuf[i];
    if(v>Vmax) Vmax = v;
    if(v<Vmin) Vmin = v;
  }    
  for(i=0; i<100; i++){
    PMF[i] = 0;
  }    
  if(Vmin>25) Vmin = Vmin-25;   // room     
  PMFmax = 0;       
  for(i=0; i<BUFSIZE; i++) {
    uint32_t v;
    v = DataBuf[i];
    if((v>=Vmin)&&(v<(Vmin+100))){
      PMF[v-Vmin]++;
      if(PMF[v-Vmin]>PMFmax) PMFmax =PMF[v-Vmin];
    }        
  }
  UART_OutString("Averaging =");UART_OutUDec(Averaging); UART_OutChar(CR); UART_OutChar(LF);
  for(i=0; i<100; i++){
    UART_OutUDec(Vmin+i); UART_OutChar(',');UART_OutUDec(PMF[i]); 
    UART_OutChar(CR); UART_OutChar(LF);
  }
}
  
// d = A/(ADCvalue+B);
// long range IR GP2Y0A21YK0F

int32_t IR_Convert(int32_t n){  // returns distance in mm
   // ****ECE445L write this ****
    return 42;
}


// ----------------------------------------------------------------------
// -------------------    MAIN with/without SSD1306  ----------------------------------------
// ----------------------------------------------------------------------
// PMF output to serial port
// Sensor data to SSD1306
int main(void){ int touch;
  __disable_irq(); 
  LaunchPad_Init();  
  Clock_Init_HFXT_40_80MHz(0);  // 0.005% accurate running off external crystal oscillator

#if SSD1306
  SSD1306_Init(SSD1306_SWITCHCAPVCC);
  SSD1306_ClearBuffer();
  SSD1306_OutBuffer();
  SSD1306_SetCursor(0,0);
  SSD1306_OutString("Lab 2");
  SSD1306_SetCursor(0,1);
  SSD1306_OutString("Ave =");
  SSD1306_SetCursor(0,2);
  SSD1306_OutString("ADC =");
  SSD1306_SetCursor(0,3);
  SSD1306_OutString("Dis =");
  SSD1306_SetCursor(0,4);
  SSD1306_OutString("Nois=");
  SSD1306_SetCursor(0,5);
  SSD1306_OutString("SNR =");  
  #endif
  TimerG12_Init();

  UART_Init();  // to print the PMF
  TimerG0_IntArm(1000,40,1); // 1kHz, priority=1
  ADC_Init5();           // ADC0 channel 5
__enable_irq();
  while(1){
#if SSD1306
    SSD1306_SetCursor(6,1);
    SSD1306_OutUDec(1<<Averaging);
#endif
    Num = 0;  // empty array
    touch = 0;
    while(Num<1000){
// ECE445L students experiment with the following two options
      GPIOB->DOUT31_0 ^= GREEN;    // toggles PB27 when running in main
 //     GPIOB->DOUTTGL31_0 = GREEN;    // toggles PB27 when running in main
      touch |= LaunchPad_InS2();     // change Averaging?
    }
    CalculateJitter();
    CalculateSNR();
    CreatePMF();
    Distance = IR_Convert(Signal);
#if SSD1306
    SSD1306_SetCursor(6,2);
    SSD1306_OutUDec(Signal);
    SSD1306_SetCursor(6,3);
    SSD1306_OutUDec(Distance);
    SSD1306_SetCursor(6,4);
    SSD1306_OutUDec(Noise); 
    SSD1306_SetCursor(6,5);
    SSD1306_OutUDec(SNR); 
#endif
    if(touch){          // change averaging size on S2 button push
      Clock_Delay1ms(10);          // debounce
      while(LaunchPad_InS2()){
        Clock_Delay1ms(10);
      }
      Averaging = (Averaging+1)%7; // 0 to 6
    } 
  }
}

