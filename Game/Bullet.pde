public class Bullet{
  float border = 250;
  float x, y, dx, dy;
  int dmg;
  float dmgCooldown;
  int duration;
  boolean outOfBounds = false;
  float hitRadius;
  int spawnTick;
  //PImage img;
  
  public Bullet(){
    this(width / 2, 0);
  }
  
  public Bullet(float x, float y){
    this(x, y, 20, PI / 2, 10);
  }
    
  public Bullet(float x, float y, float speed, float angle, float hitRadius){
    this(x, y, speed * cos(angle), speed * sin(angle), 10, 10.0, 5, hitRadius);
  }
  
  public Bullet(float x, float y, float dx, float dy, int dmg, float dmgCooldown, int duration, float hitRadius){
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.dmg = dmg;
    this.dmgCooldown = dmgCooldown;
    this.duration = duration;
    this.hitRadius = hitRadius;
    spawnTick = Game.ticks;
  }
  
  public void move(){
    x += dx;
    y += dy;
    if (Game.ticks - this.spawnTick >= duration) outOfBounds = true;
    if (x < 0 - border || x > 700 + border || y < 0 - border || y > height + border) outOfBounds = true;
  }
  
  public void display(){
    fill(255);
    ellipse(x, y, hitRadius, hitRadius);
  }
  
}

public class EnemyBullet extends Bullet{
  Player player;
   
  public EnemyBullet(float x, float y, float speed, float angle, float hitRadius){
    this(x, y, speed * cos(angle), speed * sin(angle), 1, 10.0, 200, hitRadius);
  }
  
  public EnemyBullet(float x, float y, float dx, float dy, int dmg, float dmgCooldown, int duration, float hitRadius){
    super(x, y, dx, dy, dmg, dmgCooldown, duration, hitRadius);
    player = yoi;
    bm.addEnemyBullet(this);
  }
  
  public void display(){
    fill(255);
    ellipse(x, y, hitRadius, hitRadius);
  }
}

public class PlayerBullet extends Bullet{
  Enemy enemy;
  
  public PlayerBullet(float x, float y, float speed, float angle){
    this(x, y, speed * cos(angle), speed * sin(angle), 1+(int)random(2), 10.0, 200);
  }
  
  public PlayerBullet(float x, float y, float dx, float dy, int dmg, float dmgCooldown, int duration){
    super(x, y, dx, dy, dmg, dmgCooldown, duration, 20.0);
    bm.addPlayerBullet(this);
  }
  
  public void display(){
    fill(0,255,0,50);
    ellipse(x, y, hitRadius, hitRadius);
  } 
}
