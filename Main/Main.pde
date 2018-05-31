Map map;
Player player;

public void setup(){
  map = new Map(#cdebff,#50F442,#FFFACD);
  player = new Player();
  size(1000, 400);
  map.addBlock(new Block(0, 275, 1000,125));
  map.addBlock(new Block(200, 250, 500, 10));
  map.addBlock(new Block(300, 225, 500, 10));
  map.addBlock(new Block(400, 200, 500, 10));
}

public void draw(){
  map.draw();
  player.update();
  player.draw();
}

public void keyPressed() {
  player.keyPressed(key);
}

public void mouseClicked(){
  map.addBlock(new Block(mouseX, mouseY, 50,50));
}