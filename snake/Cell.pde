class Cell
{
  int x, y;
  boolean hasPoint, isRow, hasFruit;
  Cell(int xInput, int yInput)
  {
    x=xInput;
    y=yInput;
    hasPoint = false; 
    isRow = false; 
    hasFruit = false;
  }
  void reDraw()
  {
    noFill();
    if (isRow) {
      fill(100, 100, 100);
    }
    if (hasPoint) {
      fill(204, 102, 0);
    }
    if (hasFruit) {
      fill(218, 56, 56);
    }
    rect(x, y, cellSize, cellSize);
  }

  void reset() {
    hasPoint = false; 
    isRow = false; 
    hasFruit = false;
  }

  void setRow() {
    isRow = true;
  } 

  void setPoint() {
    hasPoint = true;
  }

  boolean hasPoint() {
    return hasPoint;
  }

  boolean isRow() {
    return isRow;
  }

  void setFruit() {
    hasFruit = true;
  }
}

