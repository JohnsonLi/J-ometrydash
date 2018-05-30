public class Player {
  int x,y;
  Vector velocity;
  
  public Player() {
    x = 0;
    y = 0;
  }
  
  public int getX() {return x;}
  public int getY() {return y;}
  public void addVelocity(Vector v) {velocity.add(v);}
}
