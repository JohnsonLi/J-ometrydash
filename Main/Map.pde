public class Map{
    private Block[][] map;
    private ArrayList<Block> blocks = new ArrayList<Block>();
    int bgColor, floorColor, blockColor;
  
    public Map(int bgColor, int floorColor, int blockColor){
      this.bgColor = bgColor;
      this.floorColor = floorColor;
      this.blockColor = blockColor;
      map = new Block[height][width];
    
    }
  
    public void addBlock(Block b){
      blocks.add(b);
      for(int i = b.getY(); i < b.getY() + b.getHeight(); i++){
        for(int j = b.getX(); j < b.getX() + b.getWidth(); j++){
           map[i][j] = b;
        } 
      }
      
    }
  
    public void draw(){
      background(bgColor);
      for(Block b : blocks){
        b.draw();
      }
      
    }
  
  
}