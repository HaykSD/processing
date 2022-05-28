class Ball { 
  PVector pos, vel, acc;
  float d,mass;
  color col;
  float vel_loss = 1; //1 is no loss 0 is loss all velocity
  
  Ball (PVector position, PVector velocity,int diameter ,color color_) {  
    pos = position;
    vel = velocity;
    acc = new PVector(0,0);
    d = diameter;
    mass = 2;
    col=color_;
  }
  
  void applyՀամազորForce(PVector Համազորforce){
    
    Համազորforce.mult(mass);//because force.div(mass) is changes force itself
    acc = Համազորforce.div(mass);
  }
  
  void edges_bounce(){
    if (pos.x > width-d/2 ) {pos.x = width-d/2;vel.x = -vel.x*vel_loss;}
    if (pos.y > height-d/2 ) {pos.y = height-d/2;vel.y = -vel.y*vel_loss;}
    if (pos.x < d/2 ) {pos.x = d/2;vel.x = -vel.x*vel_loss;}
    if (pos.y < d/2 ) {pos.y = d/2; vel.y = -vel.y*vel_loss;}
  }
  
  void edges(){
    if (pos.x > width+d/2 ) pos.x = 0;
    if (pos.y > height+d/2) pos.y = 0;
    if (pos.x < -d/2 ) pos.x = width;
    if (pos.y < -d/2 ) pos.y = height;
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    
  }
  
  void show(){
    push();
    shapeMode(CENTER);
    noStroke();
        //stroke(255);
    fill(col);
        //noFill();
    ellipse(pos.x,pos.y,d,d);
    pop();
  }
} 
