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

