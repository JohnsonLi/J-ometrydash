public class Map{
    private Block[][] map; //For O(0) blockAt()
    private ArrayList<Block> blocks = new ArrayList<Block>(); //For O(n) draw() instead of O(n^2)
    int bgColor, floorColor, blockColor;
  
    /** Constructs the map */
    public Map(int bgColor, int floorColor, int blockColor){
      this.bgColor = bgColor;
      this.floorColor = floorColor;
      this.blockColor = blockColor;
      map = new Block[height][width];
    
    }
  
    /** Returns the block at specific coords */
    public Block blockAt(int x, int y) {
      if (x < 0 || x >= width || y < 0 || y >= height) return null;
      return map[y][x];
    }
    
    /** Adds a new block onto the map*/
    public void addBlock(Block b){
      blocks.add(b);
      //Fills the pixels that make up the block
      for(int i = b.getY(); i < b.getY() + b.getHeight(); i++){
        for(int j = b.getX(); j < b.getX() + b.getWidth(); j++){
           map[i][j] = b;
        } 
      }
      
    }
  
    //Draws every block and the colors
    public void draw(){
      background(bgColor);
      for(Block b : blocks){
        b.draw();
      }
      
    }
  
  
}
