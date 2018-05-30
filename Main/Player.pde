public class Player {
  int x,y,size;
  Vector velocity;
  PlayerMode current;
  
  public Player() {
    size = 30;
    x = size/2;
    y = 275 - size/2;
    velocity = new Vector(4, 0);
    current = new Running(this);
  }
  
  public void draw(){
    current.draw(); //Calls the more specific draw for UFO/Airplane
  }
  
  public void update(){
    current.update();
    x += velocity.getX();
    y += velocity.getY();
  }
  
  /** Checks all points on bottom*/
  public boolean isOnGround() {
    for (int i = 0; i < size; i++) {
      if (map.blockAt(x - size/2 + i, y + size/2) != null) {
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
  public void addVelocity(Vector v) {velocity.add(v);}
  public Vector getVelocity() {return velocity;}
  public int size() {return size;}
}
