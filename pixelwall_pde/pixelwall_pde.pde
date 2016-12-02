import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;
AniSequence seq;

Peeb[] guys;
int unit = 8;
int diameter;

void setup() {
  size(1920, 1080);
  frameRate(90);
  smooth();
  diameter = 100;

  Ani.init(this);

  int count = (width / unit) * (height / unit);
  guys = new Peeb[count];

  int index = 0;
  for (int y = 0; y < count / (width / unit); y++) {
    for (int x = 0; x < count / (height / unit); x++) {
      guys[index++] = new Peeb(x * unit, y * unit);
    }
  }
}

void draw() {
  background(255);
  colorMode(HSB);

  for (Peeb guy : guys) {
    guy.display();
  }

}

class Peeb {
  float seed, sizeX, sizeY, posX, posY;
  int[] clr = {int(random(50, 250)), int(random(200)), int(random(200))};
  int moveLimit = 10;
  Ani posYAni;
  Ani sizeYAni; 

  Peeb(int _posX, int _posY) {
    seed = random(1000, 10000);
    sizeX = seed / 150;
    sizeY = seed / 120;
    posX = _posX;
    posY = _posY;

    posYAni = new Ani(this, random(3,8), random(0, 2), "posY", this.posY - moveLimit, Ani.QUAD_IN_OUT);
    posYAni.setPlayMode(Ani.YOYO);
    posYAni.repeat();

    sizeYAni = new Ani(this, random(2,7), random(0, 1.0), "sizeY", this.sizeY - moveLimit + 5, Ani.QUAD_IN_OUT);
    sizeYAni.setPlayMode(Ani.YOYO);
    sizeYAni.repeat();
  }

  void display() {
    noStroke();
    fill(this.clr[0], this.clr[1], this.clr[2]);
    rect(this.posX, this.posY, this.sizeX, this.sizeY);
  }

}