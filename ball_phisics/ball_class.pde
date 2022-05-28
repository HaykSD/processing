class Ball { 
  PVector pos, vel, acc;
  float d,mass;
  
  Ball (PVector position, PVector velocity) {  
    pos = position; 
    vel = velocity;
    acc = new PVector(0,0);
    d = 40;
    mass = 2;
  }
  
  void applyForce(PVector force){
    force.mult(mass);//because force.div(mass) is changes force itself
    acc = force.div(mass);
  }
  
  void edges(){
    if (pos.x > width-d/2 ) {pos.x = width-d/2;vel.x = -vel.x*0.99;}
    if (pos.y > height-d/2 ) {pos.y = height-d/2;vel.y = -vel.y*0.99;}
    if (pos.x < d/2 ) {pos.x = d/2;vel.x = -vel.x*0.99;}
    if (pos.y < d/2 ) {pos.y = d/2; vel.y = -vel.y*0.99;}
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    
  }
  
  void show(){
    circle(pos.x,pos.y,d);
  }
} 
