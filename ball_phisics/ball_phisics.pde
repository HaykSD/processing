///////////////////////////global vars
PVector b_pos, b_vel, gravity; 
Ball b ;

void setup() {
  size(1000, 500);
  
  gravity = new PVector(0,2);
  b_pos = new PVector(200,400);
  b_vel = new PVector(0, 0);
  b = new Ball(b_pos,b_vel);

}

void draw() {
  background(77);
  //b.vel.x = map(mouseX,0,width,-5,5);
  b.applyForce(gravity);
  
  println(gravity.y);
  b.update();
  b.show();
  b.edges();

}
