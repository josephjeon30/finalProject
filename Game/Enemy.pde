public class Enemy implements Damageable{
  public float x, y, dx, dy;
  public int HP;
  public int type;
  public Phase attack;
  float hitRadius = 10;
  public float timer = 0;
  
  public Enemy(){

    this(80,0,0);
  }
  public Enemy(int hp,int spawnX,int spawnY){
    HP=hp;
    x=spawnX;
    y=spawnY;
  }
  
  public void move(){
    switch(type){
      default:
        x+=dx;
        y+=dy;
    }
  }
  public void display(){
    switch(type){
      default:
        fill(40,234,156);
        ellipse(x, y, 25, 60);
        fill(240);
        text("HP: "+HP,900,200);
    }
  }
  public void dealDamage(Damageable other,int dmg){
    other.takeDamage(dmg);
  }
  public void takeDamage(int dmg){
    HP-=dmg;
  }
  public void shoot(){}

  public void setX(float k){}
  public void setY(float k){}
  public void setDX(float k){}
  public void setDY(float k){}
  
}
public class fairy extends Enemy{
  int tick = 0;
  
  public fairy(){
    super();
    dx=5;
    dy=0;
  }
  public fairy(int h, int x, int y){
    super(h,x,y);
    dx=5;
    dy=0;
  }
  public void shoot(){
    if(ticks%2==0){
      int v = 3;
      attack = new Shotgun(x, y, 5, v, 0.01*angle, PI/24);
      attack = new Shotgun(x, y, 5, v, 0.01*angle+ PI, PI/24);
    }
  }  
  public void move(){
    //if(x<5||x>995) dx*=-1;
    y = 150+50*sin(0.1* timer);
    x = 500 + 500*sin(0.012*timer);
    timer++;
  }
}
public class Boss extends Enemy{
  public Phase[] phases;
  public int currentPhase;
  public Boss(){
    super(500,500,0);
  }
}
