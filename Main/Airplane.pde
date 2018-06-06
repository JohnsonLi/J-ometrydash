public class Airplane extends PlayerMode {
  float theta;
  final float GRAVITY = UNIT/600.;
  PImage planeImg = loadImage("images/airplane.png");
  
  public Airplane(Player p) {
    super(p);
  }
  
  public void update() {
    super.update();
    //If spacebar is held, goes up
    if (keyPressed == true && key == ' ') {
      p.addVelocity(new Vector(0, -GRAVITY));
    } else {
      p.addVelocity(new Vector(0, GRAVITY));
    }
  }


  public void draw() {
    pushMatrix();
    translate(p.getX(), p.getY()); //Since rotate rotates around origin, need to use translate
    noStroke();
    rotate(atan(p.getVelocity().getY()/p.getVelocity().getX()) / 2);
    image(planeImg, -UNIT, -UNIT/2, UNIT * 2, UNIT);
    image(img, -UNIT/2, -2* UNIT/3, 2*UNIT/3, 2*UNIT/3);   
    popMatrix();
  }
  public boolean isColliding() {
    int x = p.getX();
    int y = p.getY();
    //Bottom right of airplane
    if (map.blockAt(x + UNIT + 1, y + UNIT / 2 - 1) != null) {
      return true;
    }
    //Top right of airplane
    if (map.blockAt(x + UNIT + 1, y - UNIT / 3) != null) {
      return true;
    }
    //Top right of player box (b/c it sticks out)
    if (map.blockAt(x + UNIT/6, y - 2*UNIT/3) != null) {
      return true;
    }
    return false;
  }





  public void keyPressed(int key) {
  }
  public void reset() {
  }
}
