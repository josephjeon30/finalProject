public class Bullet{
  float border = 0;
  float x, y, dx, dy;
  int dmg;
  float dmgCooldown;
  int duration;
  boolean outOfBounds = false;
  float hitRadius = 10;
  int spawnTick;
  //PImage img;
  
  public Bullet(){
    this(width / 2, 0);
  }
  
  public Bullet(float x, float y){
    this(x, y, 20, PI / 2);
  }
    
  public Bullet(float x, float y, float speed, float angle){
    this(x, y, speed * cos(angle), speed * sin(angle), 10, 10.0, 1);
  }
  
  public Bullet(float x, float y, float dx, float dy, int dmg, float dmgCooldown, int duration){
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.dmg = dmg;
    this.dmgCooldown = dmgCooldown;
    this.duration = duration;
    spawnTick = Game.ticks;
  }
  
  public void move(){
    x += dx;
    y += dy;
    if (Game.ticks - this.spawnTick >= duration) outOfBounds = true;
    if (x < border || x > width - border || y < border || y > height - border) outOfBounds = true;
  }
  
  public void display(){
    fill(255);
    ellipse(x, y, 10, 10);
  }
  
}

public class EnemyBullet extends Bullet{
  Player player;
   
  public EnemyBullet(float x, float y, float speed, float angle){
    this(x, y, speed * cos(angle), speed * sin(angle), 1, 10.0, 20);
  }
  
  public EnemyBullet(float x, float y, float dx, float dy, int dmg, float dmgCooldown, int duration){
    super(x, y, dx, dy, dmg, dmgCooldown, duration);
    player = yoi;
    bm.addEnemyBullet(this);
  }
}

public class PlayerBullet extends Bullet{
  Enemy enemy;
  
  public PlayerBullet(float x, float y, float speed, float angle){
    this(x, y, speed * cos(angle), speed * sin(angle), 100, 10.0, 200);
  }
  
  public PlayerBullet(float x, float y, float dx, float dy, int dmg, float dmgCooldown, int duration){
    super(x, y, dx, dy, dmg, dmgCooldown, duration);
    bm.addPlayerBullet(this);
  }
  
  public void display(){
    fill(0,255,0);
    ellipse(x, y, 10, 10);
  }
}
