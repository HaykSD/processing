class System {
  PVector b_pos, b_vel, gravity;
  int v_range;
  int Fires_count;


  //System(int Fires_count_, int v_range_) {
  //  Fires_count=Fires_count_;
  //  v_range = v_range_;
  //}


  //ArrayList<Fire> make_particle_list() {
  //  ArrayList<Fire> Fires = new ArrayList<Fire>();
  //  for (int i=0; i<Fires_count; i++) {
  //    b_pos = new PVector(random(width), random(height));
  //    b_vel = new PVector(random(-v_range, v_range), random(-v_range, v_range));
  //    Fire b = new Fire(b_pos, b_vel, floor(random(10, 20)), color(random(0, 100), random(100, 255), random(100, 240), 255));
  //    //b.acc = new PVector(-0.01,0.04);
  //    Fires.add(b);
  //  }
  //  return Fires;
  //}



  void add_new_Fire(ArrayList<Fire> Fires, PVector pos, PVector vel,PVector force,int diameter,color col,float lifetime) {
    Fire b = new Fire(pos, vel, diameter, col,lifetime);
    b.applyForce(force);
    Fires.add(b);
  }
  
  void remove_old_Fires(ArrayList<Fire> Fires) {
    for (int i=0; i<Fires.size(); i++) {
      if (Fires.get(i).lifetime < 0) Fires.remove(i);
    }
  }


  void draw_objects(ArrayList<Fire> Fires) {
    for (Fire Fire : Fires) {
      Fire.update();
      Fire.show();
      //Fire.edges();
      //Fire.edges_bounce();
    }
  }



  void show_FPS() {
    push();
    textSize(25);
    String s = "frameRate = "+round(frameRate*10)/10;
    fill(200);
    text(s, 5,5, 300, 300);
    pop();
  }
  
  
  
  void show_particles_count() {
    push();
    textSize(25);
    fill(200);
    text("particles = "+Fires.size(), 5,32, 300, 300);
    pop();
  }
}
