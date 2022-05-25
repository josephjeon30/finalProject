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

  Shotgun sh = new Shotgun(width/2, height/2, 5, 2, angle, 2 * PI/5);
  Shotgun sh2 = new Shotgun(width/2, height/2, 5, 2, -angle, 2 * PI/5);
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
  }
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
  
  fill(color(0, 0, 0, 69));
  rect(0,0,width, height);
  
  yoi.move();
  yoi.display();
  
  bm.move();
  bm.display();
  
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

  
