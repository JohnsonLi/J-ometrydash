public abstract class PlayerMode {
  int x,y;
  Player p;
  public PlayerMode(Player p) {
    x = p.getX();
    y = p.getY();
    this.p = p;
  }
  
  public abstract void update();
  public abstract void keyPressed(int key);


}
