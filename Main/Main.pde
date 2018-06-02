Map map;
Player player;
final int UNIT = 30;
String state = "PLAY";

Button button = new Button(950, 10, 40, 20, "button", #80efbd, #0cb818);

public void setup(){
  map = new Map(#cdebff,#50F442,#FFFACD);
  player = new Player();
  size(1000, 400);
  map.addBlock(new Block(0, 275, 1000,125));
  map.addBlock(new Block(200, 245, 500, UNIT));
  map.addBlock(new Block(200, 220, 500, UNIT));
}

public void draw(){
  switch(state){
    case "PLAY":
      play();
      break;
  }
}

public void play(){
  map.draw();
  player.update();
  player.draw();
  button.draw();
  
}

public void keyPressed() {
  player.keyPressed(key);
}

public void mouseClicked(){
  if (mouseButton == RIGHT) {
    map.addBlock(new Block(mouseX, mouseY, UNIT, UNIT));
  }
  if (mouseButton == LEFT) {
    player.die();
  }
}
