BulletManager bm = new BulletManager();
float angle = 0;
boolean alive = true;
Stage currentStage;

Player yoi = new Player();

void setup(){
  size(1000, 750);
  noStroke();
}

void keyPressed(){

  //Shotgun sh = new Shotgun(width/2, height/2, 5, 2, angle, 2 * PI/5);
  //Shotgun sh2 = new Shotgun(width/2, height/2, 5, 2, -angle, 2 * PI/5);
  //yoi.shoot();
  
  if (key==CODED){
    if(keyCode==UP) {
      yoi.dy = -1;
    }
    if(keyCode==DOWN) {
      yoi.dy = 1;
    }
    if(keyCode==LEFT){
      yoi.dx = -1;
    }
    if(keyCode==RIGHT){
      yoi.dx = 1;
    }
  }
}
void keyReleased(){
  if (key == CODED){
    if(keyCode==UP){
      yoi.dy = 0;
    }
    if(keyCode==DOWN){
      yoi.dy = 0;
    }
    if(keyCode==LEFT){
      yoi.dx = 0;
    }
    if(keyCode==RIGHT){
      yoi.dx = 0;
    }
  }
}

void draw(){
  
  fill(color(0, 0, 0, 50));
  rect(0,0,width, height);
  
  yoi.move();
  yoi.display();
  
  bm.move();
  bm.display();
  
  angle += 0.01;    
    
}

  
