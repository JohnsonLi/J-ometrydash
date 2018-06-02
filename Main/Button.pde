public class Button{
    float x, y, bWidth, bHeight;
    int bColor, stroke;
    String label;
    
    public Button(float x, float y, float bWidth, float bHeight, String label, int bColor, int stroke){
      this.x = x;
      this.y = y;
      this.bWidth = bWidth;
      this.bHeight = bHeight;
      this.bColor = bColor;
      this.stroke = stroke;
      this.label =label;
    }
    
    public void draw(){
      pushMatrix(); 
      
      fill(bColor);
      stroke(stroke);
      //rectMode(CENTER);
      rect(x, y, bWidth, bHeight);
      
      textSize(10);
      fill(#000000);
      textAlign(CENTER, CENTER);
      text("213131331", x/2, y/3, x, y);
      
      popMatrix();
    }
  
}
