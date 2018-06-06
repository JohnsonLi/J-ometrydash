Map map;
Player player;
final int UNIT = 30;
final int FLOOR_HEIGHT = 4;
final int BG_COLOR = #cdebff;
final int FLOOR_COLOR = #b4e1ff;
final int BLOCK_COLOR = #fffacd;

int xoffset = 0;
static int limit = -2000;

// State of the program
String state = "PLAY";


Button edit;
Button back;
Button runMode;
Button planeMode;
Button block;
Button spike;

public void setup() {
  frameRate(144);
  map = new Map(BG_COLOR);
  player = new Player();
  edit = new Button(930, 10, 60, 20, "EDIT", #80efbd, #0cb818);
  back = new Button(930, 10, 60, 20, "BACK", #80efbd, #0cb818);
  size(1020, 420);

  //floor
  map.addBlock(new Block(0, height - FLOOR_HEIGHT * UNIT, width + (-1 * limit), 120, FLOOR_COLOR));
}

public void draw() {
  // Sees what state the program is in and calls the corect draw function
  switch(state) {
  case "PLAY":
    play();
    break;
  case "EDIT":
    edit();
    break;
  }
}

public void play() {
  pushMatrix();

  if (xoffset <= -100) {
    translate(xoffset+100, 0);
  } //Lets the block travel to its position before screen scrolls
  map.draw();
  player.update();
  player.draw();

  popMatrix();

  edit.draw();
  debugButtons();
  if (xoffset < limit) return;
  xoffset-=2.5;
}

public void edit() {
  map.draw();
  drawGrid();
  back.draw();
  editButtons();
}

public void keyPressed() {
  player.keyPressed(key);
}

public void mouseClicked() {
  if (mouseButton == RIGHT && state.equals("EDIT") && mouseY < (height -  FLOOR_HEIGHT * UNIT)) {
    map.addBlock(new Block(UNIT * (mouseX / UNIT), UNIT * (mouseY / UNIT), UNIT, UNIT, BLOCK_COLOR));
  }
  if (mouseButton == LEFT && state.equals("EDIT") && mouseY < (height -  FLOOR_HEIGHT * UNIT)) {
    map.removeBlock(map.blockAt(mouseX, mouseY));
  }
  if (mouseButton == CENTER) {
    player.die();
  }
  if (mouseButton == LEFT && edit.isHovering() && state.equals("PLAY")) {
    state = "EDIT";
    return;
  }
  if (mouseButton == LEFT && back.isHovering() && state.equals("EDIT")) {
    player.die();
    state = "PLAY";
    return;
  }
  if (mouseButton == LEFT && runMode.isHovering()) {
    player.setMode(new Running(player));
    player.die();
    return;
  }
  if (mouseButton == LEFT && planeMode.isHovering()) {
    player.setMode(new Airplane(player));
    player.die();
    return;
  }
}


// Draws a grid with each box with the size of 1 UNIT
public void drawGrid() {
  // Makes line black with less opacity
  stroke(0, 100);

  for (int x = 0; x < width; x += UNIT) {
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y+= UNIT) {
    line(0, y, width, y);
  }
}

public void debugButtons() {
  runMode = new Button(20, 380, 70, 20, "Run Mode", #80efbd, #0cb818);
  planeMode = new Button(110, 380, 70, 20, "Plane Mode", #80efbd, #0cb818);
  runMode.draw();
  planeMode.draw();
}

public void editButtons() {
  block = new Button(930, 350, 60, 20, "Block", #80efbd, #0cb818);
  spike = new Button(930, 380, 60, 20, "Spikes", #80efbd, #0cb818);
  block.draw();
  spike.draw();
}

public static int getLimit() {
  return limit;
}
