class circle{
  float lifeTime;
   
  // variables 
  float xpos;
  float ypos;
  float xspd;
  float yspd;
  float grav;
  color col;
  float spacing = 20;
  
  // constructor
  circle(){
    xpos = mouseX - 60;
    ypos = mouseY + 30;
    //xspd = mouseX - pmouseX + random(-4, 4);
    //yspd = mouseY - pmouseY;
    grav= .89;
    col = color(random(250), random(250), random(250));
    lifeTime = 250 + random(-50, 50);
  }
   
  // functions (methods)
  void move(){
    xpos = xpos + grav;
    //CRYSTAL CHANGING SPEED OF FALLING RAIN
    //BUT NOT SPEED OF RAIN COMING OUT OF CLOUD, WHICH CREATES A TRAFFIC JAM
    ypos = ypos + grav+2;
    //yspd = yspd + grav;
    lifeTime = lifeTime - 4;
     
  }
   
  void display(){
    fill(red(col), green(col), blue(col), lifeTime);
    ellipse(xpos, ypos, 10, 15);
  }
 
 void display2(){
    fill(red(col), green(col), blue(col), lifeTime);
    ellipse(xpos+spacing, ypos, 10, 15);
  }
 
  void display3(){
    fill(red(col), green(col), blue(col), lifeTime);
    ellipse(xpos+spacing*2, ypos, 10, 15);
  }
 
  void display4(){
    fill(red(col), green(col), blue(col), lifeTime);
    ellipse(xpos+spacing*3, ypos, 10, 15);
  }
  void display5(){
    fill(red(col), green(col), blue(col), lifeTime);
    ellipse(xpos+spacing*4, ypos, 10, 15);
  }
   void display6(){
    fill(red(col), green(col), blue(col), lifeTime);
    ellipse(xpos+spacing*5, ypos, 10, 15);
  }
 void bounce(){
    if(ypos > height){
      yspd = -.65*abs(yspd);
    }
  }
}
