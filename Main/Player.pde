public class Player {
  int x, y;
  Vector velocity;
  PlayerMode current;
  PlayerMode mode = new Running(this);

  /**Constructs a new player*/
  public Player() {
    x = 0;
    y = 275 - UNIT/2;
    velocity = new Vector(2.5, 0);
    current = mode;
  }

  public void draw() {
    current.draw(); //Calls the more specific draw for UFO/Airplane
  }

  /**Updates the game*/
  public void update() {
    //If player is colliding, then restart
    if (current.isColliding()) {
      die();
    }
    current.update();
  }

  /** Resets the coords*/
  public void die() {
    x = 0;
    y = 275 - UNIT / 2;
    xoffset = 0;
    current = mode;
  }

  /** Checks all points on bottom*/
  public boolean isOnGround() {
    if (current.isColliding()) return false;
    for (int i = 0; i < UNIT; i++) {
      if (map.blockAt((x - UNIT/2) + i, y + UNIT/2) != null) {
        if (map.blockAt((x - UNIT/2) + i, y + UNIT/2).isHarmful()) {
          die();
          return false;
        }
        return true;
      }
    }
    return false;
  }


  public void keyPressed(int key) {
    current.keyPressed(key);
  }

  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  public void setX(int x) {
    this.x = x;
  }
  public void setY(int y) {
    this.y = y;
  }
  public void setMode(PlayerMode c) {
    mode = c;
  }
  public void addVelocity(Vector v) {
    velocity.add(v);
  }
  public Vector getVelocity() {
    return velocity;
  }
}
