public class Portal extends Block {

  PImage img = loadImage("images/planeportal.png");
  public Portal(int x, int y, int bwidth, int bheight, int bcolor) {
    super(x, y, bwidth, bheight, bcolor);
    harmful = false;
    isSolid = false;
  }

  public void draw() {
    pushMatrix();
    noStroke();
    image(img,x,y,blockWidth,blockHeight);
    popMatrix();
  }
  
  public void portalAction() {
    if (!(player.getMode() instanceof Airplane)) {
      player.setMode(new Airplane(player));
    } 
  }
}
