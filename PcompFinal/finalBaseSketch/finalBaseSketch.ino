 void setup() {
   // start serial port at 9600
   Serial.begin(9600);
   //HANDSHAKE METHOD ONLY
   establishContact();
 }
 
 void loop() {
   if (Serial.available() > 0) {
     //read incoming byte
     int inByte = Serial.read();
     //read sensors for input
     int sensorValue = analogRead(A0);
     //print results for spot1
     Serial.print(sensorValue);
     //separate results with a comma
     Serial.print(",");
   
     //read 2nd sensor
     sensorValue = analogRead(A1);
     //print results for spot2
     Serial.print(sensorValue);
     //separate results with a comma
     Serial.print(",");
     
     //read 3rd sensor
     sensorValue = analogRead(A2);
     //print results for spot3
     Serial.print(sensorValue);
     //separate results with a comma
     Serial.print(",");
   
   //read the 4th sensor
   sensorValue = analogRead(A3);
   //print results for spot4
   Serial.println(sensorValue);
   }
 }
 
 
 
 /* Handshaking Method */
void establishContact() {
  while (Serial.available() <= 0) {
    //send a starting method
    Serial.println("hello");
    delay(300);
  }
}
