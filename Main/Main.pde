Map map;
Player player;
final int UNIT = 30;
final int BG_COLOR = #cdebff;
final int FLOOR_COLOR = #b4e1ff;
final int BLOCK_COLOR = #fffacd;
int xoffset = 0;
static int limit = -20000;

// State of the program
String state = "PLAY";

Button edit;
Button back;

public void setup() {
  frameRate(144);
  map = new Map(BG_COLOR);
  player = new Player();
  edit = new Button(930, 10, 60, 20, "EDIT", #80efbd, #0cb818);
  back = new Button(930, 10, 60, 20, "BACK", #80efbd, #0cb818);
  size(1020, 420);
  map.addBlock(new Block(0, height - 120, width + (-1 * limit), 120, FLOOR_COLOR));
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
  if (xoffset <= -200) {
    translate(xoffset+200, 0);
  } //Lets the block travel to its position before screen scrolls
  map.draw();
  player.update();
  player.draw();
  popMatrix();
  edit.draw();
  if (xoffset < limit) return;
  xoffset-=2.5;

}

public void edit() {
  pushMatrix();
    translate(xoffset, 0);
    map.draw();
    drawGrid();
  popMatrix();
  back.draw();
}

public void keyPressed() {
  if (keyCode == RIGHT && state.equals("EDIT")) {
    xoffset -= 5;
  }
  else if (keyCode == LEFT && state.equals("EDIT")) {
    if (xoffset == 0) return;
    xoffset += 5;
  } else {
    player.keyPressed(key);
  }
}

public void mouseClicked() {
  if (mouseButton == RIGHT && state.equals("EDIT")) {
    System.out.println(xoffset);
    map.addBlock(new Block(UNIT * (mouseX - xoffset / UNIT), UNIT * (mouseY / UNIT), UNIT, UNIT, BLOCK_COLOR));
  }
  if (mouseButton == CENTER) {
    player.die();
  }
  if (mouseButton == LEFT && edit.isHovering() && state.equals("PLAY")) {
    state = "EDIT";
    xoffset = 0;
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
  
    for (int x = 0; x < width - xoffset ; x += UNIT) {
      line(x, 0, x, height);
    }
    for (int y = 0; y < height; y+= UNIT) {
      line(0, y, width - xoffset, y);
    }
}

public static int getLimit() {
  return limit;
}
