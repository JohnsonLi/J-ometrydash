public class Map {
  private Block[][] map; //For O(0) blockAt()
  private ArrayList<Block> blocks = new ArrayList<Block>(); //For O(n) draw() instead of O(n^2)
  int bgColor, floorColor, blockColor;
  PrintWriter output;

  /** Constructs the map */
  public Map(int bgColor) {
    this.bgColor = bgColor;
    map = new Block[height][width + (-1 * Main.getLimit())];
  }

  /** Returns the block at specific coords */
  public Block blockAt(int x, int y) {
    if (x < 0 || x >= width + (-1 * Main.getLimit()) || y < 0 || y >= height) return null;
    return map[y][x];
  }

  /** Adds a new block onto the map*/
  public void addBlock(Block b) {
    if (b.getY() < 0) return;
    if (map[b.getY()][b.getX()] != null) return;
    blocks.add(b);
    b.editMap(map);
  }

  public void removeBlock(Block b) {
    blocks.remove(b);
    if (b != null) {
      b.editMap1(map);
    }
  }

  public void save() {
    output = createWriter("level1.txt"); 
    for (Block b : blocks) {
      output.println(b.getX() + " " + b.getY() + " " + b.getWidth() + " " + b.getHeight() + " " + b.getColor());
    }   
    output.flush(); 
    output.close();
  }

  public void load() {
  }

  //Draws every block and the colors
  public void draw() {
    background(bgColor);
    for (Block b : blocks) {
      b.draw();
    }
  }
}
