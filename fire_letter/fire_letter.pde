///////////////////////////global vars

float br_radius = 160;
PImage img_letter, img_texture;
ArrayList<Fire> fires = new ArrayList<Fire>();
PVector b_pos, b_vel, wind;

void setup() {
  size(1000, 1000,P2D);
  frameRate(60);
  img_letter = loadImage("g.jpg");
  img_letter.resize(width, height);
  img_texture = loadImage("texture.png");
  img_texture.resize(35, 52);
}

void mouseWheel(MouseEvent event) {
  //println(event.getCount());
  br_radius-=event.getCount()*5;
}

void draw() {
  clear();
  background(27);
  blendMode(ADD);
  float yoff = 0;
  for (int y=0; y<1000; y+=14) {
    float xoff = 0;
    for (int x=0; x<1000; x+=30) {
      color c = img_letter.get(int(x), int(y));
      float br = brightness(c);
      //println(map(mouseX,0,width,0,255));
      if (br>br_radius) {
        b_pos = new PVector(x, y);
        //b_vel = new PVector(random(-random(2, 5), random(2, 5)), -1);
        b_vel = new PVector(random(-random(2, 5), random(2, 5)), random(-1, 1));
        Fire b = new Fire(b_pos, b_vel, color(c), br);
        
        float k = radians(frameCount);
        PVector random_wind = new PVector(map(sin(k)*pow(cos(0.75*random(-4,6)*k),4),-1,1,-random(8),random(8)),0);
        b.applyForce(random_wind);
        //drawVector(random_wind, new PVector(80, 140), 10);

        b.applyForce(new PVector(map(noise(xoff, yoff), 0, 1, -2, 2), map(noise(xoff+1234, yoff+1234), 0, 1, -3, 2)));
        if (mousePressed) {
          wind = new PVector(map(mouseX, 0, width, -4, 4), map(mouseY, 0, height, -4, 4));
          b.applyForce(wind);
          drawVector(wind, new PVector(70, 140), 10);
        }

        fires.add(b);

        xoff+=0.01;
      }
      yoff+=0.02;
    }
  }



  for (int i=0; i<fires.size(); i++) {
    if (fires.get(i).lifetime < 0) fires.remove(i);
  }

  for (Fire fire : fires) {
    fire.update();
    fire.show();
  }


  //saveFrame("out_images/img-######.tga");
  show_FPS();
}


void show_FPS() {
  push();
  textSize(25);
  String s = "frameRate = "+int(frameRate);
  fill(200);
  text(s, 5, 32, 500, 300);
  text("brightness_R = "+br_radius, 5, 57, 300, 300);
  pop();
}

void drawVector(PVector v, PVector pos, float scayl) {
  pushMatrix();
  float arrowsize = 7;
  // Translate to position to render vector
  translate(pos.x, pos.y);
  stroke(0, 250, 2);
  strokeWeight(3);
  // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
  rotate(v.heading2D());
  // Calculate length of vector & scale it to be bigger or smaller if necessary
  float len = v.mag()*scayl;
  // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
  line(0, 0, len, 0);
  line(len, 0, len-arrowsize, +arrowsize/2);
  line(len, 0, len-arrowsize, -arrowsize/2);
  popMatrix();
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
