#include <CapSense.h>

int counter = 6000;
const int RED = 9;    //Red LED Pin
const int GREEN = 10; //Green LED Pin
const int BLUE = 11;  //Blue LED Pin

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
    
    //smoothValue = ((smoothValue * 4) + total1) / 5;
    
   // Serial.print(millis() - start);        // check on performance in milliseconds
    //Serial.print("\t");                    // tab character for debug windown spacing
   // Serial.print(smoothValue);                  // print sensor output 1
    Serial.print(total1); 
    Serial.println("\t");
    int sensorValue = analogRead(0);
    
    if (total1 > threshold) {
      
     startTimer(); 
    }
  

}

void startTimer() {
    
  ledValue = 255;
  
  
    analogWrite(RED, ledValue);
    analogWrite(GREEN, ledValue);
    analogWrite(BLUE, ledValue);
   
    delay(60000);                             // arbitrary delay to limit data to serial port  
  
  
  ledValue = 0;
  
    analogWrite(RED, ledValue);
    analogWrite(GREEN, ledValue);
    analogWrite(BLUE, ledValue);
   
    delay(10);   
  
  
}
