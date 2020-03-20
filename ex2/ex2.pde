import processing.sound.*;
import com.hamoid.*;

VideoExport videoExport;
float movieFPS = 30;
float movieSEC = 40;
PImage bgA;
PImage bgB;
SoundFile sf;
int xA1 = 0;
int xA2 = 0;
int xA3 = 0;
int xB1 = 0;
int xB2 = 0;
int xB3 = 0;
int yA = 0;
int yB = 0;
int halfWidth;

void setup() {
  size(500, 500);
  background(#0F7C13);
  bgA = loadImage("ex2_A.png");
  bgB = loadImage("ex2_B.png");
  
  sf = new SoundFile(this, "ex2.mp3");
  sf.play();
  sf.loop();
  
  halfWidth = width/2;
  xA1 = width;
  xA2 = xA1 - halfWidth;
  xA3 = xA2 - halfWidth;
  xB1 = xA1;
  xB2 = xA2;
  xB3 = xA3;
  yB = height / 2;
  
  videoExport = new VideoExport(this);
  videoExport.setFrameRate(movieFPS);
  videoExport.setAudioFileName("../ex2.mp3");
  videoExport.startMovie(); 
}

void draw() {
  image(bgA, xA1, yA);
  image(bgA, xA2, yA);
  image(bgA, xA3, yA);
  xA1--; xA2--; xA3--;
  if (xA1 < halfWidth) {
    xA1 = width;
  }
  if (xA2 < halfWidth) {
    xA2 = xA1 - halfWidth;
  }
  if (xA3 < halfWidth) {
    xA3 = xA2 - halfWidth;
  }

  image(bgB, xB1, yB);
  image(bgB, xB2, yB);
  image(bgB, xB3, yB);
  xB1--; xB2--; xB3--;
  if (xB1 < halfWidth) {
    xB1 = width;
  }
  if (xB2 < halfWidth) {
    xB2 = xB1 - halfWidth;
  }
  if (xB3 < halfWidth) {
    xB3 = xB2 - halfWidth;
  }
  
  videoExport.saveFrame();
  
  if(frameCount > round(movieFPS * movieSEC)) {
    videoExport.endMovie();
    exit();
  }
}
