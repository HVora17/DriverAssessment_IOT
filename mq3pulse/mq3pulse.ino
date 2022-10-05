
#include <Wire.h> 
#include <LiquidCrystal_I2C.h>
#define USE_ARDUINO_INTERRUPTS true    
#include <PulseSensorPlayground.h>        

LiquidCrystal_I2C lcd(0x27, 16, 2);
int Alcohol = A1;
int sensorThres = 500;
int motorPin = 10;
const int PulseWire = A0;

PulseSensorPlayground pulseSensor;

void setup()
{
  Serial.begin(9600);
  pinMode(motorPin, OUTPUT);
  pinMode(Alcohol, INPUT);
  pulseSensor.analogInput(PulseWire);
  
  lcd.begin();


  lcd.backlight();
  lcd.clear();

   if (pulseSensor.begin()) {
    Serial.println("We created a pulseSensor Object !");    
  }
}



void loop()
{
int myBPM = pulseSensor.getBeatsPerMinute();
if (pulseSensor.sawStartOfBeat()) {            // Constantly test to see if "a beat happened". 
 Serial.println("  A HeartBeat Happened ! "); // If test is "true", print a message "a heartbeat happened".
 Serial.print("BPM: ");                        // Print phrase "BPM: " 
 Serial.println(myBPM);                        // Print the value inside of myBPM. 
}

 //////////////////////////////mq3 and motor////////////////////////
 int analogSensor = analogRead(Alcohol);
  Serial.println(analogSensor);
  if (analogSensor > sensorThres) 
   
      {
        Serial.println("---WARNING---");
        Serial.println("YOU ARE DRUNK");
        lcd.clear();
        lcd.setCursor(0,0);
        lcd.print("---WARNING---");
        lcd.setCursor(0,1);
        lcd.print("YOU ARE DRUNK");
        digitalWrite(motorPin, LOW);
        delay(5000);
        
        
      }
       
      else
      {
        Serial.println("ALCOHOL DETECTOR");
        Serial.println("YOU'RE NOT DRUNK");
        lcd.clear();
        lcd.setCursor(0,0);
        lcd.print("Drive Safe");
        lcd.setCursor(0,1);
        lcd.print("BPM: ");
        lcd.setCursor(4,1);
        lcd.print(myBPM);
        
        
        
        digitalWrite(motorPin, HIGH);
      }
//////////////////////////Location Send////////////////////
if (myBPM > 200 && analogSensor > sensorThres ) 
   
      {
        Serial.println("Highly drunk, message sent to your emergency contacts. BOOK A CAB!");
        lcd.clear();
        lcd.setCursor(0,0);    
        lcd.print("HIGHLY DRUNK Detected");
        lcd.setCursor(0,1); 
        lcd.print("SMS SENT");
      }
       
      else
      {
        Serial.println("Clear");
        
      }
 delay(2000);
}
