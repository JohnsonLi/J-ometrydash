public class Block{

  int blockWidth, blockHeight;
  int x,y;
  boolean harmful;
  
  /** Constructs new block*/
  public Block(int x, int y, int blockWidth, int blockHeight){
    this.blockWidth = blockWidth;
    this.blockHeight = blockHeight;
    this.x = x;
    this.y = y;
  }
  
  /** Draws a square at x,y coords*/
  public void draw(){
    pushMatrix();
    noStroke();
    fill(#FFFACD);
    rect(x,y,blockWidth, blockHeight);
    popMatrix();
  }

  public int getX(){return x;}
  public int getY(){return y;}
  public int getWidth(){return blockWidth;}
  public int getHeight(){return blockHeight;}
  public boolean isHarmful() {return harmful;}

}
