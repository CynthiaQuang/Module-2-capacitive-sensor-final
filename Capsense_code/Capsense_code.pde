#include <CapSense.h>

//This code was referenced from: http://www.arduino.cc/playground/Main/CapSense//

int counter = 6000;
int counterStart = 6000; // record how long we counting for
int setColourRgb;
const int redPin = 9;    //Red LED Pin
const int greenPin = 10; //Green LED Pin
const int bluePin = 11;  //Blue LED Pin

int threshold = 35;

long smoothValue = 0;
int ledValue;

CapSense   cs_4_2 = CapSense(4,2);        // 10M resistor between pins 4 & 2, pin 2 is sensor pin, add a wire and or foil if desired

void setup()                    
{

   cs_4_2.set_CS_AutocaL_Millis(0xFFFFFFFF);     // turn off autocalibrate on channel 1
   Serial.begin(57600);

}

void loop()                    
{
    long start = millis();
    long total1 =  cs_4_2.capSense(30);
    Serial.print(total1); 
    Serial.println("\t");
    int sensorValue = analogRead(0);
    
    if (total1 > threshold) {
      
     startTimer(); 
    }
  

}

void startTimer() 
{  
  //while(1) {
    //  unsigned int rgbColour[3];
  
    // Start off with red.
   // rgbColour[RED] = 255;
   // rgbColour[GREEN] = 0;
   // rgbColour[BLUE] = 0;  
  
    // Choose the colours to increment and decrement.
  
   // for (int decColour = 0; decColour < 3; decColour += 1) {
     // int incColour = decColour == 2 ? 0 : decColour + 1;
    
      // cross-fade the two colours.
    //  for(int i = 0; i < 255; i += 1) {
       // rgbColour[decColour] -= 1;
       // rgbColour[incColour] += 1;
        
       // counter--;
       // setColourRgb(rgbColour[RED], rgbColour[GREEN], rgbColour[BLUE]);
       // delay(5);
        //if (counter < 0) return ;
      //}
    //}
 // }
  
//}

//void setColourRgb(unsigned int red, unsigned int green, unsigned int blue) {
//  analogWrite(RED, red);
 // analogWrite(GREEN, green);
 // analogWrite(BLUE, blue);
 //}

 ledValue = 255;
  
  
    analogWrite(RED, ledValue);
    analogWrite(GREEN, 0);
    analogWrite(BLUE, 0);
   
    delay(10000);                          // arbitrary delay to limit data to serial port  
  
  
  ledValue = 0;
  
    analogWrite(RED, ledValue);
    analogWrite(GREEN, 0);
    analogWrite(BLUE, 0);
   
   delay(10);  
 } 
  