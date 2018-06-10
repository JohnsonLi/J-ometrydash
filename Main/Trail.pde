public class Trail extends Particle {
  private int color1;
  private ArrayList<int[]> points;
  private int distance;

  public Trail(Player p, int color1, int distance) {
    super(p);
    this.color1 = color1;
    points = new ArrayList<int[]>();
    this.distance = distance;
  }
  
  public Trail(int x, int y, int color1, int distance) {
    super(x,y);
    this.color1 = color1;
    points = new ArrayList<int[]>();
    this.distance = distance;
  }

  public void update() {
    points.add(new int[] {player.getX() - 2 * UNIT/3, player.getY()});
    int[] a = points.get(0);
    if (dist(a[0], a[1], player.getX(), player.getY()) > distance) {
      points.remove(0);
    }
  }

  public void draw() {
    for (int[] point : points) {
      pushMatrix();
      fill(color1, (float)(255. / Math.pow(dist(point[0], point[1], player.getX(), player.getY()), 2) * 2 * distance)); //For cool effect (more opaque near the ship)
      rect(point[0], point[1], 8, 8);
      popMatrix();
    }
  }
}
