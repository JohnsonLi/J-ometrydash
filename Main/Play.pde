public class Play {

  public void play() {
    background.draw();

    pushMatrix();
    if (xoffset <= -200) {
      translate(xoffset+200, 0);
    } //Lets the block travel to its position before screen scrolls
    map.draw();

    if (player.getX() > limit * -1) {
      state = "END";
    } else { 
      player.update();
    }

    player.draw();

    popMatrix();

    if (debug) {
      edit.draw();
      debugButtons();
    }

    if (xoffset < limit) return;
    xoffset-=2.5;
  }

  // Draws all buttons for debug mode.
  public void debugButtons() {

    runMode.draw();
    planeMode.draw();
  }
}
