class LetterW {
  int gridX, gridY;
  float waveHeight, baseHeight;
  color PGRAPHICS_COLOR = color(0);
  PGraphics pg;


  LetterW(int gridX, int gridY, float waveHeight, float baseHeight) {
    this.gridX=gridX;
    this.gridY=gridY;
    this.waveHeight=waveHeight;
    this.baseHeight=baseHeight;


    colorMode(HSB, 360, 100, 100);
    rectMode(CENTER);

    pg = createGraphics(width, height, JAVA2D);
    pg.beginDraw();
    pg.textSize(500);
    pg.textAlign(CENTER, CENTER);
    pg.fill(PGRAPHICS_COLOR);
    pg.text("W", pg.width/2, pg.height/2.7);
    pg.endDraw();
  }

  void display() {
    background(#ffc8d2);
    float w = float(width) / gridX;
    float h = float(height) / gridY;
    translate(w/2, h/2);
    float fc = frameCount * 0.01;
    // for each 'row'
    for (int y=0; y<gridY; y++) {
      boolean continuous = false;
      // go over all the 'columns'
      for (int x=0; x<gridX; x++) {
        // for each point, determine it's position in the grid
        float vx = x * w;
        float vy = y * h;
        // determine of this point is inside the text
        color c = pg.get(int(vx), int(vy));
        boolean inText = (c == PGRAPHICS_COLOR);
        if (inText) {
          if (!continuous) {
            // when entering the text
            continuous = true;
            fill((vx + 2 * vy + frameCount) % 360, 75, 85);
            beginShape();
            vertex(vx, vy);
          }
          // add a curveVertex point which is moved upwards using noise()
          float n = noise(vx + fc, vy, fc);
          vy -= n * n * waveHeight + baseHeight;
          curveVertex(vx, vy);
        } else {
          if (continuous) {
            // when exiting the text
            continuous = false;
            vertex(vx, vy);
            endShape(CLOSE);
          }
        }
      }
    }
  }
}
