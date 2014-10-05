//declare object as global variable
Block myMaze;

void setup() {
  size(600, 600);
  smooth();
  //initialize object by calling in a constructor
  myMaze = new Block(0,0);
}

void draw() {
  background(255);
  //call the object
  myMaze.drawBlock();
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
