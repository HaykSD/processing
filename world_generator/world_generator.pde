float z = 0;


void setup() {
  size(900, 900);
  //rectMode(CENTER);
  noStroke();

}

void draw() {
  float scl = map(mouseX, 0, width, 0.001, 0.03);
  float margin = map(mouseY, 0, height, 1, 30);
  background(51);
  for (int x=0; x<width; x+=margin) {
    for (int y=0; y<height; y+=margin) {
      float n = noise(x*scl, y*scl, z*scl);
      if (n >0.2)
        fill(0,80, 180);
      if (n >0.4)
        fill(87, 70, 10);
      if (n >0.7)
        fill(20, 220, 30);
      square(x, y, margin);
    }
  }
  z+=0.1;
}
