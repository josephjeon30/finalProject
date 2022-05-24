public class Player implements Damageable{
  public float x, y, dx, dy;
  public int HP;
  public Phase attack;
  
  public Player(){
  x=500;
  y=680;
  dx=0;
  dy=0;
  HP=100;
  //attack = doubleshot or whatever itl be called;
  }
  
  public void move(){
    x+=dx;
    y+=dy;
  }
  public void display(){
    fill(255,234,156);
    ellipse(x, y, 25, 60);
  }
  public void dealDamage(Damageable other){}
  public void takeDamage(int dmg){}
  public void shoot(){}
  public void setX(float k){}
  public void setY(float k){}
  public void setDX(float k){}
  public void setDY(float k){}
  
}
