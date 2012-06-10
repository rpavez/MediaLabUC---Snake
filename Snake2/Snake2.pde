ArrayList points;
int width,height,cellSize;
Grid grid;
int columns,rows;

void setup()
{
  width = 640;
  height = 480;
  cellSize = 20;
  rows = width/cellSize;
  columns = height/cellSize;
  size(width,height);
  grid = new Grid();
  points = new ArrayList();
  points.add(new Point(0,0));
  points.add(new Point(0,0));
}

void draw()
{
  background(0);
  grid.updatePositions();
  grid.reDraw();
}

class Grid {
  Cell[][] cells = new Cell[rows][columns];
  Grid()
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<columns;j++)
      {
        cells[i][j] = new Cell(cellSize*i,cellSize*j);
      }
    }
  }
  
  void reDraw()
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<columns;j++)
      {
        cells[i][j].reDraw();
      }
    }
  }
  
  void updatePositions()
  {
    for(int i=0;i<points.size();i++)
    {
      Point currentPoint = (Point) points.get(i);
      println("rows="+rows+" cols="+columns);
      println("("+currentPoint.getX()+","+currentPoint.getY()+")");
      cells[currentPoint.getX()][currentPoint.getY()].setPoint();
    }
  }
}

class Cell
{
  int x,y;
  boolean filled;
  Cell(int xInput,int yInput)
  {
    x=xInput;y=yInput;
    filled = false;
  }
  void reDraw()
  {
    if(filled) {fill(204,102,0);}else{noFill();}
    rect(x,y,cellSize,cellSize);
    filled = false;
  }
  
  void setPoint()
  {
    filled = true;
  }
}

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

