Shotgun sh;

void setup(){
  size(1000, 750);
  noStroke();
  sh = new Shotgun(width / 2, height/2, 40, 5, PI / 2, PI/36);
}

void keyPressed(){
  sh = new Shotgun(width / 2, height/2, 40, 5, PI / 2, PI/36);
}

void draw(){
  background(255);
  for (Bullet b: sh.bullets){
    b.move();
    b.display();
  }
}
