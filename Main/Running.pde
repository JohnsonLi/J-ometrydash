public class Running extends PlayerMode {
  float theta;
  final float GRAVITY = UNIT/230.;



  public Running(Player p) {
    super(p);
    theta = 0;
  }

  public void update() {
    
    super.update();
    if (keyPressed && key == ' ' && p.isOnGround()) {
      p.addVelocity(new Vector(0, -1 * UNIT / 6.66));
    }
    p.addVelocity(new Vector(0, GRAVITY));
    //Every 10 milliseconds it adds a new particle
    if (p.isOnGround() && millis() % 10 == 0) {
      p.particles().add(new RunningParticle(p, new Vector(-1 * random(2), -.5 * random(2))));
    }
    ArrayList<Particle> particlesToRemove = new ArrayList<Particle>();
    for (Particle p : p.particles()) {
      if (millis() % 2 == 0) {
        p.update();
      }
      if (((RunningParticle)p).getLifetime() < 0) {
        particlesToRemove.add(p);
      }
      p.draw();
    }
    for (Particle particle : particlesToRemove) {
      p.particles().remove(particle);
    }
    
  }

  public void draw() {
    pushMatrix();
    if (!p.isOnGround()) {
      theta += PI/80;
    } else {
      int n = (int)((theta + 99*PI/200) / (PI/2)) % 4; 

      theta = n * PI/2; //Rotates to the next "flat" position
    }
    translate(p.getX(), p.getY()); //Since rotate rotates around origin, need to use translate
    rotate(theta);
    noStroke();
    imageMode(CORNER);
    image(img, -UNIT/2, -UNIT/2);

    popMatrix();
  }

  public ArrayList<Block> blocksToCheck() {
    int x = p.getX();
    int y = p.getY();
    int size = UNIT;
    ArrayList<Block> blocksToCheck = new ArrayList<Block>(); //Blocks to check

    blocksToCheck.add(map.blockAt(x + size / 2 + 2, y - size / 2 + 2)); //top right
    blocksToCheck.add(map.blockAt(x - size / 4 + 2, y - size / 2 + 2)); //top left
    blocksToCheck.add(map.blockAt(x + size / 2 + 2, y + size / 2 - 2)); //bottom right
    blocksToCheck.add(map.blockAt(x + size / 2 + 1, y)); //right middle
    return blocksToCheck;
  }

  public void reset() {
    theta = 3 * PI / 2;
  }
}
