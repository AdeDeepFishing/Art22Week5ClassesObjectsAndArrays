/*
 * Course: ART 22  - Computer Programming for the Arts
 * Assignment: Week 5 Practice
 *
 * by Yanwen Chen
 * Initiated: 2022/04/27
 * Last updated: 2022/05/01
 *
 * CITATIONS: List all sources you used for this assignment.
 * https://github.com/AmnonOwed/CAN_GenerativeTypography/blob/master/Image-Based/Waves/Waves.pde
 *
 * NOTE: This is where you write any notes you would like
 * to leave yourself or others using your code.
 *
 * */

Word myWord;


void setup() {
  background(#ffc8d2);
  size(1280, 720, P2D);
  smooth(16);
  colorMode(HSB, 360, 100, 100);

  myWord=new Word(200, 75, 55, 4);
}

void draw() {
  myWord.display();
}
