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
      if(down!=0){
      down=1;}
      up+=2;
    }
    if(keyCode==DOWN){
      if(up!=0){
      up=1;}
      down+=2;
    }
    if(keyCode==LEFT){
      if(right!=0){
      right=1;}
      left+=2;
    }
    if(keyCode==RIGHT){
      if(left!=0){
      left=1;}
      right+=2;
    }
  }//else{
  ////  moveX=0;
 
  ////  moveY=0;
  ////}
}
void keyReleased(){
   if (key==CODED){
    if(keyCode==UP){
     // down*=-1;
      up=0;
      //down--;
    }
    if(keyCode==DOWN){
      //up*=-1;
      down=0;
      //up--;
    }
    if(keyCode==LEFT){
     // right*=-1;
      left=0;
      //right--;
    }
    if(keyCode==RIGHT){
      right=0;
      //left--;
    //  left*=-1;
    }
   }
}

void draw(){
  
  background(0);
  yoi.move();
  yoi.display();
  bm.move();
  bm.display();
  
  angle += 0.5;
  if(up>0||down>0){
    if(up>down){
      moveY=-5;
    }else if(down>up){
      moveY=5;
    }
  }else{
    moveY=0;
  }
  if(left>0||right>0){
    if(left>right){
      moveX=-5;
    }else if(right>left){
      moveX=5;
    }
  }else{
    moveX=0;
  }
        
    
    
    
  }
  
