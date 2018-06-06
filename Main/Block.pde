public class Block {

  int blockWidth, blockHeight;
  int x, y;
  int blockColor;
  boolean harmful;

  /** Constructs new block*/
  public Block(int x, int y, int blockWidth, int blockHeight, int blockColor) {
    this.blockWidth = blockWidth;
    this.blockHeight = blockHeight;
    this.blockColor = blockColor;
    this.x = x;
    this.y = y;
  }

  /** Draws a square at x,y coords*/
  public void draw() {
    pushMatrix();
    noStroke();
    fill(blockColor);
    rect(x, y, blockWidth, blockHeight);
    popMatrix();
  }

  //Fills the pixels that make up the block
  public void editMap(Block[][] map) {
    for (int i = y; i < y + blockHeight; i++) {
      for (int j = x; j < x + blockWidth; j++) {
        map[i][j] = this;
      }
    }
  }

  public void editMap1(Block[][] map) {
    for (int i = y; i < y + blockHeight; i++) {
      for (int j = x; j < x + blockWidth; j++) {
        map[i][j] = null;
      }
    }
  }


  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  public int getWidth() {
    return blockWidth;
  }
  public int getHeight() {
    return blockHeight;
  }
  public boolean isHarmful() {
    return harmful;
  }
}
