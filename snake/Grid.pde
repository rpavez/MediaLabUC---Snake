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
      //println("rows="+rows+" cols="+columns);
      //println("("+currentPoint.getX()+","+currentPoint.getY()+")");
      cells[currentPoint.getX()][currentPoint.getY()].setPoint();
    }
  }
  
  void drawRow()
  {
    for(int j=0;j<columns;j++)
    {
      cells[rows/2][j].setRow();
    }
  }
  
  boolean checkPointsInRow()
  {
    boolean pointsInRow = true;
    for(int i=0;i<rows;i++)
      {
        for(int j=0;j<columns;j++)
        {
          if(cells[i][j].hasPoint() & !cells[i][j].isRow())
          {
            pointsInRow = false;
          }
        }  
      }
    if(pointsInRow) println("points in row!");
    return pointsInRow;
  }
  
  void resetGrid()
  {
    for(int i=0;i<points.size();i++)
    {
      Point currentPoint = (Point) points.get(i);
      cells[currentPoint.getX()][currentPoint.getY()].reset();
    }
  }
}

class Cell
{
  int x,y;
  boolean hasPoint,isRow;
  Cell(int xInput,int yInput)
  {
    x=xInput;y=yInput;
    hasPoint = false; isRow = false;
  }
  void reDraw()
  {
    noFill();
    if(isRow) {fill(100,100,100);}
    if(hasPoint) {fill(204,102,0);}
    rect(x,y,cellSize,cellSize);
  }
  
  void reset() {hasPoint = false; isRow = false;}
  
  void setRow() {isRow = true;} 
  
  void setPoint() {hasPoint = true;}
  
  boolean hasPoint() {return hasPoint;}
  
  boolean isRow() {return isRow;}
}
