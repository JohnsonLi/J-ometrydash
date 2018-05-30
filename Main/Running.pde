public class Running extends PlayerMode{
  float theta;
  public Running(Player p) {
    super(p);
    theta = 0;
  }
  
  public void update() {
    if (p.isOnGround() && p.getVelocity().getY() > 0) {
      p.getVelocity().setY(0);
    }
    p.addVelocity(new Vector(0,.2));
  }
  
  public void draw() {
    if (!p.isOnGround()) {
      theta += PI/50;
    } else {
      theta = 0;
    }
    translate(p.getX(),p.getY()); //Since rotate rotates around origin, need to use translate
    rotate(theta);
    rect(-p.size()/2,-p.size()/2,p.size(),p.size());
  
  
  }
  public void keyPressed(int key) {
    if (key == ' ') {
      p.addVelocity(new Vector(0,-5));
    }
  }
  
}
