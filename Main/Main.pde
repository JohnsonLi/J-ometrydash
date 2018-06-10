Map map;
Player player;
final int UNIT = 30;
final int FLOOR_HEIGHT = 4;
final int BG_COLOR = #cdebff;
final int FLOOR_COLOR = #b4e1ff;

final int BLOCK_COLOR = #fffacd;
PImage BACKGROUND_PIC, PLAY, QUIT, PLAY_HOVER, QUIT_HOVER;

int xoffset = 0;
static int limit = -1000;
PImage floorImg;
Background background;

// State of the program
String state = "MENU";
String currentlySelected = "BLOCK";
boolean debug = true;
boolean showingText = false;

Button edit, back, clear, save, load;
Button runMode, planeMode;
Button block, spike, portal;
Button debugB;

public void setup() {
  map = new Map(BG_COLOR);
  floorImg = loadImage("images/floor.png");
  //floor
  map.addBlock(new Block(0, height - 120, width + (-1 * limit), 120, FLOOR_COLOR));
  background = new Background(loadImage("images/background.png"));
  BACKGROUND_PIC = loadImage("images/bg.png");
  PLAY = loadImage("images/play.png");
  QUIT = loadImage("images/quit.png");
  PLAY_HOVER = loadImage("images/play-hover.png");
  QUIT_HOVER = loadImage("images/quit-hover.png");
  frameRate(144);
  player = new Player();
  edit = new Button(930, 10, 60, 20, "EDIT");
  back = new Button(930, 10, 60, 20, "BACK");
  size(1020, 420);
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
  case "MENU":
    menu();
    break;
  case "END":
  }
}


public void play() {
  background.draw();
  
  pushMatrix();
  if (xoffset <= -200) {
    translate(xoffset+200, 0);
  } //Lets the block travel to its position before screen scrolls
  map.draw();

  if (player.getX() > limit * -1) {
    state = "END";
  } else { 
    player.update();
  }
  
  player.draw();
  
  popMatrix();

  if (debug) {
    edit.draw();
    debugButtons();
  }

  if (xoffset < limit) return;
  xoffset-=2.5;
}

public void edit() {
  background.draw();
  pushMatrix();

  translate(xoffset, 0);
  map.draw();
  drawGrid();

  popMatrix();
  back.draw();
  editButtons();

  textSize(18);
  fill(#000000);
  textAlign(CENTER, CENTER);
  text("current obstacle: " + currentlySelected, 120, 380);

  // Draws a button depending on whether it's being hovered or not.
  if (mouseButton == LEFT && save.isHovering() && showingText == true) {
    textSize(25);
    fill(#000000);
    textAlign(CENTER, CENTER);
    text("MAP SAVED", width / 2, 100);
  } else if (mouseButton == LEFT && load.isHovering() && showingText == true) {
    textSize(25);
    fill(#000000);
    textAlign(CENTER, CENTER);
    text("MAP LOADED", width / 2, 100);
  }
}

public void menu() {
  // Debug string for indicator
  String debugStatus;

  // Sets status from debug boolean
  debugStatus = debug ? "ON" : "OFF";

  background(BACKGROUND_PIC);

  // Draws the PLAY and QUIT buttons
  imageMode(CENTER);
  if ((mouseX < width / 2 + (130 / 2) && mouseY < 225 + (89 / 2)) && (mouseX > width / 2 - (130 / 2) && mouseY > 225 - (89 / 2))) {
    image(PLAY_HOVER, width / 2, 225);
  } else {
    image(PLAY, width / 2, 225);
  }

  if ((mouseX < width / 2 + (130 / 2) && mouseY < 325 + (89 / 2)) && (mouseX > width / 2 - (130 / 2) && mouseY > 325 - (89 / 2))) {
    image(QUIT_HOVER, width / 2, 325);
  } else {
    image(QUIT, width / 2, 325);
  }

  // Debug on or off indicator
  fill(#000000);
  textAlign(CENTER, CENTER);
  text("Debug: " + debugStatus, 980, 380);

  debugB = new Button(950, 390, 60, 20, "Debug");
  debugB.draw();
}

public void keyPressed() {
  //Scroll to the right
  if (keyCode == RIGHT && state.equals("EDIT")) {
    xoffset -= 15;
    //Scroll to the left
  } else if (keyCode == LEFT && state.equals("EDIT")) {
    if (xoffset == 0) return;
    xoffset += 15;
  }
}


// Events for when the mouse is clicked.
public void mouseClicked() {
  if (mouseButton == RIGHT && state.equals("EDIT")) {
    switch (currentlySelected) {
    case "BLOCK":
      map.addBlock(new Block(UNIT * ((mouseX - xoffset) / UNIT), UNIT * (mouseY / UNIT), UNIT, UNIT, BLOCK_COLOR));
      break;
    case "SPIKE":
      map.addBlock(new Spike(UNIT * ((mouseX - xoffset) / UNIT), UNIT * (mouseY / UNIT), UNIT, UNIT, BLOCK_COLOR));
      break;
    case "PORTAL":
      map.addBlock(new Portal(UNIT * ((mouseX - xoffset) / UNIT), UNIT * ((mouseY / UNIT)-1), UNIT, 3 * UNIT, BLOCK_COLOR));
      break;
    }
  }
  if (mouseButton == LEFT && state.equals("EDIT") && mouseY < height - 120) {
    map.removeBlock(map.blockAt(mouseX - xoffset, mouseY), map.getBlocks());
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
  if (state.equals("EDIT")) {
    if (mouseButton == LEFT && block.isHovering() && state.equals("EDIT")) {
      currentlySelected = "BLOCK";
      return;
    }
    if (mouseButton == LEFT && spike.isHovering() && state.equals("EDIT")) {
      currentlySelected = "SPIKE";
      return;
    }
    if (mouseButton == LEFT && portal.isHovering() && state.equals("EDIT")) {
      currentlySelected = "PORTAL";
      return;
    }
    if (mouseButton == LEFT && save.isHovering()) {
      map.save();
      showingText = true;
      return;
    }
    if (mouseButton == LEFT && load.isHovering()) {
      map.load("test.txt");
      showingText = true;
      return;
    }
    if (mouseButton == LEFT && clear.isHovering()) {
      map.removeBlocks();
      return;
    }
  }
  if (state.equals("PLAY") && debug) {
    if (mouseButton == LEFT && runMode.isHovering()) {
      player.die();
      player.setMode(new Running(player));
      return;
    }
    if (mouseButton == LEFT && planeMode.isHovering()) {
      player.die();
      player.setMode(new Airplane(player));
      return;
    }
  }

  if (state.equals("MENU")) {
    if (mouseButton == LEFT && (mouseX < width / 2 + (130 / 2) && mouseY < 225 + (89 / 2)) && (mouseX > width / 2 - (130 / 2) && mouseY > 225 - (89 / 2))) {
      state = "PLAY";
      return;
    }
    if (mouseButton == LEFT && (mouseX < width / 2 + (130 / 2) && mouseY < 325 + (89 / 2)) && (mouseX > width / 2 - (130 / 2) && mouseY > 325 - (89 / 2))) {
      exit();
    }
    if (mouseButton == LEFT && debugB.isHovering()) {
      debug = !debug;
    }
  }

  //if (state.equals("LEVEL") {
  //}
}


// Draws a grid with each box with the size of 1 UNIT
public void drawGrid() {

  // Makes line black with less opacity
  stroke(0, 120);

  for (int x = 0; x < width - xoffset; x += UNIT) {
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y+= UNIT) {
    line(0, y, width - xoffset, y);
  }
}

// Draws all buttons for debug mode.
public void debugButtons() {
  runMode = new Button(20, 380, 80, 20, "Run Mode");
  planeMode = new Button(110, 380, 80, 20, "Plane Mode");
  runMode.draw();
  planeMode.draw();
}


// Draws all buttons for edit mode.
public void editButtons() {
  block = new Button(930, 320, 60, 20, "Block");
  spike = new Button(930, 350, 60, 20, "Spike");
  portal = new Button(930, 380, 60, 20, "Portal");
  save = new Button(30, 320, 60, 20, "Save");
  load = new Button(30, 350, 60, 20, "Load");
  clear = new Button(100, 320, 60, 20, "Clear");
  block.draw();
  spike.draw();
  portal.draw();
  save.draw();
  load.draw();
  clear.draw();
}

public static int getLimit() {
  return limit;
}
