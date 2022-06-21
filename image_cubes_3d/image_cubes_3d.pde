PImage img;
float step = 3;
float noise_off = 0;

void setup() {
  size(600, 500, P3D);
  img = loadImage("../_data/jobs.jpg");
  //img.resize(600, 0);
  loadPixels();
}

void mouseWheel(MouseEvent event) {
  
  step += event.getCount();
  //println(e);
  if (step<1) step = 1;
}

void draw() {
  background(22,
    map(mouseY, 0, height, 70, 250),
    map(mouseY, 0, height, 30, 100));

  for (int x=0; x<width; x+=step) {
    for (int y=0; y<height; y+=step) {
      int loc = x+y*width ;
      float r = red(img.pixels[loc]) ;
      float g = green(img.pixels[loc]) ;
      float b = blue(img.pixels[loc]) ;
      b = brightness(color(r, g, b));
      noStroke();

      if (b<253) {
        //float n = map(noise(noise_off), 0, 1, 100, 200);
        //println(n);

        push();
        fill(r, g, b);
        translate(x, y);
        //rotateY(map(mouseY, 0, width, 0, PI));
        //rotateZ(map(mouseY, 0, width, 0, PI));
        //rotateX(map(mouseY, 0, height, 0, PI));


        rotateZ(map(b, 0, 255, HALF_PI, -HALF_PI));

        rotateY(map(b, 0, 255, HALF_PI, -HALF_PI));


        box(20, 12, 2);
        pop();
      }
    }
    noise_off+=0.001;
  }
  //noise_off+=0.1;
  //updatePixels();
}
