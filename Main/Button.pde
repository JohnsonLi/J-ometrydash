public class Button {
  float x, y, bWidth, bHeight;
  int textSize;
  String label;
  PImage buttonImg = loadImage("images/button.png");

  public Button(float x, float y, float bWidth, float bHeight, String label) {
    this.x = x;
    this.y = y;
    this.bWidth = bWidth;
    this.bHeight = bHeight;
    this.label =label;
    this.textSize = 12;
  }
  
   public Button(float x, float y, float bWidth, float bHeight, String label, int textSize) {
    this.x = x;
    this.y = y;
    this.bWidth = bWidth;
    this.bHeight = bHeight;
    this.label =label;
    this.textSize = textSize;
  }

  // Checks if your mouse is hovering over 'this' button
  public boolean isHovering() {
    float xMax = x + bWidth;
    float yMax = y + bHeight;
    //float xMax = 100;
    //float yMax = 100;

    return mouseX > x && mouseX < xMax && mouseY > y && mouseY < yMax;
  }

  public void draw() {
    pushMatrix(); 

    image(buttonImg,x, y, bWidth, bHeight);
    
    textSize(textSize);
    fill(#000000);
    textAlign(CENTER, CENTER);
    text(label, width - (width - x - bWidth / 2), height - (height - y - bHeight / 2));

    popMatrix();
  }
}
