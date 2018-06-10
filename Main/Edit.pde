public class Edit {

  public void edit() {
    background.draw();
    pushMatrix();

    translate(xoffset, 0);
    map.draw();
    drawGrid();

    popMatrix();
    back.draw();
    editButtons();

    textSize(18);
    fill(#000000);
    textAlign(CENTER, CENTER);
    text("current obstacle: " + currentlySelected, 120, 380);

    // Draws a button depending on whether it's being hovered or not.
    if (mouseButton == LEFT && save.isHovering() && showingText == true) {
      textSize(25);
      fill(#000000);
      textAlign(CENTER, CENTER);
      text("MAP SAVED", width / 2, 100);
    } else if (mouseButton == LEFT && load.isHovering() && showingText == true) {
      textSize(25);
      fill(#000000);
      textAlign(CENTER, CENTER);
      text("MAP LOADED", width / 2, 100);
    }
  }

  // Draws a grid with each box with the size of 1 UNIT
  public void drawGrid() {

    // Makes line black with less opacity
    stroke(0, 120);

    for (int x = 0; x < width - xoffset; x += UNIT) {
      line(x, 0, x, height);
    }
    for (int y = 0; y < height; y+= UNIT) {
      line(0, y, width - xoffset, y);
    }
  }

  // Draws all buttons for edit mode.
  public void editButtons() {

    block.draw();
    spike.draw();
    portal.draw();
    portalR.draw();
    save.draw();
    load.draw();
    clear.draw();
  }
}
