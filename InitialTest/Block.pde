public class Block {
  private int x,y,blockWidth,blockHeight;
  
  public Block(int x,int y, int blockWidth,int blockHeight) {
    this.x = x;
    this.y = y;
    this.blockWidth = blockWidth;
    this.blockHeight = blockHeight;
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
  
  public void draw(int xoffset) {
    fill(0,0,0);
    rect(x-xoffset,y,blockWidth,blockHeight);
    fill(255,0,0);
    rect(x-xoffset + 10,y + 10,blockWidth-20,blockHeight-20);
  }

}
