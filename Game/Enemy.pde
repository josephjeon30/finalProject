public class Enemy implements Damageable{
  public float x, y, dx, dy;
  public int HP;
  public int type;
  public Phase attack;
  
  public Enemy(){
    this(80,1,0,0);
  }
  public Enemy(int hp,int kind,int spawnX,int spawnY){
    HP=hp;
    type=kind;
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
    }
  }
  public void dealDamage(Damageable other,int dmg){
    other.takeDamage(dmg);
  }
  public void takeDamage(int dmg){
    HP-=dmg;
  }
  public void setX(float k){}
  public void setY(float k){}
  public void setDX(float k){}
  public void setDY(float k){}
  
}

public class Boss extends Enemy{
  public Phase[] phases;
  public int currentPhase;
  public Boss(){
    super(500,1,500,0);
  }
}
