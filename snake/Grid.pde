class Grid {

  // Cells of the grid are stored in a two-dimentional array.
  Cell[][] cells = new Cell[rows][columns];
  ArrayList fruits;
  boolean finishedCurrentFruit;
  Point headPoint;

  // In constructor we create empty cells
  Grid()
  {
    for (int i=0;i<rows;i++)
    {
      for (int j=0;j<columns;j++)
      {
        cells[i][j] = new Cell(cellSize*i, cellSize*j);
      }
    }
    fruits = new ArrayList();
    finishedCurrentFruit = true;
  }

  void addFruit()
  {
    if (finishedCurrentFruit) 
    {
      println("New fruit!");
      fruits.add(cells[0][0]);
    }
    finishedCurrentFruit = false;
  }

  // We call reDraw() of every Cell
  void reDraw()
  {
    for (int i=0;i<rows;i++)
    {
      for (int j=0;j<columns;j++)
      {
        cells[i][j].reDraw();
      }
    }
  }

  void updateFruits()
  {
    for (int i=0;i<fruits.size();i++)
    {
      Cell currentCell = (Cell) fruits.get(i);
      currentCell.setFruit();
    }
  }

  // We check positions of Points tell cells in points positions to show the point.
  void updatePositions()
  {
    for (int i=0;i<points.size();i++)
    {
      Point currentPoint = (Point) points.get(i);
      cells[currentPoint.getX()][currentPoint.getY()].setPoint();
    }
  }

  // We draw a line in the middle on the screen
  //*******************changed this method to allow choosing location*****************************
  void drawRow(int numOfRow)
  {
    for(int j=0;j<columns;j++)
    {
      cells[numOfRow][j].setRow();
    }
  }
  //**************************************************************************

  // We check what cells have points and return true if all points are in cells that are also part of the central line (row).
  //*******************changed this so we could specify which column to check!
  boolean checkPointsInRow(int numOfRow)
  {
    boolean pointsInRow = false;
    int numOfPoints=0;
   // println(numOfPoints);

    for (int i=0;i<columns;i++)
    {
      if (cells[numOfRow][i].hasPoint())
      {
        numOfPoints++;
        //println(numOfPoints);
      }
      if ( numOfPoints>1) {
        pointsInRow=true;
      }
    }
    if (pointsInRow) println("points in row!");
    return pointsInRow;
  }
  //*******************************************************************************************************
  
  // We reset state of all cells in the grid.
  void resetGrid()
  {
    for (int i=0;i<points.size();i++)
    {
      Point currentPoint = (Point) points.get(i);
      cells[currentPoint.getX()][currentPoint.getY()].reset();
    }
  }
  
  void CheckPeople(){
    
  }
  
  //end of class
}


