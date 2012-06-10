class Grid {
  
  // Cells of the grid are stored in a two-dimentional array.
  Cell[][] cells = new Cell[rows][columns];
  ArrayList fruits;
  boolean finishedCurrentFruit;
  Point headPoint;
  
  // In constructor we create empty cells
  Grid()
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<columns;j++)
      {
        cells[i][j] = new Cell(cellSize*i,cellSize*j);
      }
    }
    fruits = new ArrayList();
    finishedCurrentFruit = true;
  }
  
  void addFruit()
  {
    if(finishedCurrentFruit) 
    {
      println("New fruit!");
      fruits.add(cells[0][0]);
    }
    finishedCurrentFruit = false;
  }
  
  // We call reDraw() of every Cell
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
  
  void updateFruits()
  {
    for(int i=0;i<fruits.size();i++)
    {
      Cell currentCell = (Cell) fruits.get(i);
      currentCell.setFruit();
    }
  }
  
  // We check positions of Points tell cells in points positions to show the point.
  void updatePositions()
  {
    for(int i=0;i<points.size();i++)
    {
      Point currentPoint = (Point) points.get(i);
      cells[currentPoint.getX()][currentPoint.getY()].setPoint();
    }
  }
  
  // We draw a line in the middle on the screen
  void drawRow()
  {
    for(int j=0;j<columns;j++)
    {
      cells[rows/2][j].setRow();
    }
  }
  
  // We check what cells have points and return true if all points are in cells that are also part of the central line (row).
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
  
  // We reset state of all cells in the grid.
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
  boolean hasPoint,isRow,hasFruit;
  Cell(int xInput,int yInput)
  {
    x=xInput;y=yInput;
    hasPoint = false; isRow = false; hasFruit = false;
  }
  void reDraw()
  {
    noFill();
    if(isRow) {fill(100,100,100);}
    if(hasPoint) {fill(204,102,0);}
    if(hasFruit) {fill(218,56,56);}
    rect(x,y,cellSize,cellSize);
  }
  
  void reset() {hasPoint = false; isRow = false; hasFruit = false;}
  
  void setRow() {isRow = true;} 
  
  void setPoint() {hasPoint = true;}
  
  boolean hasPoint() {return hasPoint;}
  
  boolean isRow() {return isRow;}
  
  void setFruit() {hasFruit = true;}
}
