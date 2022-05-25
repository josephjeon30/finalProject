BulletManager bm = new BulletManager();
float angle = 0;
boolean alive = true;
Stage currentstage;
int moveX=0;
int moveY=0;
int up=0;
int down=0;
int left=0;
int right=0;
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
      up++;
    }
    if(keyCode==DOWN){
      
      down++;
    }
    if(keyCode==LEFT){
      left++;
    }
    if(keyCode==RIGHT){
      right++;
    }
  }//else{
  ////  moveX=0;
 
  ////  moveY=0;
  ////}
}
void keyReleased(){
   if (key==CODED){
    if(keyCode==UP){
      up=0;
    }
    if(keyCode==DOWN){
      down=0;
    }
    if(keyCode==LEFT){
      left=0;
    }
    if(keyCode==RIGHT){
      right=0;
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
  if(up>0||down>0){
    if(up>down){
      moveY=-1;
    }else if(down>up){
      moveY=1;
    }
  }else{
    moveY=0;
  }
  if(left>0||right>0){
    if(left>right){
      moveX=-1;
    }else if(right>left){
      moveX=1;
    }
  }else{
    moveX=0;
  }
        
    
    
    
  }
  
