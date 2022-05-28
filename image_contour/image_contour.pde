PImage img;

void setup() {
  img = loadImage("../_data/jobs.jpg");
  size(600, 500);
}

//void mouseWheel(MouseEvent event) {
//  e += event.getCount();
//  //println(e);
//}

void draw() {
  background(0);
  loadPixels();
  float shift = mouseY;
  //image(img, 0, 0);
  for (int x=0; x<width-shift; x++) {
    for (int y=0; y<height-shift; y++) {
      int loc = y*width + x ;
      //float r = red(img.pixels[loc]) ;
      //float g = green(img.pixels[loc]) ;
      //float b = blue(img.pixels[loc]) ;
      color first = img.get(int(x), int(y));
      color second = img.get(int(x+shift), int(y+shift));
      //if (brightness(first)>map(mouseX,0,width,0,255)) {

      if ( abs(brightness(first)-brightness(second))<mouseX) {

        pixels[loc] = color(255);
        //break;
      }

      //println(brightness(loc));
      //if (abs(img.get(int(x), int(y)) - img.get(int(x), int(y+1)))>0) {
      //img.pixels[y*width + x] = 0;
      //}
    }
  }
  updatePixels();
}
