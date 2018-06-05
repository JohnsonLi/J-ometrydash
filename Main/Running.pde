public class Running extends PlayerMode {
  float theta;
  final float GRAVITY = UNIT/230.;

  

  public Running(Player p) {
    super(p);
    theta = 3 * PI / 2;
  }

  public void update() {
    super.update();
    p.addVelocity(new Vector(0, GRAVITY));
  }

  public void draw() {
    pushMatrix();
    if (!p.isOnGround()) {
      theta += PI/80;
    } else {
      int n = (int)((theta + 99*PI/200) / (PI/2)) % 4; 

      theta = n * PI/2; //Rotates to the next "flat" position
    }
    translate(p.getX(), p.getY()); //Since rotate rotates around origin, need to use translate
    rotate(theta);
    noStroke();
    image(img, -UNIT/2, -UNIT/2, UNIT, UNIT);

    popMatrix();
  }

  //Checks the top right, middle right, and bottom right points of the block
  public boolean isColliding() {
    int x = p.getX();
    int y = p.getY();
    int size = UNIT;
    if (map.blockAt(x + size / 2 + 1, y - size / 2 + 1) != null) {
      return true;
    }
    if (map.blockAt(x + size / 2 + 1, y + size / 2 - 1) != null) {
      return true;
    }
    if (map.blockAt(x + size / 2 + 1, y) != null) {
      return true;
    }
    return false;
  }

  public void keyPressed(int key) {
    if (key == ' ' && p.isOnGround()) {
      p.addVelocity(new Vector(0, -4.5));
    }
  }
  
  public void reset() {
    theta = 3 * PI / 2;
  }
}
