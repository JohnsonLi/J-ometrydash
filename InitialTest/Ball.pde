public class Ball {
  private float x,y;
  private float size;
  private Vector velocity;
  private boolean pressed;
  private int r,g,b;
  private ArrayList<Particle> particles;
  public Ball(float x, float y,float size) {
    this.x = x;
    this.y = y;
    this.size = size;
    r=100;
    g=100;
    b=255;
    velocity = new Vector(0,0);
    particles = new ArrayList<Particle>();
  }
  
  public void draw(int xoffset) {
    fill(r,g,b);
    stroke(0);
    ellipse(x-xoffset,y,size,size);
    ArrayList<Particle> w = new ArrayList<Particle>();
    for (Particle p : particles) {
      p.draw(xoffset);
      if (p.getY() > height+50) {
        w.add(p);
      }
    }
    for (Particle p : w) {
      particles.remove(p);
    }
  }
  
  
  public boolean isOnGround() {
    return map.blockAt((int)x,(int)(y + size/2)) != null;
  }
  
  
  public void move() {
    if (pressed) return;
    if (isOnGround() && velocity.getY() > 0) {
      y = map.blockAt((int)x,(int)(y + size/2)).getY() - size/2;
      if (Math.abs(velocity.getY()) <= .1) return;
      for (int i = 0; i < velocity.getY()*2; i++) {
        particles.add(new Particle(x,y+size/2,new Vector(random(6)-3,-1.5*random(5))));
      }
      System.out.println(x + " " + y);
      velocity.negateY();
      //velocity.multiplyY(.8f);
      r=(int)random(255);
      g=(int)random(255);
      b=(int)random(255);
    }
    velocity.add(new Vector(0,.1));
    if (velocity.getY() > 10) velocity.setY(10);
    x += velocity.getX();
    y += velocity.getY();
  }
  public void speedUp(Vector v) {
    velocity.add(v);
  }
  public void press() {
    pressed = true;
  }
  public void release() {
    pressed = false;
    velocity = new Vector(0,0);
  }
  
  public void setX(float x) {this.x = x;}
  public void setY(float y) {this.y = y;}



}
