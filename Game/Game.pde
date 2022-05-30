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
int xbound=700;
int ybound=730;

Stage currentStage = new Stage(0);

boolean shooting = false;



Player yoi = new Player();

void setup(){
  size(1000, 750);
  noStroke();
  fill(128,0,0);
  rect(0,0,width, height);
}

void keyPressed(){
  if (!alive){
    if (key== 'r'){
      yoi = new Player();
      int x = currentStage.stagenum;
      currentStage = new Stage(x);
      bm = new BulletManager();
      alive = true;
    }
  }
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
  fill(0,0,0,110);
  rect(20,20,700, 710);
  bm.display();
  currentStage.processenemies();
  if (alive){
    bm.move();
    yoi.display();
    yoi.move();
    currentStage.spawn();
    //currentStage.proceed();
    bm.detectCollision();
    if (shooting){
      if (ticks % 5 == 0) yoi.shoot();
    }
  }
  checkStuff();
  ticks++;
  spawndelay++;
  //text(currentStage.stagenum,50,50);
  renderGUI();
}

void renderGUI(){
  fill(color(128, 0, 0));
  rect(0,0,20, height);
  rect(0,0,width, 20);
  rect(0,height-20,width, height);
  rect(720,0,width, height);  
  if (alive){
    fill(255);
    text("HP: "+yoi.HP,900,100);
  }else{
    fill(0,ticks);
    rect(20,20,700, 710);
    fill(255,ticks);
    text("thats unfortunate",320,320);
    text("press r to restart",321,340);
  }
  
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
