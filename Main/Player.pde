public class Player {
  int x,y;
  Vector velocity;
  PlayerMode current;
  
  public Player() {
    x = UNIT/2;
    y = 275 - UNIT/2;
    velocity = new Vector(4, 0);
    current = new Running(this);
  }
  
  public void draw(){
    current.draw(); //Calls the more specific draw for UFO/Airplane
  }
  
  public void update(){
    current.update();
    
    
    
  }
  
  public void die() {
    x = 0;
    y = 275 - UNIT / 2;
  }
  
  /** Checks all points on bottom*/
  public boolean isOnGround() {
    for (int i = 1; i < UNIT; i++) {
      if (map.blockAt(x - UNIT/2 + i - 1, y + UNIT/2) != null) {
        return true;
      }
    }
    return false;  
  }
  
  
  public void keyPressed(int key) {
    current.keyPressed(key);
  }
  public int getX() {return x;}
  public int getY() {return y;}
  public void setX(int x){this.x = x;}
  public void setY(int y){this.y = y;}
  public void addVelocity(Vector v) {velocity.add(v);}
  public Vector getVelocity() {return velocity;}
}
