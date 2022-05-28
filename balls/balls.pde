///////////////////////////global vars
System s;
ArrayList<Ball> balls ;
int count = 120;
int v_range = 3;
float radius_of_visibility = 0.06;//0.12 is norm

void setup() {
  size(1800, 900);
  frameRate(70);
  s = new System(count, v_range);
  balls = s.make_particle_list();
}

//void mouseReleased(MouseEvent event) {
//  //println(event);
//  s.add_new_ball(balls);
//}

void mouseWheel(MouseEvent event) {
  //println(event.getCount());
  radius_of_visibility-=event.getCount()*0.005;
}

void draw() {
  background(27);
  //println(frameRate);
  //radius_of_visibility = map(mouseX,0,width,0.05,0.2);
  if (mousePressed) s.add_new_ball(balls,new PVector(mouseX, mouseY), new PVector(random(-v_range, v_range), random(-v_range, v_range)));
  s.draw_lines(balls, radius_of_visibility);
  s.draw_objects(balls);
  //saveFrame("out_images/img-######.png");
  s.show_FPS();
  s.show_radius_of_visibility_and_particles();
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
