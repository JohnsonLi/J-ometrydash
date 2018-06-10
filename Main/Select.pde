public class Select {
  PImage bg = loadImage("images/bg-plain.png");
  ArrayList<Button> levels;

  public Select() {
    levels = new ArrayList<Button>();
    File[] files = listFiles("levels");
    int i = 0;
    for (File f : files) {
      levels.add(new Button(450, i, 100, 50, f.getName()));
      i += 75;
    }
  }
  public void select() {
    image(bg,0,0);
    for (Button b : levels) {
      b.draw();
    }
    if (mousePressed && mouseButton == LEFT) {
      for (Button b : levels) {
       if (b.isHovering()) {
         map.load("levels/" + listFiles("levels")[levels.indexOf(b)].getName());
         state = "PLAY";
         return;
       }
      }
      
    } 
  }
  
}
