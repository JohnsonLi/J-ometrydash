/**Abstract class to hold all the "modes": Running, Flying(Airplane), and UFO*/
public abstract class PlayerMode {
  int x, y;
  PImage img = loadImage("images/jackolantern.png");
  Player p;
  public PlayerMode(Player p) {
    x = p.getX();
    y = p.getY();
    this.p = p;
  }

  public void update() {
    //Lose Y velocity once on the ground
    if (p.isOnGround() && p.getVelocity().getY() > 0) {
      p.getVelocity().setY(0);
    }
    p.setX(int(p.getX() + p.getVelocity().getX()));
    p.setY(int(p.getY() + p.getVelocity().getY()));
    //Sets the player Y to the top of the block it is under (if it is ontop of a block)
    Block block = map.blockAt(p.getX() + UNIT / 2, p.getY() + UNIT / 2) ;
    if (block != null) {
      if (!block.isSolid()) return;
      if (block.isHarmful()) {
        p.die();
        return;
      }
      p.setY(map.blockAt(p.getX() + UNIT / 2, p.getY() + UNIT / 2).getY() - UNIT / 2);
    }
  }

  public boolean isColliding() {
    for (Block b : blocksToCheck()) {
      if (b != null) {
        if (b.isSolid()) return true;
        b.portalAction();
        return false;
      }
    }
    return false;
  }
  public abstract ArrayList<Block> blocksToCheck();
  public abstract void draw();

  public abstract void reset();
}
