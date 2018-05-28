public class Particle{
  private float x,y;
  private Vector v;
  public Particle(float x,float y, Vector v) {
    this.x = x;
    this.y = y;
    this.v = v;
  }
  
  public void draw(int xoffset) {
    fill(255,0,0);
    rect(x-xoffset,y,3,3);
    x += v.getX();
    y += v.getY();
    v.add(new Vector(0,.2));
  }
  
  public float getY() {
    return y;
  }


}
