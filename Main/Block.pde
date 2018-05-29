public class Block{

  int blockWidth, blockHeight;
  int x,y;
  
  public Block(int blockWidth, int blockHeight, int x, int y){
    this.blockWidth = blockWidth;
    this.blockHeight = blockHeight;
    this.x = x;
    this.y = y;
  }
  
  public void draw(){
    fill(#FFFACD);
    rect(x,y,blockWidth, blockHeight);
  }


}