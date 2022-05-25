BulletManager bm = new BulletManager();
float angle = 0;
boolean alive = true;
Stage currentstage;
int moveX=0;
int moveY=0;
Player yoi=new Player();
Boss current;

void setup(){
  size(1000, 750);
  noStroke();
}

void keyPressed(){
  Shotgun sh = new Shotgun(30, 30, 5, 1, angle, 2 * PI/5);
  Shotgun sh2 = new Shotgun(width - 30, 30, 5, 1, -angle, 2 * PI/5);
  yoi.shoot();
}

void draw(){
  background(0);
  bm.move();
  bm.display();
  yoi.move();
  yoi.display();
  angle += 0.5;
}
