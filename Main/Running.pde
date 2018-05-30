public class Running extends PlayerMode{

  public Running(Player p) {
    super(p);
  }
  
  public void update() {
    
  }
  
  public void keyPressed(int key) {
    if (key == ' ') {
      p.addVelocity(new Vector(0,.2));
    }
  }
  
}
