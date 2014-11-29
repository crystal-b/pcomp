/* Analog in lab
https://itp.nyu.edu/physcomp/labs/labs-arduino-digital-and-analog/analog-in-with-an-arduino/
*/

const int ledPin = 9;
//value read from the piezo sensor
int analogValue = 0;
//pwm pin associated with LED
int brightness = 0;

void setup() {
  Serial.begin(9600);
  pinMmode(ledPin, OUTPUT);
}

void loop() {
  analogValue = analogRead(A0);
  
}

