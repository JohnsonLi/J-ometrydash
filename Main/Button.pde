public class Button {
  float x, y, bWidth, bHeight;
  int textSize;
  int bColor;
  String label;
  boolean isColored = false;

  PImage buttonImg;

  public Button(float x, float y, float bWidth, float bHeight, String label) {
    this.x = x;
    this.y = y;
    this.bWidth = bWidth;
    this.bHeight = bHeight;
    this.label =label;
    this.textSize = 14;
    buttonImg = loadImage("images/button.png");
    textFont(createFont("caveatbrush-regular.ttf", textSize));
  }

  // Constructor for different text size.
  public Button(float x, float y, float bWidth, float bHeight, String label, int textSize) {
    this.x = x;
    this.y = y;
    this.bWidth = bWidth;
    this.bHeight = bHeight;
    this.label =label;
    this.textSize = textSize;
    buttonImg = loadImage("images/button.png");
    textFont(createFont("caveatbrush-regular.ttf", textSize));
  }

  // Constructor for text color.
  public Button(float x, float y, float bWidth, float bHeight, String label, int textSize, int bColor) {
    this.x = x;
    this.y = y;
    this.bWidth = bWidth;
    this.bHeight = bHeight;
    this.label =label;
    this.textSize = textSize;
    isColored = true;
    this.bColor = bColor;
    buttonImg =loadImage("images/levelbutton.png");
    textFont(createFont("caveatbrush-regular.ttf", textSize));
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

    image(buttonImg, x, y, bWidth, bHeight);
    textSize(textSize);
    fill(#000000);
    textAlign(CENTER, CENTER);
    if(isColored){
      fill(bColor);
    }
    
    // Puts the word at the center (kinda). 
    text(label, width - (width - x - bWidth / 2), height - (height - y - bHeight / 2.5));

    popMatrix();
  }
}
