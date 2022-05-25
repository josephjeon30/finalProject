public class Bullet{
  float x, y, dx, dy;
  int dmg;
  float dmgCooldown;
  float duration;
  boolean outOfBounds = false;;
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
    if (x < 0 || x > width || y < 0 || y > height) outOfBounds = true;
  }
  
  public void display(){
    fill(255);
    ellipse(x, y, 10, 10);
  }
  
}

public class EnemyBullet extends Bullet{
  //Player player;
   
  public EnemyBullet(float x, float y, float speed, float angle){
    this(x, y, speed * cos(angle), speed * sin(angle), 100, 10.0, 200.0);
  }
  
  public EnemyBullet(float x, float y, float dx, float dy, int dmg, float dmgCooldown, float duration){
    super(x, y, dx, dy, dmg, dmgCooldown, duration);
    bm.addEnemyBullet(this);
  }
}

public class PlayerBullet extends Bullet{
  //Enemy enemy;
  
  public PlayerBullet(float x, float y, float speed, float angle){
    this(x, y, speed * cos(angle), speed * sin(angle), 100, 10.0, 200.0);
  }
  
  public PlayerBullet(float x, float y, float dx, float dy, int dmg, float dmgCooldown, float duration){
    super(x, y, dx, dy, dmg, dmgCooldown, duration);
    bm.addPlayerBullet(this);
  }
}
