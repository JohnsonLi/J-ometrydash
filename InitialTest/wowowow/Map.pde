public class Map {
  private Block[][] map;
  private ArrayList<Block> blocks = new ArrayList<Block>();
  private int mapHeight,mapWidth;
  public Map(int rows,int cols) {
    map = new Block[rows][cols];
    mapHeight = rows;
    mapWidth = cols;
  }
  
  public void setBlock(int x, int y, Block b) {
    map[y][x] = b;
    for (int i = 0; i < b.getHeight(); i++) {
      for (int j = 0; j < b.getWidth(); j++) {
        map[y + i][x + j] = b;
      } 
    }
    blocks.add(b);
  }
  
  public Block blockAt(int x, int y) {
    if (y < 0 || y >= mapHeight || x < 0 || x >= mapWidth) {
      return null;
    }
    return map[y][x];
  }

  public void draw(int xoffset) {
    for (Block block : blocks) {
      if (block.getX()+block.getWidth() >= xoffset && block.getX() <= xoffset + 1000) {
        block.draw(xoffset);
      }
    }
  }

}
