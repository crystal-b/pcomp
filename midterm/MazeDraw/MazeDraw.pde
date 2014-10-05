//declare object as global variable
Block myMaze;
//declare 2nd object
Block myMaze2;

void setup() {
  size(600, 600);
  smooth();
  //initialize object by calling in a constructor
  //changed original x loc to get full block width
  myMaze = new Block(50,0);
  //initialize 2nd object and change x variable to change location
  myMaze2 = new Block(500,0);
}

void draw() {
  background(255);
  //call the object
  myMaze.drawBlock();
  //call 2nd object
  myMaze2.drawBlock();
}

class Block {
  int blockX = 0;
  int blockY = 0;
  int blockWidth = 100;
  int blockHeight = 90;
  
  //constructor
  Block(int _blockX, int _blockY) {
  blockX = _blockX;
  blockY = _blockY;
  }

  //object function
  void drawBlock() {
    rectMode(CENTER);
    fill(0,0,200);
    noStroke();
    rect(blockX, blockY, blockWidth, blockHeight);
  }
}
