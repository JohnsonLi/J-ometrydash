public class Running extends PlayerMode{
  float theta;
  final  float GRAVITY = .3;
  
  public Running(Player p) {
    super(p);
    theta = 0;
  }
  
  public void update() {
    if (p.isOnGround() && p.getVelocity().getY() > 0) {
      p.getVelocity().setY(0);
      if(map.blockAt(p.getX() + UNIT / 2 , p.getY() + UNIT / 2) != null){
        p.setY(map.blockAt(p.getX() + UNIT / 2 , p.getY() + UNIT / 2).getY() - UNIT / 2);
      }      
    }
    p.addVelocity(new Vector(0,GRAVITY));
  }
  
  public void draw() {
    pushMatrix();
    if (!p.isOnGround()) {
      theta += PI/40;
    } else {
      theta = 0;
    }
    translate(p.getX(),p.getY()); //Since rotate rotates around origin, need to use translate
    rotate(theta);
    noStroke();
    fill(#facdff);
    rect(-UNIT/2,-UNIT/2,UNIT,UNIT);
  
    popMatrix();
  }
  
  public boolean isColliding(){
    int x = p.getX();
    int y = p.getY();
    int size = UNIT;
    
    if(map.blockAt(x + size / 2, y - size / 2 + 1) != null){
      return true;
    }
    if(map.blockAt(x + size / 2, y + size / 2 - 1) != null){
      return true;
    }
    return false;
  }
  
  public void keyPressed(int key) {
    if (key == ' ' && p.isOnGround()) {
      p.addVelocity(new Vector(0,-5));
    }
  }
  
}