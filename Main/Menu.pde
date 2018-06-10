public class Menu {

  public void menu() {
    // Debug string for indicator
    String debugStatus;

    // Sets status from debug boolean
    debugStatus = debug ? "ON" : "OFF";

    background(BACKGROUND_PIC);

    // Draws the PLAY and QUIT buttons
    imageMode(CENTER);
    if ((mouseX < width / 2 + (130 / 2) && mouseY < 225 + (89 / 2)) && (mouseX > width / 2 - (130 / 2) && mouseY > 225 - (89 / 2))) {
      image(PLAY_HOVER, width / 2, 225);
    } else {
      image(PLAY, width / 2, 225);
    }

    if ((mouseX < width / 2 + (130 / 2) && mouseY < 325 + (89 / 2)) && (mouseX > width / 2 - (130 / 2) && mouseY > 325 - (89 / 2))) {
      image(QUIT_HOVER, width / 2, 325);
    } else {
      image(QUIT, width / 2, 325);
    }

    // Debug on or off indicator
    fill(#000000);
    textAlign(CENTER, CENTER);
    text("Debug: " + debugStatus, 980, 380);

    imageMode(CORNER);
    debugB.draw();
  }
}
