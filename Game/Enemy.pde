public class Enemy implements Damageable{
  public float x, y, dx, dy;
  public int HP;
  public Phase attack;
  
  public Enemy(){
    attack = new Shotgun(x, y, 3, 5, atan((yoi.y - y) / (yoi.x - x)), PI/4);
  }
  
  public void move(){
    
  }
  
  public void display(){
    
  }
  
  public void dealDamage(Damageable other,int dmg){}
  public void takeDamage(int dmg){}
  public void setX(float k){}
  public void setY(float k){}
  public void setDX(float k){}
  public void setDY(float k){}
  
}

public class Boss extends Enemy{
  public Phase[] phases;
  public int currentPhase;
  public Boss(){}
}
