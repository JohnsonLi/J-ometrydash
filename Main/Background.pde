public class Background {
  PImage backgroundImg;

  public Background(PImage img) {
    backgroundImg = img;
  }
  public void draw() {
    //if ((xoffset / 800) - xoffset/50. > 0)
    image(backgroundImg, 0, 0);
    image(backgroundImg, 800, 0);
    image(backgroundImg, 1600, 0);
  }
}
