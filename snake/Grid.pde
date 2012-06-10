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