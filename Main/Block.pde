public class Block{

  int blockWidth, blockHeight;
  int x,y;
  
  public Block(int x, int y, int blockWidth, int blockHeight){
    this.blockWidth = blockWidth;
    this.blockHeight = blockHeight;
    this.x = x;
    this.y = y;
  }
  
  public void draw(){
    pushMatrix();
    fill(#FFFACD);
    rect(x,y,blockWidth, blockHeight);
    
    popMatrix();
  }

  public int getX(){return x;}
  public int getY(){return y;}
  public int getWidth(){return blockWidth;}
  public int getHeight(){return blockHeight;}

}