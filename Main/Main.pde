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

Button edit;
Button back;
Button runMode;
Button planeMode;
Button block;
Button spike;

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

  edit.draw();
  debugButtons();
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
}

public void menu() {
  background(BACKGROUND_PIC);
  imageMode(CENTER);
  //image(PLAY, width / 2, 225);
  //image(QUIT, width / 2, 325);
  if((mouseX < width / 2 + (130 / 2) && mouseY < 225 + (89 / 2)) && (mouseX > width / 2 - (130 / 2) && mouseY > 225 - (89 / 2))){
    image(PLAY_HOVER, width / 2, 225);
  } else {
    image(PLAY, width / 2, 225);
  }

  if((mouseX < width / 2 + (130 / 2) && mouseY < 325 + (89 / 2)) && (mouseX > width / 2 - (130 / 2) && mouseY > 325 - (89 / 2))){
    image(QUIT_HOVER, width / 2, 325);
  } else {
    image(QUIT, width / 2, 325);
  }

}

public void keyPressed() {
  if (keyCode == RIGHT && state.equals("EDIT")) {
    xoffset -= 5;
  }
  else if (keyCode == LEFT && state.equals("EDIT")) {
    //if (xoffset == 0) return;
    xoffset += 5;
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
    }
  }
  if (mouseButton == LEFT && state.equals("EDIT")) {
    map.removeBlock(map.blockAt(mouseX - xoffset, mouseY));
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
  }
  if (state.equals("PLAY")) {
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
  
  if(state.equals("MENU")){
    if(mouseButton == LEFT && (mouseX < width / 2 + (130 / 2) && mouseY < 225 + (89 / 2)) && (mouseX > width / 2 - (130 / 2) && mouseY > 225 - (89 / 2))){
      state = "PLAY";
      return;
    }
    if((mouseX < width / 2 + (130 / 2) && mouseY < 325 + (89 / 2)) && (mouseX > width / 2 - (130 / 2) && mouseY > 325 - (89 / 2))){
      exit();
    }
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