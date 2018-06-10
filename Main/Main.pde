Map map;
Player player;
final int UNIT = 30;
final int FLOOR_HEIGHT = 4;
final int BG_COLOR = #cdebff;
final int FLOOR_COLOR = #b4e1ff;

final int BLOCK_COLOR = #fffacd;
PImage BACKGROUND_PIC, PLAY, QUIT, PLAY_HOVER, QUIT_HOVER,LEVEL_COMPLETE;

int endSize;
int xoffset;
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
Button returnToMenu;

Play playClass;
Edit editClass;
Menu menuClass;

public void setup() {
  endSize = 100;
  xoffset = 0;
  playClass = new Play();
  editClass = new Edit();
  menuClass = new Menu();
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
  LEVEL_COMPLETE = loadImage("images/level-complete-message.png");
  frameRate(144);
  player = new Player();
  edit = new Button(930, 10, 60, 20, "EDIT");
  back = new Button(930, 10, 60, 20, "BACK");
  debugB = new Button(950, 390, 60, 20, "Debug");
  block = new Button(930, 320, 60, 20, "Block");
  spike = new Button(930, 350, 60, 20, "Spike");
  portal = new Button(930, 380, 60, 20, "Portal");
  save = new Button(30, 320, 60, 20, "Save");
  load = new Button(30, 350, 60, 20, "Load");
  clear = new Button(100, 320, 60, 20, "Clear");
  runMode = new Button(20, 380, 80, 20, "Run Mode");
  planeMode = new Button(110, 380, 80, 20, "Plane Mode");
  returnToMenu = new Button(415, 200, 150, 75, "Return To Menu");
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
    end();
    break;
  }
}


public void play() {
  playClass.play();
}

public void edit() {
  editClass.edit();
}

public void menu() {
  menuClass.menu();
}

public void end() {
  background.draw();
  map.draw();

  if (player.getX() > limit * -1 + width) {
    if (endSize == 1) {
      returnToMenu.draw();
    } else {
      endSize--;
    }   
    imageMode(CENTER);
    image(LEVEL_COMPLETE, 500, 100, 400./endSize, 100./endSize);
    imageMode(CORNER);
  } else {
    pushMatrix();
    translate(xoffset+200, 0);
    player.draw(false);
    Vector v = player.endGameVelocity;
    player.addX((int)v.getX());
    player.addY((int)v.getY());
    v.add(new Vector(.02, .05));
    player.endGameParticle.update();
    player.endGameParticle.draw();
    popMatrix();
  }
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
  if (mouseButton == LEFT && returnToMenu.isHovering() && state.equals("END")) {
    setup();
    state = "MENU";
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
}




public static int getLimit() {
  return limit;
}
