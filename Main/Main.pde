Map map;
Player player;
final int UNIT = 30;
final int FLOOR_HEIGHT = 4;
final int BG_COLOR = #cdebff;
final int FLOOR_COLOR = #b4e1ff;
final int BLOCK_COLOR = #fffacd;
PImage BACKGROUND_PIC, PLAY, QUIT, PLAY_HOVER, QUIT_HOVER;

int xoffset = 0;
static int limit = -20000;

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
  //floor
  map.addBlock(new Block(0, height - 120, width + (-1 * limit), 120, FLOOR_COLOR));

  BACKGROUND_PIC = loadImage("images/bg.png");
  PLAY = loadImage("images/play.png");
  QUIT = loadImage("images/quit.png");
  PLAY_HOVER = loadImage("images/play-hover.png");
  QUIT_HOVER = loadImage("images/quit-hover.png");
  frameRate(144);
  player = new Player();
  edit = new Button(930, 10, 60, 20, "EDIT", #80efbd, #0cb818);
  back = new Button(930, 10, 60, 20, "BACK", #80efbd, #0cb818);
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

  if (debug) {
    edit.draw();
    debugButtons();
  }

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
  editButtons();

  textSize(18);
  fill(#000000);
  textAlign(CENTER, CENTER);
  text("current obstacle: " + currentlySelected, 120, 380);

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
  String debugStatus;
  debugStatus = debug ? "ON" : "OFF";
  background(BACKGROUND_PIC);
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
  
  fill(#000000);
  textAlign(CENTER, CENTER);
  text("Debug: " + debugStatus, 980, 380);

  debugB = new Button(950, 390, 60, 20, "Debug", #80efbd, #0cb818);
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
  } else {
    player.keyPressed(key);
  }
}

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
      map.load();
      showingText = true;
      return;
    }
    if (mouseButton == LEFT && clear.isHovering()) {
      map.removeBlocks();
      System.out.println("ef");
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
    if(mouseButton == LEFT && debugB.isHovering()){
      debug = !debug;
    }
  }
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

public void debugButtons() {
  runMode = new Button(20, 380, 70, 20, "Run Mode", #80efbd, #0cb818);
  planeMode = new Button(110, 380, 70, 20, "Plane Mode", #80efbd, #0cb818);
  runMode.draw();
  planeMode.draw();
}

public void editButtons() {
  block = new Button(930, 320, 60, 20, "Block", #80efbd, #0cb818);
  spike = new Button(930, 350, 60, 20, "Spikes", #80efbd, #0cb818);
  portal = new Button(930, 380, 60, 20, "Portals", #80efbd, #0cb818);
  save = new Button(30, 320, 60, 20, "SAVE", #80efbd, #0cb818);
  load = new Button(30, 350, 60, 20, "LOAD", #80efbd, #0cb818);
  clear = new Button(100, 320, 60, 20, "CLEAR", #80efbd, #0cb818);
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
