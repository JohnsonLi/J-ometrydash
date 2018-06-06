public class Spike extends Block {

  int orientation; //0 = upright; 1 = tip on the right; 2 = upside down; 3 = tip on the right

  public Spike(int x, int y, int base, int bheight, int bcolor) {
    super(x, y, base, bheight, bcolor);
    this.orientation = orientation;
    harmful = true;
  }

  public void draw() {
    pushMatrix();
    noStroke();
    fill(blockColor);
    rotate(PI/2 * orientation);
    triangle(x, y + blockHeight, x + blockWidth, y + blockHeight, x + blockWidth/2, y);
    popMatrix();
  }

  public void editMap(Block[][] map) {
    float tipX = x + blockWidth/2.;
    float tipY = y;

    for (int i = x; i < tipX; i++) {
      //                  dY       /     dX              *  x           + b
      float currentY = (blockHeight / (blockWidth / 2.)) * (x-i) + y + blockHeight;
      //Goes along the y value and finds all points within
      for (int j = i; j < i + blockWidth * ((currentY - y) / (double) blockHeight); j++) {
        map[(int)currentY][j] = this;
      }
    }
  }
  
  public void editMap1(Block[][] map) {
    float tipX = x + blockWidth/2.;
    float tipY = y;

    for (int i = x; i < tipX; i++) {
      //                  dY       /     dX              *  x           + b
      float currentY = (blockHeight / (blockWidth / 2.)) * (x-i) + y + blockHeight;
      //Goes along the y value and finds all points within
      for (int j = i; j < i + blockWidth * ((currentY - y) / (double) blockHeight); j++) {
        map[(int)currentY][j] = null;
      }
    }
  }
}
