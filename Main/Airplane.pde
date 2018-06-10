public class Airplane extends PlayerMode {
  float theta;
  final float GRAVITY = UNIT/600.;
  PImage planeImg = loadImage("images/airplane.png");
  Particle particle;

  public Airplane(Player p) {
    super(p);
    this.particle = new Trail(p, #FFFF00, 100);
  }
  public void update() {
    super.update();

    //If spacebar is held, goes up
    if (keyPressed == true && key == ' ') {
      p.addVelocity(new Vector(0, -GRAVITY));
    } else {
      p.addVelocity(new Vector(0, GRAVITY));
    }
  }


  public void draw() {

    pushMatrix();
    translate(p.getX(), p.getY()); //Since rotate rotates around origin, need to use translate
    noStroke();
    rotate(atan(p.getVelocity().getY()/p.getVelocity().getX()) / 2);
    imageMode(CORNER);
    image(img, -UNIT/2, -2* UNIT/3, 2*UNIT/3, 2*UNIT/3);   
    image(planeImg, -UNIT, -UNIT/2, UNIT * 2, UNIT);
    //image(img, -UNIT/2, -2* UNIT/3, 2*UNIT/3, 2*UNIT/3);   
    popMatrix();
  }

  public void draw(boolean b) {
    if (b) {
      draw();
    } else {
      pushMatrix();
      translate(p.getX(), p.getY());
      player.endGameRotation = player.endGameRotation * 1.01 + PI/100;
      rotate(player.endGameRotation);

      imageMode(CORNER);
      image(img, -UNIT/2, -2* UNIT/3, 2*UNIT/3, 2*UNIT/3);   
      image(planeImg, -UNIT, -UNIT/2, UNIT * 2, UNIT);
      popMatrix();
    }
  }

  public void updateParticles() {
    particle.update();
    particle.draw();
  }
  public ArrayList<Block> blocksToCheck() {
    int x = p.getX();
    int y = p.getY();
    ArrayList<Block> blocksToCheck = new ArrayList<Block>();
    blocksToCheck.add(map.blockAt(x + UNIT + 1, y + UNIT / 2 - 1)); //bottom right of plane
    blocksToCheck.add(map.blockAt(x + UNIT + 1, y - UNIT / 3)); //top right of plane
    blocksToCheck.add(map.blockAt(x + UNIT/6, y - 2*UNIT/3)); //top right of player
    return blocksToCheck;
  }

  public void reset() {
  }
}
