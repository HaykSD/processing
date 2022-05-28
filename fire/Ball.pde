class Fire {
  PVector pos, vel, acc;
  float d, mass, lifetime;
  color col;

  Fire (PVector position, PVector velocity, int diameter, color color_, float lifetime_) {
    pos = position;
    vel = velocity;
    acc = new PVector(0, 0);
    d = diameter;
    mass = 2;
    col=color_;
    lifetime = lifetime_;
  }

  void applyForce(PVector force) {
    acc = force;
  }


  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    lifetime -=random(1,5.2);
  }

  void show() {
    push();
    shapeMode(CENTER);
    noStroke();
    //stroke(255);
    imageMode(CENTER);
    tint(random(210,255),random(40,77),random(50), lifetime);
    image(img, pos.x, pos.y);

    //fill(col, lifetime*2);
    //noFill();
    //ellipse(pos.x, pos.y, d, d);
    pop();
  }

  void edges_bounce() {
    if (pos.x > width-d/2 ) {
      pos.x = width-d/2;
      vel.x = -vel.x*0.99;
    }
    if (pos.y > height-d/2 ) {
      pos.y = height-d/2;
      vel.y = -vel.y*0.99;
    }
    if (pos.x < d/2 ) {
      pos.x = d/2;
      vel.x = -vel.x*0.99;
    }
    if (pos.y < d/2 ) {
      pos.y = d/2;
      vel.y = -vel.y*0.99;
    }
  }

  void edges() {
    if (pos.x > width+d/2 ) pos.x = 0;
    if (pos.y > height+d/2) pos.y = 0;
    if (pos.x < -d/2 ) pos.x = width;
    if (pos.y < -d/2 ) pos.y = height;
  }
}
