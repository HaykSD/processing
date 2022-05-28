PVector p;
float angle = 0;
float r = 50;
PVector m;

void setup() {
  size(600, 500);
  p = new PVector(0,0);
  m = new PVector(0, 0);
  translate(300, 250);
}


void draw() {
  m.x=mouseX-300;
  m.y=mouseY-250;
  
  background(49);
  noFill();
  stroke(15,180,22);
  translate(300, 250);
  circle(0, 0, r*2);
  
  
  circle(m.x,m.y,22);
  //strokeWeight(71);
  fill(15, 180, 88);
  circle(p.x, p.y, r*0.5);
  p.x=sin(angle)*r;
  p.y=cos(angle)*r;
  angle = PI*0.25;
  //angle +=0.05;
}
