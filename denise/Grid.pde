class Grid {
  //var

  //constructor
  Grid() {}

  //methods
  void display() {
    stroke(50);
    strokeWeight(1);
    //horizontal lines
    for (int i=0;i<height;i=i+10) {
      line(0, i, width, i);
    }
    //vertical lines
    for (int i=0;i<width;i=i+10) {
      line(i, 0, i, height);
    }
  }
}

