public class Player implements Damageable{
  public float x, y, dx, dy;
  public int HP;
  public int wallLevel;
  public Phase attack;
  float hitRadius = 10;
  
  public Player(){
    x=370;
    y=800;
    dx=0;
    dy=0;
    HP=100;
    wallLevel = 10;
  }
  
  public void move(){
    if(ticks<=40){
      y-=4;
    }else{
    setDX(moveX);
    setDY(moveY);
    x+=dx;
    y+=dy;
    if(HP<=0) {
      alive=false;
      ticks = 0;
    }
    }
  }
  public void display(){
    fill(255,234,156);
    ellipse(x, y, 25, 60);
    if(focus){
      fill(255,0,0);
      ellipse(x,y,hitRadius,hitRadius);
    }
    
  }
  public void dealDamage(Damageable other,int dmg){
    other.takeDamage(dmg);
  }
  public void takeDamage(int dmg){
    HP-=dmg;  
    if (dmg != 0){
      fill(155,134,56);
      ellipse(x, y, 25, 60);
    }
    if(focus){
      fill(255,0,0);
      ellipse(x,y,hitRadius,hitRadius);
    }
    
  }
  public void shoot(){
    //bm.addPlayerBullet(new PlayerBullet(x, y-25, 5, 3*PI/2));
    Phase p = new PWall(x,y,wallLevel,5,-PI/2,30);
  }
  //public void setX(float k){}
  //public void setY(float k){}
  public void setDX(float k){
    if(x<35||x>700){
     dx*=-1;
    }else{
    dx=k;}
  }
  public void setDY(float k){
    if(y<40||y>height-70){
     dy*=-1;
    }else{
    dy=k;}
  }
  
}
