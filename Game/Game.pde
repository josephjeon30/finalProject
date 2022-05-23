Bullet b;

void setup(){
  size(1000, 750);
  noStroke();
  b = new Bullet();
}

void keyPressed(){
  
}

void draw(){
  background(255);
  b.move();
  b.display();
}
