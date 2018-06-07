public class RunningParticle extends Particle {

  private Vector velocity;


  public RunningParticle(Player p, Vector v) {
    super(p);
    velocity = v;
    y = p.getY() + UNIT/3;
  }

  public void draw() {
    fill(255, 0, 0);
    rect(x, y, 3, 3);
  }

  public void update() {
    x += velocity.getX();
    y += velocity.getY();
    velocity.add(new Vector(0, .5));
  }
}
