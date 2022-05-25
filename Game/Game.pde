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
  if (key==CODED){
    if(keyCode==UP){
      moveY=-1;
    }
    if(keyCode==DOWN){
      moveY=1;
    }
    if(keyCode==LEFT){
      moveX=-1;
    }
    if(keyCode==RIGHT){
      moveX=1;
    }
  }//else{
  //  moveX=0;
  //  moveY=0;
  //}
}
void keyReleased(){
   if (key==CODED){
    if(keyCode==UP){
      moveY=0;
    }
    if(keyCode==DOWN){
      moveY=0;
    }
    if(keyCode==LEFT){
      moveX=0;
    }
    if(keyCode==RIGHT){
      moveX=0;
    }
   }
}

void draw(){
  background(0);
  bm.move();
  bm.display();
  yoi.move();
  yoi.display();
  angle += 0.5;
}
