class Mover {
  PVector location;
  PVector speed;
  PVector acceleration;
  float mass;
  float size = 20;
  float angle;
  float angularAcceleration;
  float angularVelocity;
  float maxspeed = 20;

  Mover(float x, float y, float m) {
    location = new PVector(x,y);
    speed = new PVector(5,2);
    acceleration = new PVector();
    mass = m;
  }

  void applyForce(PVector force) {
    PVector f = force.copy().div(mass);
    acceleration.add(f.div(mass));
  }
  
  void checkEdges(){
      if (location.x < 0){
         speed.x *= -1;
         location.x = 0; 
      }else
      if (location.x > width){
         speed.x *= -1;
         location.x = width;
      }
      if (location.y < 0){
         speed.y *= -1;
         location.y = 0; 
      }else
      if (location.y > height){
         speed.y *= -1;
         location.y = height;
      }
  }
  
  void move(){
    speed.add(acceleration);
    location.add(speed.limit(maxspeed));
    acceleration.mult(0);
  }

  void draw() {
    fill(255);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    float a = speed.heading();
    rotate(a);
    rect(-(size/2), -(size/2), size, size);
    rect(size/2, -size/2+4, 10, size - 8);
    popMatrix();
  }
}