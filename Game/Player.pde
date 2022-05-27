public class Player implements Damageable{
  public float x, y, dx, dy;
  public int HP;
  public Phase attack;
  float hitRadius = 10;
  
  public Player(){
    x=500;
    y=680;
    dx=0;
    dy=0;
    HP=100;
    //attack = doubleshot or whatever itl be called;
  }
  
  public void move(){
    setDX(moveX);
    setDY(moveY);
    x+=dx;
    y+=dy;
  }
  public void display(){
    fill(255,234,156);
    ellipse(x, y+5, 25, 60);
    fill(255,0,0);
    ellipse(x,y,hitRadius,hitRadius);
    fill(240);
    text("HP: "+HP,900,100);
  }
  public void dealDamage(Damageable other,int dmg){
    other.takeDamage(dmg);
  }
  public void takeDamage(int dmg){
    HP-=dmg;  
    fill(155,134,56);
    ellipse(x, y+5, 25, 60);
    fill(255,0,0);
    ellipse(x,y,hitRadius,hitRadius);
    
  }
  public void shoot(){
    bm.addPlayerBullet(new PlayerBullet(x, y-25, 5, 3*PI/2));
    //placeholder until phases work 
  }
  //public void setX(float k){}
  //public void setY(float k){}
  public void setDX(float k){
    if(x<10||x>width-10){
     dx*=-1;
    }else{
    dx=k;}
  }
  public void setDY(float k){
    if(y<20||y>height-20){
     dy*=-1;
    }else{
    dy=k;}
  }
  
}
