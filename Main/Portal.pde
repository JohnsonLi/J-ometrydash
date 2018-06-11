public class Portal extends Block {
  int type = 2;

  PImage img = loadImage("images/planeportal.png");
  public Portal(int x, int y, int bwidth, int bheight, int bcolor) {
    super(x, y, bwidth, bheight, bcolor);
    harmful = false;
    isSolid = false;
  }

  public void draw() {
    pushMatrix();
    noStroke();
    image(img, x, y, blockWidth, blockHeight);
    popMatrix();
  }

  // Does something when player goes through the portal.
  public void portalAction() {
    if (!(player.getMode() instanceof Airplane)) {
      player.getVelocity().multiplyY(.33);
      player.setMode(new Airplane(player));
    }
  }

  public int getType() {
    return type;
  }
}
