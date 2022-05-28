///////////////////////////global vars
System s;
ArrayList<Fire> Fires = new ArrayList<Fire>();
PImage img;

void setup() {
  size(900, 900, P2D);
  frameRate(70);
  s = new System();
  img = loadImage("texture32.png");
  img.resize(140, 170);
}


//void mouseWheel(MouseEvent event) {
//  //println(event.getCount());
//  radius_of_visibility-=event.getCount()*0.005;
//}

void draw() {
  //background(27);
  clear();
  background(0);
  blendMode(ADD);
  //img.resize(mouseY/6, mouseY/6+40);

  //println(frameRate);

  if (mousePressed) {
    for (int i=0; i<4; i++) {
      s.add_new_Fire(Fires,
        //new PVector(450, 800), //pos
        new PVector(mouseX, mouseY), //pos

        //new PVector(0,0),
        new PVector(random(-random(2, 5), random(2, 5)), -2), //vel
        new PVector(random(-2.4, 2.4), -random(3, 12)), //force
        floor(random(6, 7)), //size
        color(random(140, 255), random(0, 100), random(0, 50), 255),
        random(150, 200)  //liftime
        );
    }
  }


  s.draw_objects(Fires);
  s.remove_old_Fires(Fires);

  //saveFrame("out_images/img-######.png");



  s.show_FPS();
  s.show_particles_count();
}
