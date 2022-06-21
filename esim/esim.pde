// ############
// mouse wheel 
// ############
float stroke_w;
float e; //mouse whell 
float x,y,R;

void setup() {
  size(500, 500);
  stroke_w = 20;

}

void mouseWheel(MouseEvent event) {
  e = event.getCount();
  //down is +
  if (e<0){
  stroke_w +=2;
  }else if (stroke_w > 3){
  stroke_w -=2;
  }
  
  
  //println(e);
}

void draw() {
  
  background(27,27,27,10);
  translate(width/2,height/2);
  noFill();
  vertexCircle(map(mouseY,0,height, 3, 0.005));
  strokeWeight(stroke_w);
  R=map(mouseX,0,width,0,255);
  stroke(map(stroke_w,0,50,0,255),R,map(mouseY,0,width,0,255));

  
  //k=map(mouseX,0,width,0,255);

}


void vertexCircle(float angle_inc){
  beginShape();
  for (float angle = 0; angle<TWO_PI; angle+=angle_inc){
    x = R*cos(angle);
    y = R*sin(angle);
    vertex(x,y);
  }
  endShape(CLOSE);
  
}
