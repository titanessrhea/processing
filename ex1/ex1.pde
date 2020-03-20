import processing.sound.*;

PImage bg;
SoundFile sf;
int x1 = 0;
int x2 = 0;
int y = 0;

void setup() {
  size(500, 500);
  background(255);
  bg = loadImage("ex1.png");
  sf = new SoundFile(this, "ex1.mp3");
  sf.loop();
  x2 = x1 - width;
}

void draw() {
  image(bg, x1, y);
  x1++;
  if (x1 > width) {
    x1 = -width;
  }
  image(bg, x2, y);
  x2++;
  if (x2 > width) {
    x2 = x1 - width;
  }
}
