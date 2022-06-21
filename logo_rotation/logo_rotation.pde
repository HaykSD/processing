PImage img;
float z_off=0;
void setup() {
  size(900, 900, P3D);
  img = loadImage("../_data/h4.jpg");
  img.resize(900, 900);
}

void draw() {
  background(#f1f1f1);
  fill(0);
  noStroke();
  sphereDetail(16);
  float tiles = map(mouseX, 0, width, 1, 250);
  float tileSize = width/tiles;
  push();
  translate(width/2, height/2);
  rotateY(radians(frameCount));
  float y_off = 0;
  for (int x = 0; x < tiles; x++) {
    float x_off= 0;
    for (int y = 0; y < tiles; y++) {
      color c = img.get(int(x*tileSize), int(y*tileSize));
      float b = map(brightness(c), 0, 255, 1, 0);
      //float z = map(b, 0, 1, 30, -30);
       float z = map(noise(x_off,y_off,z_off),0,1,-180,180);
       x_off+=2;

      push();
      fill(c);
      translate(x*tileSize - width/2, y*tileSize - height/2, z);
      //sphere(tileSize*b*0.95);
      if (b<0.25)
      sphere(tileSize);

      pop();
    }
    y_off+=2;
  }
  z_off+=0.051;
  pop();
}
