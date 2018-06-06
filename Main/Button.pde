public class Button {
  float x, y, bWidth, bHeight;
  int bColor, stroke;
  String label;

  public Button(float x, float y, float bWidth, float bHeight, String label, int bColor, int stroke) {
    this.x = x;
    this.y = y;
    this.bWidth = bWidth;
    this.bHeight = bHeight;
    this.bColor = bColor;
    this.stroke = stroke;
    this.label =label;
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

    fill(bColor);
    stroke(stroke);
    rect(x, y, bWidth, bHeight);

    textSize(12);
    fill(#000000);
    textAlign(CENTER, CENTER);
    text(label, width - (width - x - bWidth / 2), height - (height - y - bHeight / 2));

    popMatrix();
  }
}
