PImage img, imgt;
float e;


void setup() {
  size(300, 291);
  img = loadImage("fox.jpg");
  //imgt = loadImage("f.jpg");
  e = 0;
}

void mouseWheel(MouseEvent event) {
  e += event.getCount();
  //println(e);
}

void draw() {

  loadPixels();
  image(img, 0, 0);
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      int loc = x+y*width ;
      float r = red(img.pixels[loc]) ;
      float g = green(img.pixels[loc]) ;
      float b = blue(img.pixels[loc]) ;
      //float d = dist(x,y,mouseX,mouseY)/map(mouseY,0,291,5,0.01);
      float d = dist(x, y, mouseX, mouseY)/e*10;
      pixels[loc] = color(r-d, g-d, b-d);
    }
  }
  updatePixels();
}
