PImage img;

void setup() {
  size(900, 900, P2D);
  img = loadImage("../_data/jobs.jpg");
  img.resize(900, 0);
}

void draw() {
  background(0);
  noStroke();
  float margin = map(mouseX,0,width,5,100);
  //float margin = 25;
   
  
  for (int x = 0; x < width; x+=margin) {
    for (int y = 0; y < height; y+=margin) {
      int loc = x+y*width ;
      //float r = red(img.pixels[loc]) ;
      //float g = green(img.pixels[loc]) ;
      //float b = blue(img.pixels[loc]) ;

      color c = img.get(int(x), int(y));
      float size_ = map(brightness(c), 0, 255, -5, margin);
      //float br = brightness(c);
      //pixels[loc] = color(r,b,b);
      fill(c);
      square(x,y,size_);
      //noLoop();
      
    }
  }
  //updatePixels();
}
