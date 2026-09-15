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
#include <math.h>
#define SSD1306 1
int32_t Averaging=0; // 0 to 6 to study CLT

void ADC_Init5(void){ // initialize ADCO channel 5
  ADC0->ULLMEM.GPRCM.RSTCTL = 0xB1000003; // 1) reset ADC
  ADC0->ULLMEM.GPRCM.PWREN = 0x26000001;  // 2) activate ADC
  Clock_Delay(24);                        // 3) wait for ADC to settle
  ADC0->ULLMEM.GPRCM.CLKCFG = 0xA9000000; // 4) ULPCLK connect to ADC
  ADC0->ULLMEM.CLKFREQ = 7;               // 5) 40-48 MHz (speed of processor)
  ADC0->ULLMEM.CTL0 = 0x03010000;         // 6) divide by 8 (speed at which ADC is clocked)
  ADC0->ULLMEM.CTL1 = 0x00000000;         // 7) mode (no averaging, software trigger, and one sample)
  ADC0->ULLMEM.CTL2 = 0x00000000;         // 8) MEMRES (put digital result here)
  ADC0->ULLMEM.MEMCTL[0] = 5;             // 9) channel 5 is PB20
  ADC0->ULLMEM.SCOMP0 = 0;                // 10) 8 sample clocks
  ADC0->ULLMEM.CPU_INT.IMASK = 0;         // 11) no interrupt

}
int32_t ADC_In5(void){
  ADC0->ULLMEM.CTL0 |= 0x00000001;             // 1) enable conversions
  ADC0->ULLMEM.CTL1 |= 0x00000100;             // 2) start ADC
  uint32_t volatile delay=ADC0->ULLMEM.STATUS; // 3) time to let ADC start
  while((ADC0->ULLMEM.STATUS&0x01)==0x01){}    // 4) wait for completion
  return ADC0->ULLMEM.MEMRES[0];               // 5) 12-bit result
}
int32_t ADC_InAverage(int samples){
  uint32_t sum = 0;
  for(int j=0; j<samples; j++){
    sum += ADC_In5();
  }
  return sum/samples; // averaging
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
uint32_t ENOB;
uint16_t PMF[100];  // histogram of ADC samples

// Samples ADC at 1000 Hz
void TIMG0_IRQHandler(void){
  if((TIMG0->CPU_INT.IIDX) == 1){ // this will acknowledge
    int32_t ADCvalue;
    GPIOB->DOUTTGL31_0 = BLUE;  // profile PB22
    GPIOB->DOUTTGL31_0 = BLUE;  // profile PB22
    
    if (Num < BUFSIZE) {
        ADCvalue = ADC_In5();                   // 1. Sample the ADC
        DataBuf[Num] = ADCvalue;                // 2. Store the digital sample
        TimeBuf[Num] = TIMG12->COUNTERREGS.CTR; // 3. Record the exact 12.5ns timestamp
        Num++;                                  // 4. Increment the array index
    }

  }
  GPIOB->DOUTTGL31_0 = BLUE;  // profile PB22
}
void CalculateJitter(void){int i;
// MaxT = maximum(Time[i-1] – Time[i]) for i equals 1 to 999
// MinT = minimum(Time[i-1] – Time[i]) for i equals 1 to 999
// Jitter = MaxT – MinT 
  MaxT = 0;
  MinT = 0xFFFFFFFF;

  // Loop from 1 to 999
  uint32_t diff;
  for(int i = 1; i < BUFSIZE; i++){
    diff = TimeBuf[i-1] - TimeBuf[i];
    if(diff > MaxT){ //max time diff
      MaxT = diff;
    }
    if(diff < MinT){ //min time diff
      MinT = diff;
    }
  }
  Jitter = MaxT - MinT;
}

uint32_t sqrt2(uint32_t s){ int n; // loop counter
uint32_t t;            // t*t will become s
  t = s/16+1;          // initial guess
  for(n = 16; n; --n){ // will finish
    t = ((t*t+s)/t)/2;
  }
  return t;
}

uint32_t ilog2(uint32_t n){
  uint32_t result = 0;
  while(n > 1){
    n >>= 1;
    result++;
  }
  return result;
}

void CalculateSNR(void){
  // signal is the average of BUFSIZE ADC samples
  // noise is the standard deviation of the BUFSIZE ADC samples
  // SNR = signal/noisem(no floating point allowed)
  
  // Signal: The average of your 1000 ADC samples.
  int32_t i; 
  int32_t diff;
  int32_t sum = 0;
  int32_t sum_sq = 0;

  for(i = 0; i < BUFSIZE; i++){
    sum += DataBuf[i];
  }
  Signal = sum / BUFSIZE;

  // Noise: The standard deviation of those 1000 samples.  
  for(int i = 0; i < BUFSIZE; i++){
    diff = DataBuf[i] - Signal; // Distance from the mean
    sum_sq += (diff * diff); // Square it and add to running total
  }
  Noise = sqrt2(sum_sq / (BUFSIZE - 1)); // Rest of formula for std dev
  
  // SNR (Signal-to-Noise Ratio): Calculated simply by dividing your Signal by your Noise.  
  SNR = Signal / Noise;
  
  // ENOB (Effective Number of Bits): Calculated using the formula ENOB = log2(SNR).  
  ENOB = ilog2(SNR);
   
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

