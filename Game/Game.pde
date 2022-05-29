BulletManager bm = new BulletManager();
float angle = 0;
boolean alive = true;
//boolean bossisdead = false;

static int ticks = 0;
static int spawndelay = 0;

int moveX = 0;
int moveY = 0;
int up = 0;
int down = 0;
int left = 0;
int right = 0;


Stage currentStage = new Stage(0);

boolean shooting = false;



Player yoi = new Player();

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
  if (key == 'z'){
    shooting = true;
  }
}

void keyReleased(){
  if (key==CODED){
    if(keyCode==UP) up=0;
    if(keyCode==DOWN) down=0;
    if(keyCode==LEFT) left=0;
    if(keyCode==RIGHT) right=0;
  }
  if (key == 'z'){
    shooting = false;
  }
}

void draw(){  
  fill(color(0, 0, 0, 100));
  rect(0,0,width, height);
  bm.move();
  bm.display();
  yoi.move();
  yoi.display();
  
  currentStage.spawn();
  currentStage.processenemies();
  //currentStage.proceed();
  bm.detectCollision();
  if (shooting){
    if (ticks % 5 == 0) yoi.shoot();
  }
  checkStuff();
  ticks++;
  spawndelay++;
  text(currentStage.stagenum,50,50);
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
