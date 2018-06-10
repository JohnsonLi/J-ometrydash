public class Trail extends Particle {
  private int color1;
  private ArrayList<int[]> points;

  public Trail(Player p, int color1) {
    super(p);
    this.color1 = color1;
    points = new ArrayList<int[]>();
  }

  public void update() {
    points.add(new int[] {p.getX() - 2 * UNIT/3, p.getY()});
    int[] a = points.get(0);
    if (dist(a[0], a[1], p.getX(), p.getY()) > 100) {
      points.remove(0);
    }
  }

  public void draw() {
    for (int[] point : points) {
      pushMatrix();
      fill(color1, (float)(255. / Math.pow(dist(point[0], point[1], p.getX(), p.getY()), 2) * 200)); //For cool effect (more opaque near the ship)
      rect(point[0], point[1], 8, 8);
      popMatrix();
    }
  }
}
