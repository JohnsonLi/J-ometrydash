public abstract class Particle {

  Player p;
  float x, y;

  public Particle(Player p) {
    this.p = p;
    x = p.getX() - UNIT/2;
    y = p.getY() - UNIT/2;
  }

  public Particle(int x, int y) {
    this.x = x;
    this.y = y;
  }
  public abstract void draw();
  public abstract void update();

  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
}
