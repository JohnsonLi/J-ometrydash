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
      rect(x, y, bWidth, bHeight);
      
      popMatrix();
    }
  
}
