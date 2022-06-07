BulletManager bm = new BulletManager();
float angle = 0;
boolean alive = true;
boolean gamestart = false;
PImage egg;

static int ticks = 0;
static int spawndelay = 0;
boolean focus = false;
int moveX = 0;
int moveY = 0;
int up = 0;
int down = 0;
int left = 0;
int right = 0;
int xbound=700;
int ybound=730;

Stage currentStage = new titlestage();

boolean shooting = false;

Player yoi = new Player();

void setup(){
  size(1000, 750);
  noCursor();
  noStroke();
  fill(128,0,0);
  rect(0,0,width, height);
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
  if (key == 'i'){
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
  if (!gamestart){
    if (keyCode==ENTER){
      gamestart=true;
      ticks=0;
      currentStage=new Stage(0);
      yoi = new Player();
    }
  }
  if (!alive){
    if (key== 'r'){
      yoi = new Player();
      int x = currentStage.stagenum;
      currentStage = new Stage(x);
      bm = new BulletManager();
      alive = true;
      ticks=0;
    }
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
}

void mousePressed(){
  if(mouseButton == LEFT){
    shooting=true;
  }
  if(mouseButton == RIGHT){
    focus = true;
  }
}

void mouseReleased(){
  if(mouseButton == LEFT){
    shooting=false;
  }
  if(mouseButton == RIGHT){
    focus = false;
  }
}

void draw(){ 
  
  fill(0,0,0,110);
  rect(20,20,700, 710);
  
  currentStage.processenemies();
  if(keyPressed){
    if(keyCode == SHIFT){
      focus = true;
    }
  }
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
  
  bm.display();
  
  //crosshair
  fill(color(0));
  ellipse(mouseX,mouseY,4,31);
  ellipse(mouseX,mouseY,31,4);
  fill(color(255));
  ellipse(mouseX,mouseY,3,30);
  ellipse(mouseX,mouseY,30,3);
  
  checkStuff();
  ticks++;
  spawndelay++;
  //text(currentStage.stagenum,50,50);
  renderGUI();
}

void renderGUI(){
  if (gamestart){
    fill(color(128, 0, 0));
    rect(0,0,20, height);
    rect(0,0,width, 20);
    rect(0,height-20,width, height);
    rect(720,0,width, height); 
    fill(150);
    rect(750,250,220,30);
    fill(255);
    textSize(75);
    text("bozo",765,90);
    text("project",733,180);
    textSize(11);
    text("HP: "+yoi.HP,760,269);
    
    
    if (alive){
      
      fill(255,0,0);
      rect(755,255,210*((float)yoi.HP/100),20);
      fill(255);
      textSize(11);
      text("HP: "+yoi.HP,760,269);
    }else{
      fill(0,ticks*2);
      rect(20,20,700, 710);
      fill(255,ticks*2);
      textSize(11);
      text("thats unfortunate",320,320);
      text("press r to restart",321,340);
    }
  }else{
    fill(50);
    rect(0,0,width,height);
    fill(255);
    textSize(11);
    text("game lol", 475,350); 
    text("press enter", 468,370); 
  }
}

public void checkStuff(){
  if(up>0||down>0){
  if(up>down){
    if(focus){
      moveY=-2;
    }else{
      moveY=-5;
    }
  }else if(down>up){
    if(focus){
      moveY=2;
    }else{
      moveY=5;
    }
  }
  }else{
    moveY=0;

  }
  
  //angle -= 0.7;
  
  //if(up > 0 || down > 0){
  //  if(up > down) moveY = -5;
  //  else if(down>up) moveY = 5;
  //}
  //else moveY=0;
  if(left>0 || right>0){
    if(left > right) {
      if(focus){
      moveX=-2;
    }else{
      moveX=-5;
    }
    }
    else if(right > left) {
      if(focus){
      moveX=2;
    }else{
      moveX=5;
    }
    }
  }
  else moveX = 0; 
}
