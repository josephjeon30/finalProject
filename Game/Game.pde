BulletManager bm = new BulletManager();
float angle = 0;
boolean alive = true;
boolean bossisdead = false;

static int ticks = 0;

int moveX = 0;
int moveY = 0;
int up = 0;
int down = 0;
int left = 0;
int right = 0;


Stage currentStage = new Stage();

boolean shooting = false;



Player yoi = new Player();

void setup(){
  size(1000, 750);
  noCursor();
  noStroke();
}

/**
void mousePressed(){
  shooting = true;
}

void mouseReleased(){
  shooting = false;
}
**/

void keyPressed(){
  if (key == 'z'){
    shooting = !shooting;
  }
  if(key == 'w'){
    if(down != 0) down = 1;
    up += 2;
  }
  if(key == 's'){
    if(up != 0) up = 1;
    down += 2;
  }
  if(key == 'a'){
    if(right != 0) right = 1;
    left += 2;
  }
  if(key=='d'){
    if(left != 0) left=1;
    right += 2;
  }
  /**
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
  }**/
  
}

void keyReleased(){
  if(key=='w') up=0;
  if(key=='s') down=0;
  if(key=='a') left=0;
  if(key=='d') right=0;
  /**
  if (key==CODED){
    if(keyCode==UP) up=0;
    if(keyCode==DOWN) down=0;
    if(keyCode==LEFT) left=0;
    if(keyCode==RIGHT) right=0;
  }
  **/
}

void draw(){
  
  fill(color(0, 0, 0, 50));

  rect(0,0,width, height);
  bm.move();
  bm.display();
  yoi.move();
  yoi.display();
  
  currentStage.spawn();
  currentStage.processenemies();
  
  fill(color(255,0,0));
  ellipse(mouseX,mouseY,30,30);
  fill(color(255));
  ellipse(mouseX,mouseY,3,30);
  ellipse(mouseX,mouseY,30,3);
  ellipse(mouseX,mouseY,10,10);
  
  bm.detectCollision();
  
  if (shooting){
    if (ticks % 5 == 0) yoi.shoot();
  }
  
  
  checkStuff();
  ticks++;
}

public void checkStuff(){
  if(up>0||down>0){
  if(up>down){
    moveY=-5;
  }else if(down>up){
    moveY=5;
  }
  }else{
    moveY=0;

  }
  
  angle -= 0.7;
  
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
