public class RunningParticle extends Particle {

  private Vector velocity;
  private int lifetime;
  private int size;

  public RunningParticle(Player p, Vector v) {
    super(p);
    velocity = v;
    y = p.getY() + UNIT/2 - (UNIT/15. * random(5));
    lifetime = 100;
    size = int(random(5)) + 2;
  }

  public void draw() {
    fill(81, 208, 255);
    rect(x, y, size, size);
  }

  public void update() {
    lifetime --;
    x += velocity.getX();
    y += velocity.getY();
  }

  public int getLifetime() {
    return lifetime;
  }
}
