/*
SOURCES
mod of strobe method from www.openprocessing.org/sketch/45098
Location 1) park & 64th
http://www.centralchurchnyc.org/?q=ourhistory
http://www.nycago.org/Organs/NYC/img/CentralPresMadAv1928Ext.jpg
*/
//LIBRARIES
import ddf.minim.*;
import processing.serial.*;

//SERIAL COMMUNICATION
boolean firstContact = false;
Serial myPort;
float stringPlucked1;
float stringPlucked2;
float stringPlucked3;
float stringPlucked4;
float ballW = 10;
float ballH = 10;
float ballX = 10;
float ballY = 10;

//OBJECTS
Minim minim;
AudioPlayer main, loc1, loc2, loc3, loc4, loc5;
Button buttonLoc1;
Button buttonLoc2;
Button buttonLoc3;
Button buttonLoc4;
//Button buttonLoc5;

//GLOBAL VARIABLES
PImage img;
PImage photo;
float p = PI;
float pulsing = 0;
float pulseCenter = 125;
float pulseC = 50;
float diameter = 25;
int loc1X = 622;
int loc1Y = 655;
int loc2X = 622;
int loc2Y = 200;
int loc3X = 275;
int loc3Y = 400;
int loc4X = 215;
int loc4Y = 110;
color c = 255;
int lightLimit1 = 0;
int lightLimit2 = 0;
int lightLimit3 = 0;
int lightLimit4 = 0;

void setup() {
  //SERIAL COMMUNICATION
  String portName = "/dev/tty.usbmodem1421";
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  
  size(1117, 681);
  smooth();
  //load map image
  img = loadImage("map.png");
  background(img);
  //load audio files
  minim = new Minim(this);
  //main = minim.loadFile("sheMoves.mp3");
  //main.setGain(-15.0);
  loc1 = minim.loadFile("harbor.mp3");
  loc2 = minim.loadFile("metro.mp3");
  loc3 = minim.loadFile("bells.mp3");
  loc4 = minim.loadFile("panama.mp3");
  //play background music
  //main.play();
  //main.loop();
  
  //park & 64th
  buttonLoc1 = new Button(loc1X, loc1Y, diameter, diameter);
  buttonLoc2 = new Button(loc2X, loc2Y, diameter, diameter);
  buttonLoc3 = new Button(loc3X, loc3Y, diameter, diameter);
  buttonLoc4 = new Button(loc4X, loc4Y, diameter, diameter);

}

void draw() {
  buttonLoc1.display();
  buttonLoc1.pulse();
  buttonLoc2.display();
  buttonLoc2.pulse();
  buttonLoc3.display();
  buttonLoc3.pulse();
  buttonLoc4.display();
  buttonLoc4.pulse();
  playString();
  ellipse(ballX, ballY, ballW, ballH);
}

class Button {
  float buttonX;
  float buttonY;
  float buttonWidth;
  float buttonHeight;
  
  Button(float tempButtonX, float tempButtonY, float tempButtonWidth, float tempButtonHeight) {
    buttonX = tempButtonX;
    buttonY = tempButtonY;
    buttonWidth = tempButtonWidth;
    buttonHeight = tempButtonHeight;
  }


  void display() {
    smooth();
    noStroke();
    //fill(c);
    ellipse(buttonX, buttonY, buttonWidth, buttonHeight);
  }
  
  void pulse() {
    pulsing = pulseCenter + pulseC*sin(p);
    p = p + .01;
    c = color(0, pulsing, 0);
    fill(c);
  }
}

void playString() {
  if (stringPlucked1 > 850) {
    loc1.rewind();
    loc1.play();
  }
  else if (stringPlucked2 > 150) {
    loc2.rewind();
    loc2.play();
  }
  else if (stringPlucked3 > 700) {
    loc3.rewind();
    loc3.play();
  }
  else if (stringPlucked4 > 300) {
    loc4.rewind();
    loc4.play();
    //loc4.setGain(12.0);
  }
}

//reload location audio files after mousePressed
// void mouseReleased() {
//     loc1 = minim.loadFile("clothes.mp3");
//     loc2 = minim.loadFile("metro.mp3");
//     loc3 = minim.loadFile("cableCar.mp3");
//     loc4 = minim.loadFile("panama.mp3");
//     loc5 = minim.loadFile("harbor.mp3");
//     loc6 = minim.loadFile("bells.mp3");
    
//   }

void stop() {
  //main.close();
  loc1.close();
  loc2.close();
  loc3.close();
  loc4.close();
  //loc5.close();
  //spring.close();
  minim.stop();
  super.stop();
}

//SERIAL COMMUNICATION
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
          stringPlucked1 = sensors[0];
          stringPlucked2 = sensors[1];
          stringPlucked3 = sensors[2];
          stringPlucked4 = sensors[3];
          ballW = sensors[0];
          ballH = sensors[1];
          ballX = sensors[2];
          ballY = sensors[3];
        }
    }
    myPort.write("A");
  }
}
