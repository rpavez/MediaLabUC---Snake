// For Simulation purposes
class Point {
  int xPos,yPos;
  
  Point (int x, int y) {  
    yPos = y;
    xPos = x;
  }

  int getX(){return xPos;}
  int getY(){return yPos;}

  void changeDir(char dir)
  {
    switch(dir) {
      case 'U': 
        if(yPos>0) yPos--;
        break;
      case 'R': 
        if(xPos<rows-1) xPos++;
        break;
      case 'D': 
        if(yPos<columns-1) yPos++;
        break;
      case 'L': 
        if(xPos>0) xPos--;
        break;
    }
  }
}

void keyPressed() {
  Point currentPoint;
  
  currentPoint = (Point) points.get(0);
  if(keyCode == UP) {currentPoint.changeDir('U');}
  if(keyCode == RIGHT) {currentPoint.changeDir('R');}
  if(keyCode == DOWN) {currentPoint.changeDir('D');}
  if(keyCode == LEFT) {currentPoint.changeDir('L');}

  currentPoint = (Point) points.get(1);
  if(key == 'w') {currentPoint.changeDir('U');}
  if(key == 'd') {currentPoint.changeDir('R');}
  if(key == 's') {currentPoint.changeDir('D');}
  if(key == 'a') {currentPoint.changeDir('L');}

}
