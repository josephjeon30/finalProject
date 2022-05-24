public static BulletManager bm;

void setup(){
  size(1000, 750);
  noStroke();
}

void keyPressed(){
   Shotgun sh = new Shotgun(width / 2, height/2, 80, 5, PI / 2, PI/40);
}

void draw(){
  background(0);
  bm.move();
  bm.display();
}
