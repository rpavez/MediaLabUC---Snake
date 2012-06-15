//Main Global Variables
ArrayList points;
int width, height, cellSize;
Grid grid;
int columns, rows;
int gameMode;
boolean pointsInRow;
int column1, column2;//********added these

// Setup of the Application
void setup()
{
  width = 640;
  height = 480;
  cellSize = 20;
  rows = width/cellSize;
  columns = height/cellSize;
  column1=rows/4;//********added these
  column2=rows/4*3-1;//********added these

  size(width, height);
  grid = new Grid();
  points = new ArrayList();
  points.add(new Point(0, 0));
  points.add(new Point(0, 0));
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

  if (gameMode==0) //GameMode 0 means we first need to select if we want to start a one or two teams game.
  {
    selectGameMode();
  } //selectGame will render interface to select game
  else {
    runGame();
  } //runNormalGame() control basic game (No Teams)
}


void selectGameMode()
{
  if (!pointsInRow)
  {
    grid.drawRow(column1);
    grid.drawRow(column2);
    //checks if there are two players    
    if (grid.checkPointsInRow(column1) && grid.checkPointsInRow(column2)) {
      pointsInRow = true;
      gameMode=2;
      println("two groups game mode!");
    }
    else if (grid.checkPointsInRow(column1) || grid.checkPointsInRow(column2)) {
      pointsInRow = true;
      gameMode=1;
      println("one group game mode!");
    }
    else {
      gameMode=0;
      println("choose game mode!");
    }
    grid.resetGrid();
  }
}


  void runGame()
  {
    // Game can start!
    if (gameMode==1){/*do something*/}
    else if (gameMode==2){/*do something else*/}
    grid.addFruit();
    grid.resetGrid(); // Need to be called to refresh cell states in the grid
  }

