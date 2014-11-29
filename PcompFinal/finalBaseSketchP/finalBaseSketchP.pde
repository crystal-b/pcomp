import processing.serial.*;

boolean firstContact = false;
Serial myPort;

float ballW;
float ballH;

void setup() {
  size(800, 600);
  
  String portName = "/dev/tty.usbmodem1421";
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
}

void draw() {
  ellipse(width/2, height/2, ballW, ballH);
}

void serialEvent(Serial myPort) {
  String myString = myPort.readStringUntil('\n');
  if (myString != null) {
    myString = trim(myString);
    if (firstContact == false) {
      if (myString.equals("hello")) {
        myPort.clear();
        firstContact = true;
        myPort.write("A");
      }
    }
    else {
      int sensors[] = int(split(myString, ','));
        for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) { 
          print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t"); 
        }
        println();
        if (sensors.length > 1) {
          ballW = sensors[0];
          ballH = sensors[1];
        }
    }
    myPort.write("A");
  }
}

      
      
      
      
      
      
      
