class System {
  PVector b_pos, b_vel, gravity;
  int v_range;
  int balls_count;


  System(int balls_count_, int v_range_) {
    balls_count=balls_count_;
    v_range = v_range_;
  }





  ArrayList<Ball> make_particle_list() {
    ArrayList<Ball> balls = new ArrayList<Ball>();

    for (int i=0; i<balls_count; i++) {
      b_pos = new PVector(random(width), random(height));
      b_vel = new PVector(random(-v_range, v_range), random(-v_range, v_range));
      //Ball b = new Ball(b_pos, b_vel, floor(random(10, 20)), color(random(0, 100), random(100, 255), random(100, 240), 255));
       Ball b = new Ball(b_pos, b_vel, floor(random(10, 20)), color(192,192,192));

      //b.acc = new PVector(-0.01,0.04);
      balls.add(b);
    }
    return balls;
  }



  void add_new_ball(ArrayList<Ball> balls, PVector pos, PVector vel) {
    //Ball b = new Ball(pos, vel, floor(random(10, 20)), color(random(0, 100), random(100, 255), random(100, 240), 255));
    Ball b = new Ball(pos, vel, floor(random(10, 20)), color(192,192,192));
    balls.add(b);
  }
  
  
  
  
  
  void draw_lines(ArrayList<Ball> balls, float radius_of_visibility) {

    for (int i=0; i<balls.size(); i++) {
      for (int j=0; j<i; j++) {
        Ball i_ball = balls.get(i);
        Ball j_ball = balls.get(j);
        float d = dist(i_ball.pos.x, i_ball.pos.y, j_ball.pos.x, j_ball.pos.y);
        //println(d);
        //float max_dist = pow((pow(width,2) + pow(height,2) ),0.5);
        float max_dist = dist(0, 0, width, height)*radius_of_visibility;

        if (d<max_dist) {
          stroke(150, map(d, 0, max_dist, 255, 150), 150);
          strokeWeight(map(d, 0, max_dist, 8, 0));
        } else {
          noStroke();
        }
        //println(map(d,0,max_dist/2,5,1));
        line(i_ball.pos.x, i_ball.pos.y, j_ball.pos.x, j_ball.pos.y);
        //vertex(i_ball.pos.x,i_ball.pos.y);
      }
    }
    //endShape(CLOSE);
  }







  void draw_objects(ArrayList<Ball> balls) {
    for (Ball ball : balls) {
      ball.update();
      ball.show();
      //ball.edges();
      ball.edges_bounce();
    }
  }

  void show_FPS() {
    push();
    textSize(25);
    String s = "frameRate = "+round(frameRate*10)/10;
    fill(200);
    text(s, 5, 5, 300, 300);
    pop();
  }
  void show_radius_of_visibility_and_particles() {
    push();
    textSize(25);
    String s = "radius of visibility*1000 = "+round(radius_of_visibility*1000);
    fill(200);
    text(s, 5, 32, 500, 300);
    text("particles = "+balls.size(), 5, 57, 300, 300);
    pop();
  }
}
