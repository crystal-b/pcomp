class circle{
  float lifeTime;
   
  // variables 
  float xpos;
  float ypos;
  float xspd;
  float yspd;
  float grav;
  color col;
  // constructor
  circle(){
    xpos = xPos;
    ypos = yPos;
    //xspd = mouseX - pmouseX + random(-4, 4);
    //yspd = mouseY - pmouseY;
    grav= 0.89;
    col = color(random(250), random(250), random(250));
    lifeTime = 250 + random(-50, 50);
  }
   
  // functions (methods)
  void move(){
    xpos = xpos + grav;
    ypos = ypos + grav+10;
    //yspd = yspd + grav;
    lifeTime = lifeTime - 4;
     
  }
   
  void display(){
    fill(red(col), green(col), blue(col), lifeTime);
    ellipse(xpos, ypos, 10, 50);
  }
 
 void display2(){
    fill(red(col), green(col), blue(col), lifeTime);
    ellipse(xpos+6, ypos, 10, 50);
  }
 
  void display3(){
    fill(red(col), green(col), blue(col), lifeTime);
    ellipse(xpos+12, ypos, 10, 50);
  }
 
  void display4(){
    fill(red(col), green(col), blue(col), lifeTime);
    ellipse(xpos+18, ypos, 10, 50);
  }
  void display5(){
    fill(red(col), green(col), blue(col), lifeTime);
    ellipse(xpos+24, ypos, 10, 50);
  }
   void display6(){
    fill(red(col), green(col), blue(col), lifeTime);
    ellipse(xpos+30, ypos, 10, 50);
  }
 void bounce(){
    if(ypos > height){
      yspd = -.65*abs(yspd);
    }
  }
}
