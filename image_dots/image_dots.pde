PImage img;
float step = 7;
float noise_off = 0;

void setup() {
  size(600, 500);
  img = loadImage("../_data/jobs.jpg");
  loadPixels();
}

void mouseWheel(MouseEvent event) {
  step += event.getCount();
  //println(e);
}

void draw() {
  background(map(mouseY, 0, height, 110, 255),
    map(mouseY, 0, height, 70, 250),
    map(mouseY, 0, height, 30, 70));

  for (int x=0; x<width; x+=step) {
    for (int y=0; y<height; y+=step) {
      int loc = x+y*width ;
      float r = red(img.pixels[loc]) ;
      float g = green(img.pixels[loc]) ;
      float b = blue(img.pixels[loc]) ;
      b =brightness(color(r, g, b));
      //noStroke();

      if (b<map(mouseX, 0, width, 0, 260)) {
        float n = map(noise(noise_off), 0, 1, 100, 200);
        //println(n);
        fill(r, g, b, n);
        circle(x, y, step);
        //}else{
        //          fill(0,77);
        //  square(x, y, step);
      }

      //println(map(mouseX, 0, width, 0.1, 0.9));
    }
    noise_off+=0.001;
  }
  //noise_off+=0.1;
  //updatePixels();
}
