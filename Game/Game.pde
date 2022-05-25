BulletManager bm = new BulletManager();
float angle = 0;

void setup(){
  size(1000, 750);
  noStroke();
}

void keyPressed(){
  Shotgun sh = new Shotgun(width/2, height/2, 5, 2, angle, 2 * PI/5);
  Shotgun sh2 = new Shotgun(width/2, height/2, 5, 2, -angle, 2 * PI/5);
}

void draw(){
  fill(color(0, 0, 0, 100));
  rect(0,0,width, height);
  bm.move();
  bm.display();
  angle += 0.05;
  float k = mouseX;
  if (k == 0) k = 0.001;
  
}
