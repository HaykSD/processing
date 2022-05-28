PImage img;

void setup() {
  size(900, 900, P3D);
  img = loadImage("h.jpg");
  img.resize(900, 0);
}

void draw() {
  background(0);
  //fill(0);
  noStroke();
  //sphereDetail(7);
  //loadPixels();
  //float margin = map(mouseX,0,width,1,100);
  float margin = 20;

  translate(margin/2, margin/2);

  float diameter = margin;
  translate(width/2,height/2);
  //rotateY(radians(frameCount));
  
  
  for (int x = 0; x < width; x+=margin) {
    for (int y = 0; y < height; y+=margin) {
      //int loc = x+y*width ;
      //float r = red(img.pixels[loc]) ;
      //float g = green(img.pixels[loc]) ;
      //float b = blue(img.pixels[loc]) ;

      color c = img.get(int(x), int(y));
      //float br = map(brightness(c), 0, 255, 1, 0);
      //float br = brightness(c);
      //pixels[loc] = color(r,b,b);
      fill(c);
      push();
      translate(x/margin - width/2, y/margin - height/2);
      ellipse(x, y, diameter, diameter);
      pop();
      
    }
  }
  //updatePixels();
}
