Mover car;

void setup(){
  size(800,600);
  car = new Mover(width/2, height/2, 10);
}

void keyPressed(){
  if (key == CODED){
    PVector cv = car.speed.copy().normalize().mult(20);
    if (keyCode == LEFT)
      car.applyForce(cv.rotate(-PI/2));
    if (keyCode == RIGHT)
      car.applyForce(cv.rotate(PI/2));
    if (keyCode == UP)
      car.applyForce(cv);
    if (keyCode == DOWN)
      car.applyForce(cv.rotate(PI));
  }
}


void draw(){
  background(255,255,255);
  car.checkEdges();
  car.move();
  car.draw();
}