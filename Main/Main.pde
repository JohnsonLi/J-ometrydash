Map map;
Player player;
final int UNIT = 30;
final int BG_COLOR = #cdebff;
final int FLOOR_COLOR = #b4e1ff;
final int BLOCK_COLOR = #fffacd;
int xoffset = 0;
static int limit = -2000;

// State of the program
String state = "PLAY";

Button edit;
Button back;

public void setup() {
  map = new Map(BG_COLOR);
  player = new Player();
  edit = new Button(930, 10, 60, 20, "EDIT", #80efbd, #0cb818);
  back = new Button(930, 10, 60, 20, "BACK", #80efbd, #0cb818);
  size(1020, 420);
  map.addBlock(new Block(0, height - 120, width + (-1 * limit), 120, FLOOR_COLOR));
  //map.addBlock(new Block(200, 245, 500, UNIT, BLOCK_COLOR));
  //map.addBlock(new Block(200, 220, 500, UNIT, BLOCK_COLOR));
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

  System.out.println(state);
}

public void play() {
  pushMatrix();

  if (xoffset <= -100) {
    translate(xoffset+100, 0);
  }
  map.draw();
  edit.draw();
  player.update();
  player.draw();
  popMatrix();
  if (xoffset < limit) {
    return;
  }
  xoffset-=4;

  //if(edit.isHovering()){
  //  System.out.println("hovering");
  //} else {
  //  System.out.println("not hovering");
  //}
}

public void edit() {
  map.draw();
  drawGrid();
  back.draw();
}

public void keyPressed() {
  player.keyPressed(key);
}

public void mouseClicked() {
  System.out.println(mouseButton);
  if (mouseButton == RIGHT && state.equals("EDIT")) {
    map.addBlock(new Block(mouseX - UNIT / 2, mouseY - UNIT / 2, UNIT, UNIT, BLOCK_COLOR));
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
}


// Draws a grid with each box with the size of 1 UNIT
public void drawGrid() {
  // Makes line black with less opacity
  stroke(0, 120);

  for (int x = 0; x < width; x += UNIT) {
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y+= UNIT) {
    line(0, y, width, y);
  }
}

public static int getLimit() {
  return limit;
}
