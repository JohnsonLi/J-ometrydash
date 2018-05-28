public class Vector{
  private float x,y;
  
  public Vector(float x,float y) {
    this.x = x;
    this.y = y;
  }

  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  
  public void setY(float y) {
    this.y = y;
  }
  public void setX(float x) {
    this.x = x;
  }
  public void add(Vector v) {
    x += v.getX();
    y += v.getY();
  }
  
  public void negate() {
    x *= -1;
    y *= -1;
  }
  public void negateX() {
    x *= -1;
  }
  public void negateY() {
    y *= -1;
  }
  
  public void multiply(float n) {
    x *= n;
    y *= n;
  }
  public void multiplyX(float n) {
    x *= n;
  }
  public void multiplyY(float n) {
    y *= n;
  }

}
