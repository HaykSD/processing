 float n =0;
PImage img;
float count = 15;
float e;

void setup() {
  size(900, 900);
  img = loadImage("../_data/h4.jpg");
  img.resize(900, 0);
  //rectMode(CENTER);
}
void mouseWheel(MouseEvent event) {
  e = event.getCount();
  //down is +
  if (e<0) {
    count +=1;
  } else if (count > 2) {
    count -=1;
  }
}

void drawCircle(float R, float incremet, float f, float m ) {
  beginShape();
 
  for (float a=0; a<TWO_PI; a+=incremet) {
    float pn=map(noise(R*(cos(a)+R),R*(sin(a)+R),n),0,1,-R/5,R/5);
    
    float y = (R+pn)*sin(a)+m;
    float x = (R+pn)*cos(a)+f;

    color c = img.get(int(x), int(y));

    stroke(c);
    fill(c);
    if (brightness(c) > 100)
      circle(x, y, 3);
    else circle(x, y, 0.7);
    n+=0.0001;
  }
  endShape();
}


void draw() {

  background(51);
  //strokeWeight(2);

  //noFill();
  //fill(200, 0, 0);
  //float r = mouseX/3;
  //color c = img.get(int(mouseX), int(mouseY));
  //println(brightness(c));
  for (int r=0; r<700; r+=count) {
    drawCircle(r, 0.070, mouseX, mouseY);
  }
}

void keyReleased() {
  if (key == 's') {
    save("h_new.jpg");
  }
}
