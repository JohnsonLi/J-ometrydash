public class Player {
  int x,y;
  Vector velocity;
  
  public Player() {
    x = 0;
    y = 275 - 30;
    velocity = new Vector(4, 0);
  }
  
  public void draw(){
    noStroke();
   fill(#EE42F4);
   rect(x, y, 30, 30);
  }
  
  public void update(){
    x += velocity.getX();
    y += velocity.getY();
    
  }
  
  public int getX() {return x;}
  public int getY() {return y;}
  public void addVelocity(Vector v) {velocity.add(v);}
}