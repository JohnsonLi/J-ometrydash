public class Spike extends Block{

    int orientation; //0 = upright; 1 = tip on the right; 2 = upside down; 3 = tip on the right
    
    public Spike(int x, int y, int base, int bheight, int bcolor, int orientation) {
      super(x,y,base,bheight,bcolor);
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

}
