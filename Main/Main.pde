Map map;
Player player;
final int UNIT = 30;
final int BG_COLOR = #cdebff;
final int FLOOR_COLOR = #b4e1ff;
final int BLOCK_COLOR = #fffacd;

String state = "PLAY";

Button edit;

public void setup(){
  map = new Map(BG_COLOR);
  player = new Player();
  edit = new Button(930, 10, 60, 20, "EDIT", #80efbd, #0cb818);
  size(1000, 400);
  map.addBlock(new Block(0, 275, 1000,125, FLOOR_COLOR));
  map.addBlock(new Block(200, 245, 500, UNIT, BLOCK_COLOR));
  //map.addBlock(new Block(200, 220, 500, UNIT, BLOCK_COLOR));
}

public void draw(){
  switch(state){
    case "PLAY":
      play();
      break;
    case "EDIT":
      edit();
      break;
  }
}

public void play(){
  map.draw();
  edit.draw();
  player.update();
  player.draw();
  
  if(edit.isHovering()){
    System.out.println("hovering");
  } else {
    System.out.println("not hovering");
  }
}

public void edit(){
  
}

public void keyPressed() {
  player.keyPressed(key);
}

public void mouseClicked(){
  //if (mouseButton == RIGHT) {
  //  map.addBlock(new Block(mouseX - UNIT / 2, mouseY - UNIT / 2, UNIT, UNIT, BLOCK_COLOR));
  //}
  if (mouseButton == LEFT) {
    player.die();
  }
}

//public void 
