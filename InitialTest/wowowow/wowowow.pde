Ball ball;
float x,dx;
float y,dy;
int xoffset = 0;
Map map;
ArrayList<int[]> back = new ArrayList<int[]>();
void setup (){
  parseBackground();
  size(1000,800);
  frameRate(100);
  map = new Map(800,2000);
  ball = new Ball(200f,0f,50);
  ball.speedUp(new Vector(1,0));
  for (int i = 0; i < 200; i ++) {
    map.setBlock(10*i,780,new Block(i*10,780,10,10));
  }
  for (int i = 0; i < 50; i ++) {
    map.setBlock(10*i + 100,500,new Block(i*10 + 100,500,10,10));
  }
  for (int i = 0; i < 50; i ++) {
    map.setBlock(10*i + 100,500,new Block(i*10 + 100,500,10,10));
  }
}

public void background() {
  background(#178167);
  //for (int[] a : back) {
  //  fill(a[4],a[5],a[6]);
  //  noStroke();
  //  rect(a[0]-xoffset,a[1],a[2],a[3]);
 // }
}

void draw() {
  background();
  map.draw(xoffset);
  ball.move();
  ball.draw(xoffset);
  xoffset++;
}

public void parseBackground() {
  /*BufferedReader reader = createReader("maps/backgrounds.txt");
    String line = null;
    try {
      while ((line = reader.readLine()) != null) {
        String[] pieces = split(line, ",");
        if (pieces.length != 7) throw new IOException();
        int x = int(pieces[0]);
        int y = int(pieces[1]);
        int w = int(pieces[2]);
        int h = int(pieces[3]);
        int r = int(pieces[4]);
        int g = int(pieces[5]);
        int b = int(pieces[6]);
        back.add(new int[] {x,y,w,h,r,g,b});
        
      }
      reader.close();
    } catch (IOException e) {
    }*/
    for (int i = 0; i < 200; i++) {
      int x = int(random(800));;
      int y = int(random(2000));
      int w = int(random(10)*100);
      int h = int(random(10)*100);
      int r = int(random(255));
      int g = int(random(255));
      int b = int(random(255));
      back.add(new int[] {x,y,w,h,r,g,b});
      back.add(new int[] {x+20,y+20,w-40,h-40,r+10,g+10,b+10});
    }




}
void mousePressed() {
    ball.press();
    ball.setX(mouseX+xoffset);
    ball.setY(mouseY);
    x = mouseX;
    y = mouseY;
  }
  public void mouseDragged() {
    ball.setX(mouseX+xoffset);
    ball.setY(mouseY);
   
    dx = mouseX - x;
    dy = mouseY - y;
    x = mouseX;
    y = mouseY;
  }
  public void mouseReleased() {
    ball.release();
    ball.speedUp(new Vector(dx/10,dy/10));
    dx = 0;
    dy = 0;
    
  }