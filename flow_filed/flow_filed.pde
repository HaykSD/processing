float zoff=0;



void setup() {
  size(900, 900);
}

void draw() {
  background(#f1f1f1);
  float scl = map(mouseX, 0, width, 1, 150);
  int col = int(width/scl);
  int row = int(height/scl);


  float noise_step = map(mouseY, 0, height, 0.002, 1);
  float yoff=0;
  for (int y = 0; y < col; y++) {
    float xoff=0;
    for (int x = 0; x < row; x++) {
      color c= int(map(noise(xoff, yoff, zoff), 0, 1, 0, 255));
      stroke(c/2, c*1.4, c*1.2);
      strokeWeight(4);
      push();
      translate(x*scl, y*scl);
      rotate(map(noise(xoff, yoff, zoff), 0, 1, -TWO_PI, TWO_PI));
      line(0, 0, scl, 0);
      xoff+=noise_step;
      pop();
    }
    yoff+=noise_step;
  }
  zoff+=noise_step/10;
}
