import processing.serial.*; // import the Processing serial library
Serial myPort;              // The serial port
float xPos;
float yPos;
float thunderThreshold=150;
float thunderStrike;
float cloudColor;
ArrayList <circle> circles;

//shiffmanRain
Drop[] drops;       // An array of drop objects
int totalDrops = 0; // totalDrops

//import ddf.minim.*;

void setup(){ 
  circles = new ArrayList();
  //shiffmanRain
  drops = new Drop[1000];    // Create 1000 spots in the array
  
  for(int i = 0; i < 100; i = i + 1){
     circles.add(new circle() );
  
  size(800, 600);
  //String portName = "/dev/tty.usbmodem1411";
  //myPort = new Serial(this, portName, 9600);
  //myPort.bufferUntil('\n');
  }

}


void draw() {  
  //colorMode(HSB,360,100,100);
  //CRYSTAL PLAYING AROUND WITH TRAILS
  //http://cs.smith.edu/dftwiki/index.php/Creating_a_trail_of_moving_object_in_Processing
  //create transparent background to fade old drawings
  noStroke();
  fill( 0xee, 0xee, 0xff, 255);
  rect(0, 0, width, height);
  
  background(238,72,95);
  noStroke();
  
  if(thunderStrike>=thunderThreshold) {
    background(60,72,95);
    background(0); 
    background(60,72,95);
  }
  
  createCloud();
  
  //Making rain
  for(int i = 0; i < circles.size(); i = i + 1){
   if(circles.get(i).lifeTime > 0 ){
     circles.get(i).display();
     circles.get(i).display2();
     circles.get(i).display3();
     circles.get(i).display4();
     circles.get(i).display5();
     circles.get(i).display6();
     circles.get(i).move();
     circles.get(i).bounce();
      
   } else{
     circles.remove(i);
     circles.add( new circle() );
   }
  }
  
  /*
  //shiffmanRain
  // Initialize one drop
    drops[totalDrops] = new Drop();
    // Increment totalDrops
    totalDrops ++ ;
    // If we hit the end of the array
    if (totalDrops >= drops.length) {
      totalDrops = 0; // Start over
    }
  // Move and display all drops
  for (int i = 0; i < totalDrops; i++ ) {
    drops[i].move();
    drops[i].display();
    //if (catcher.intersect(drops[i])) {
     // drops[i].caught();
    //}
  }
  */
  
}

void serialEvent(Serial myPort)
{
println("Im in Serial event - Port: "+myPort);
 
  String myString = myPort.readString();
 
  if (myString != null) {

    myString = trim(myString);
  }
  
  String [] numbers = split(myString, ',');
  float sensors[] = float(numbers);
  
  // print out the values you got:
  for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++)
  {
    print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
  }
  // add a linefeed after all the sensor values are printed:
  println();

  if(sensors.length>2)
  {
    thunderStrike = sensors[1];
    xPos = map(sensors[2],0,1023,0,width);
    yPos = map(sensors[3],0,1023,0,height);
    cloudColor = map(sensors[0],0,1023,0,255);
     
    myPort.write('x');
  }
  else
  {
  myPort.write('x');
  }
}


void createCloud()
{
  //CRYSTAL PLAYING WITH CLOUD BREATH
  //http://cs.smith.edu/dftwiki/index.php/Creating_a_trail_of_moving_object_in_Processing
  float radius = 70 + 5 * sin( frameCount * 0.05f );
  

  fill(217,210,201);
  ellipse(mouseX,mouseY,radius,radius);
  fill(217,210,201); 
  ellipse(mouseX+3,mouseY+15,radius,radius);
  ellipse(mouseX-18,mouseY-18,radius,radius);
  fill(/*cloudColor*/169,156,146);
  ellipse(mouseX-28,mouseY+15,radius,radius);
  ellipse(mouseX-25,mouseY+15,radius,radius);
  ellipse(mouseX+30,mouseY+15,radius,radius);
  ellipse(mouseX+10,mouseY-11,radius,radius);
  ellipse(mouseX-55,mouseY+5,radius,radius);
}

//CRYSTAL: PLAYING WITH CLOUD BREATHING
void createCloud2()
{
  fill(217,210,201);
  ellipse(mouseX,mouseY,30,30);
  fill(217,210,201); 
  ellipse(mouseX+3,mouseY+15,30,30);
  ellipse(mouseX-18,mouseY-18,30,30);
  fill(/*cloudColor*/169,156,146);
  
  ellipse(mouseX-28,mouseY+15,30,30);
  ellipse(mouseX-25,mouseY+15,30,30);
  ellipse(mouseX+15,mouseY+15,30,30);
  ellipse(mouseX+10,mouseY-11,30,30);
  ellipse(mouseX-55,mouseY+5,30,30);
}


//
//void createRain()
//{
//   for (int i=0;i<50;i++)
//   {
//       if ( squares.get(i).lifeTime > 0 ) {
//    squares.get(i).display();
//    squares.get(i).move(); 
//  } else {
//    squares.remove(i);
//    squares.add( new square() );
//  }
//   }
//}
