public class PortalRun extends Block {
  int type = 3;

  PImage img = loadImage("images/runportal.png");
  public PortalRun(int x, int y, int bwidth, int bheight, int bcolor) {
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

  public void portalAction() {
    if (!(player.getMode() instanceof Running)) {
      player.getVelocity().multiplyY(.33);
      player.setMode(new Running(player));
    }
  }

  public int getType() {
    return type;
  }
}
