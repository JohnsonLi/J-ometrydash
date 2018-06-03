public class Running extends PlayerMode {
  float theta;
  final float GRAVITY = .3;
  PImage img = loadImage("images/jackolantern.png");

  public Running(Player p) {
    super(p);
    theta = 3 * PI / 2;
    
  }

  public void update() {
    //Lose Y velocity once on the ground
    if (p.isOnGround() && p.getVelocity().getY() > 0) {
      p.getVelocity().setY(0);
    }
    p.setX(int(p.getX() + p.getVelocity().getX()));
    p.setY(int(p.getY() + p.getVelocity().getY()));
    //Sets the player Y to the top of the block it is under
    if (map.blockAt(p.getX() + UNIT / 2, p.getY() + UNIT / 2) != null) {
      p.setY(map.blockAt(p.getX() + UNIT / 2, p.getY() + UNIT / 2).getY() - UNIT / 2);
    }
    p.addVelocity(new Vector(0, GRAVITY));
  }

  public void draw() {
    pushMatrix();
    if (!p.isOnGround()) {
      theta += PI/40;
      System.out.println("ASDASDASDASDASDAS");
    } else {
      int n = (int)((theta + 99*PI/200) / (PI/2)) % 4; System.out.println(n);
      theta = n * PI/2; //Rotates to the next "flat" position
    }
    translate(p.getX(), p.getY()); //Since rotate rotates around origin, need to use translate
    rotate(theta);
    noStroke();
    fill(#facdff);
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
      p.addVelocity(new Vector(0, -5));
    }
  }
}
