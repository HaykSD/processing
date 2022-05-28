class Fire {
  PVector pos, vel, acc;
  float  mass, lifetime;
  color col;

  Fire (PVector position, PVector velocity, color color_, float lifetime_) {
    pos = position;
    vel = velocity;
    acc = new PVector(0, 0);
    mass = 2;
    col=color_;
    lifetime = lifetime_;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }


  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    lifetime -=random(random(4, 7), 11);
        //lifetime -=5;

  }

  void show() {
    push();
    imageMode(CENTER);
    //tint(random(250, 255), random(40, 90), random(50), lifetime);
    tint(col, lifetime);
        //tint(187, lifetime);

    //ellipse(pos.x, pos.y,5,5);

    image(img_texture, pos.x, pos.y);
    pop();
  }
}
