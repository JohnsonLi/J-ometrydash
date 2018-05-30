Map map;
Player player;

public void setup(){
  map = new Map(#000000,#50F442,#FFFACD);
  player = new Player();
  size(1000, 400);
  map.addBlock(new Block(0, 275, 1000,125));
}

public void draw(){
  map.draw();
  player.update();
  player.draw();
}

public void keyPressed() {
  
}