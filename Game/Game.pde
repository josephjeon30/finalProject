BulletManager bm = new BulletManager();
float angle = 0;
boolean alive = true;
boolean bossisdead = false;

int moveX = 0;
int moveY = 0;
int up = 0;
int down = 0;
int left = 0;
int right = 0;

Stage currentStage;

Player yoi = new Player();
Enemy egg=new fairy(80,500,20);

void setup(){
  size(1000, 750);
  noStroke();
}

void keyPressed(){
  if (key == CODED){
    if(keyCode == UP){
      if(down != 0) down = 1;
      up += 2;
    }
    if(keyCode == DOWN){
      if(up != 0) up = 1;
      down += 2;
    }
    if(keyCode == LEFT){
      if(right != 0) right = 1;
      left += 2;
    }
    if(keyCode==RIGHT){
      if(left != 0) left=1;
      right += 2;
    }
  }
}

void keyReleased(){
  if (key==CODED){
    if(keyCode==UP) up=0;
    if(keyCode==DOWN) down=0;
    if(keyCode==LEFT) left=0;
    if(keyCode==RIGHT) right=0;
  }
}

void draw(){
  
  fill(color(0, 0, 0, 50));
  rect(0,0,width, height);
  
  yoi.move();
  yoi.display();
  
  egg.display();
  egg.shoot();
  egg.move();
  bm.move();
  bm.display();

  if(keyPressed){
    //Shotgun sh = new Shotgun(width/2, height/2, 5, 2, angle, 2 * PI/5);
    //Shotgun sh2 = new Shotgun(width/2, height/2, 5, 2, -angle, 2 * PI/5);
    yoi.shoot();
  }
  
  angle += 0.01;
  if(up>0||down>0){
    if(up>down){
      moveY=-5;
    }else if(down>up){
      moveY=5;
    }
  }else{
    moveY=0;
  }

  
  if(keyPressed){
    //Shotgun sh = new Shotgun(width/2, height/2, 5, 2, angle, 2 * PI/5);
    //Shotgun sh2 = new Shotgun(width/2, height/2, 5, 2, -angle, 2 * PI/5);
    yoi.shoot();
  }
  
  angle -= 5;
  if(up > 0 || down > 0){
    if(up > down) moveY = -5;
    else if(down>up) moveY = 5;
  }
  else moveY=0;
  if(left>0 || right>0){
    if(left > right) moveX=-5;
    else if(right > left) moveX = 5;
  }
  else moveX = 0;   
}
