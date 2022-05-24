public class Bullet{
  float x, y, dx, dy;
  int dmg;
  float dmgCooldown;
  float duration;
  //PImage img;
  
  public Bullet(){
    this(width / 2, 0);
  }
  
  public Bullet(float x, float y){
    this(x, y, 20, PI / 2);
  }
    
  public Bullet(float x, float y, float speed, float angle){
    this(x, y, speed * cos(angle), speed * sin(angle), 100, 10.0, 200.0);
  }
  
  public Bullet(float x, float y, float dx, float dy, int dmg, float dmgCooldown, float duration){
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.dmg = dmg;
    this.dmgCooldown = dmgCooldown;
    this.duration = duration;
  }
  
  public void move(){
    x += dx;
    y += dy;
  }
  
  public void display(){
    fill(255);
    ellipse(x, y, 10, 10);
  }
  
}

public class EnemyBullet extends Bullet{
  //Player player;
}

public class PlayerBullet extends Bullet{
  //Enemy enemy;
}
