/**Abstract class to hold all the "modes": Running, Flying(Airplane), and UFO*/
public abstract class PlayerMode {
  int x, y;
  Player p;
  public PlayerMode(Player p) {
    x = p.getX();
    y = p.getY();
    this.p = p;
  }

  public abstract void update();
  public abstract void keyPressed(int key);
  public abstract void draw();
  public abstract boolean isColliding();
  public abstract void reset();
}
