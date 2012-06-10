class Dots {
  //var//////////////////////////////////////////////////////
  int xpos;
  int ypos;
  //constructor////////////////////////////////////////
  Dots() {//gives a dot a random location
    xpos=int(random(width));
    ypos=int(random(height));
  }
  //methods///////////////////////////////////////////////
  void display() {  //draws the dot
    strokeWeight(3);
    stroke(255, 0, 0);
    smooth();
    point(xpos, ypos);
  }
  void bx() {//fills the square the dot is on
    int bxpos= xpos/10- (xpos%10)/10 ;
    int bypos=ypos/10- (ypos%10)/10;
    noStroke();
    fill(255, 255, 0, 150);
    rect(bxpos*10, bypos*10, 10, 10);
  }
  void mov() {//moves the dot to random location nearby AKA makes the dots dance :)
    int range=6;
    xpos+=int(random(-range, range));
    ypos+=int(random(-range, range));
  }
  //end of class///////////////////////////////////////////
}

