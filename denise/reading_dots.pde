int numDots=20;
Grid grid;
Dots[] dots=new Dots[20];

void setup() {
  frameRate(3);
  size(210, 230);//needs to divide by 10!
  background(0);
  //intialize objects
  grid=new Grid();
  for (int i=0;i<dots.length;i++) {
    dots[i]=new Dots();
  }
}

void draw() {
  background(0);
  for (int i=0;i<dots.length;i++) {
    dots[i].mov();
    dots[i].bx();
    dots[i].display();
  }
  grid.display();
}

