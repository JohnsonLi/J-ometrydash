public class Select {
  PImage bg = loadImage("images/bg-plain.png");
  ArrayList<Button> levels;

  // Gets every file from 'levels' directory and puts them into an arraylist.
  public Select() {
    levels = new ArrayList<Button>();
    File[] files = listFiles("levels/");
    int i = 50;
    for (File f : files) {
      levels.add(new Button(width / 2 - 300 / 2, i, 300, 90, f.getName().substring(0,f.getName().length() - 4), 29, #FFFACD));
      i += 75;
    }
  }
  
  // Draws the buttons for each file.
  public void select() {
    imageMode(CORNER);
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
    
    imageMode(CENTER);
    if ((mouseX < 111 + 5 && mouseY > height - 68 / 2)) {
      image(BACK_HOVER, 111 / 2 + 5, height - 68 / 2);
    } else {
      image(BACK, 111  / 2 + 5, height - 68 / 2);
    }
  }
  
}
