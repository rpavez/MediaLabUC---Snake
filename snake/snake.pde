ArrayList points;
int width,height,cellSize;
Grid grid;
int columns,rows;
int gameMode;
boolean pointsInRow;

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
  gameMode = 0; //Not selected
  pointsInRow = false;
}

void draw()
{
  background(0);
  grid.updatePositions();
  grid.reDraw();
  
  if(gameMode==0)
  {
  // Select Game Mode : Normal / Teams
  gameMode=1;
  }
  else if(gameMode==1) runNormalGame();
}
void runNormalGame()
{
  if(!pointsInRow)
  {
    grid.drawRow();
    if(grid.checkPointsInRow()) pointsInRow = true;
  }
  grid.resetGrid();
}
