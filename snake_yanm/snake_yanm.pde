int snake_size = 25;
PVector pos = new PVector(random(900), random(900));
PVector speed = new PVector(0, 0);
PVector new_pos = new PVector(pos.x, pos.y);

void setup() {
  size(900, 900);
  frameRate(70);
    background(51);

}

void keyPressed() {
  if (key == CODED) {
    //speed.mult(0);
    if (keyCode == UP) {
      speed.x=0;
      speed.y=-1;
    } else if (keyCode == DOWN) {
      speed.x=0;
      speed.y=1;
    } else if (keyCode == LEFT) {
      speed.y=0;
      speed.x=-1;
    } else if (keyCode == RIGHT) {
      speed.y=0;
      speed.x=1;
    }
  }
}

void draw() {
  new_pos.x+=speed.x;
  new_pos.y+=speed.y;
  
  println(int(new_pos.x));
  if (int(new_pos.x) % snake_size == 0) {
    pos.x = new_pos.x;
  }
  if (int(new_pos.y) % snake_size == 0) {
    pos.y = new_pos.y;
  }
  rect(pos.x, pos.y, snake_size, snake_size, 10);
}
