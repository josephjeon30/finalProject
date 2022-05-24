BulletManager bm = new BulletManager();
float angle = 0;

void setup(){
  size(1000, 750);
  noStroke();
}

void keyPressed(){
  Shotgun sh = new Shotgun(30, 30, 5, 1, angle, 2 * PI/5);
  Shotgun sh2 = new Shotgun(width - 30, 30, 5, 1, -angle, 2 * PI/5);
}

void draw(){
  background(0);
  bm.move();
  bm.display();
  angle += 0.5;
}
