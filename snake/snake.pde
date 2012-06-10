
//Main Global Variables
ArrayList points;
int width,height,cellSize;
Grid grid;
int columns,rows;
int gameMode;
boolean pointsInRow;

// Setup of the Application
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

// Main Loop of the Application Draw()
void draw()
{
  background(0); //Clear the background
  grid.updatePositions(); //Capture positions of Points and add them to cells in the grid
  grid.updateFruits();
  grid.reDraw(); //Re Draw the entire grid, cell by cell.
  
  if(gameMode==0) //GameMode 0 means we first need to select if we want to start a one or two teams game.
  {
    selectGameMode(); //selectGame will render interface to select game
    gameMode=1; // TEMPORARY: Select Normal Game (No Teams)
  }
  else if(gameMode==1) runNormalGame(); //runNormalGame() control basic game (No Teams)
}

void selectGameMode()
{
  // Select Game Mode : Normal / Teams
}

void runNormalGame()
{
  // Check if Points are in the Row.
  if(!pointsInRow)
  {
    grid.drawRow();
    if(grid.checkPointsInRow()) pointsInRow = true;
  }
  else
  {
  // Game can start!
    grid.addFruit();
  }
  
  grid.resetGrid(); // Need to be called to refresh cell states in the grid
}
