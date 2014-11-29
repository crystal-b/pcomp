import processing.serial.*;
//HANDSHAKING METHOD ONLY
boolean firstContact = false;
Serial myPort;
int sensors[];
int ballW = sensorValue;

//REMOVE AFTER TESTING
// float xpos, ypos;

void setup() {
  //find available serial ports
  //println(Serial.list());
  String portName = Serial.list() [4];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  
  //REMOVE AFTER TESTING
  size(800, 600);
}

void draw() {
//REMOVE AFTER TESTING
// background(#243780); // blue background
//  // Draw the shape
//  ellipse(xpos, ypos, 20, 20);
//   if (sensors.length > 1) {
//       xpos = sensors[0];
//       ypos = sensors[1];
//       // the pushbutton will send 0 or 1.
//       // This converts them to 0 or 255:
//     }

ellipse(100, 100, sensorValue, sensorValue);
if (sensors.length > 1) {
  sensorValue = sensors[0];
}
}


/* Comma Method */
void serialEvent(Serial myPort) {
  //read serial buffer
  String myString = myPort.readStringUntil('\n');
  if (myString != null) {
    //remove whitespace
    myString = trim(myString);
    if (firstContact == false) {
      if (myString.equals("hello")) {
        myPort.clear();
        firstContact = true;
        myPort.write('A');
      }
    } 
  }
  //proceed if you hear from arduino
  else {
    //split string at commas, convert to int
    int sensors[] = int(split(myString, ','));
    for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
      print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
    }
    //add linefeed after all sensor values print
    println();
    //REMOVE AFTER TESTING
    // if (sensors.length > 1) {
    //     xpos = map(sensors[0], 430,580,0,width);
    //     ypos = map(sensors[1], 430,580,0,height);
    //   }
  }
//   //ask for more once all data has been handled
  myPort.write("A");
}
