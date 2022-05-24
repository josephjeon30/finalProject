Shotgun sh;

void setup(){
  size(1000, 750);
  noStroke();
  sh = new Shotgun(width / 2, height / 2, 80, 5, PI / 2, PI/40);
}

void keyPressed(){
  sh = new Shotgun(width / 2, height/2, 80, 5, PI / 2, PI/40);
}

void draw(){
  background(0);
  for (Bullet b: sh.bullets){
    b.move();
    b.display();
  }
}
