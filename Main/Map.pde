import java.util.*;

public class Map {
  private Block[][] map; //For O(0) blockAt()
  private ArrayList<Block> blocks = new ArrayList<Block>(); //For O(n) draw() instead of O(n^2)
  int bgColor, floorColor, blockColor;

  PrintWriter output;
  boolean typing = false;
  String input = "";

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

  public void removeBlock(Block b, ArrayList<Block> blocklist) {
    blocklist.remove(b);
    if (b != null) {
      b.editMap1(map);
    }
  }

  // Writes to a file the properties of every block on the map. 
  public void save() {
    //typing = true;
    //System.out.println("TYPING");
    if (typing == false) {
      output = createWriter("level1.txt"); 
      for (Block b : blocks) {
        output.println(b.getX() + " " + b.getY() + " " + b.getWidth() + " " + b.getHeight() + " " + b.getColor() + " " + b.getType());
        //System.out.println(b.getType());
      }   
      output.flush(); 
      output.close();
    }
  }

  
  // Reads a file and create new block objects using the info.
  public void load() {
    BufferedReader reader = createReader("level1.txt");
    removeBlocks();
    String line = null;
    try {
      while ((line = reader.readLine()) != null) {
        String[] pieces = split(line, " ");
        int type = Integer.parseInt(pieces[5]);
        
        // Check which type of block it is
        switch (type) {
        case 0:
          addBlock(new Block(Integer.parseInt(pieces[0]), Integer.parseInt(pieces[1]), Integer.parseInt(pieces[2]), Integer.parseInt(pieces[3]), Integer.parseInt(pieces[4])));
          break;
        case 1:
          addBlock(new Spike(Integer.parseInt(pieces[0]), Integer.parseInt(pieces[1]), Integer.parseInt(pieces[2]), Integer.parseInt(pieces[3]), Integer.parseInt(pieces[4])));
          break;
        case 2:
          addBlock(new Portal(Integer.parseInt(pieces[0]), Integer.parseInt(pieces[1]), Integer.parseInt(pieces[2]), Integer.parseInt(pieces[3]), Integer.parseInt(pieces[4])));
          break;
        }
      }
      reader.close();
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
  }

  // Removes all blocks from the map except the floor.
  public void removeBlocks() {
    //Can't edit concurrently so do it on a copy.
    ArrayList<Block> copy = new ArrayList<Block>(blocks);
    for (Block b : blocks) {
      copy.add(b);
    }
    for (Block b : copy) {
      removeBlock(b, blocks);
    }

    // Put floor back
    addBlock(new Block(0, height - 120, width + (-1 * limit), 120, FLOOR_COLOR));
  }

  //Draws every block and the colors
  public void draw() {
    //System.out.println(typing);
    //System.out.println(input);
    background(bgColor);
    for (Block b : blocks) {
      b.draw();
    }
  }

  public  ArrayList<Block> getBlocks() {
    return blocks;
  }
}
