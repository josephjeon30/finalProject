public class Bullet{
  float border = 250;
  float x, y, dx, dy;
  int dmg;
  int duration;
  boolean outOfBounds = false;
  float hitRadius;
  int spawnTick;
  color c = color(255);
  //PImage img;
  
  public Bullet(){
    this(width / 2, 0);
  }
  
  public Bullet(float x, float y){
    this(x, y, 20, PI / 2, 10);
  }
    
  public Bullet(float x, float y, float speed, float angle, float hitRadius){
    this(x, y, speed * cos(angle), speed * sin(angle), 10, 500, hitRadius);
  }
  
  public Bullet(float x, float y, float dx, float dy, int dmg, int duration, float hitRadius){
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.dmg = dmg;
    this.duration = duration;
    this.hitRadius = hitRadius;
    spawnTick = Game.ticks;
  }
  
  public Bullet(float x, float y, float dx, float dy, int dmg, int duration, float hitRadius,float r, float g, float b){
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.dmg = dmg;
    this.duration = duration;
    this.hitRadius = hitRadius;
    spawnTick = Game.ticks;
    this.c = color(r,g,b);
  }
  
  public void move(){
    x += dx;
    y += dy;
    if (Game.ticks - this.spawnTick >= duration) outOfBounds = true;
    if (x < 0 - border || x > 700 + border || y < 0 - border || y > height + border) outOfBounds = true;
  }
  
  public void display(){
    fill(c);
    ellipse(x, y, hitRadius, hitRadius);
  }
  
}

public class EnemyBullet extends Bullet{
  public EnemyBullet(float x, float y, float speed, float angle, int dmg, int duration, float hitRadius){
    super(x, y, speed * cos(angle), speed * sin(angle), dmg, duration, hitRadius);
    bm.addEnemyBullet(this);
  }
  
  public EnemyBullet(float x, float y, float speed, float angle, int dmg, int duration, float hitRadius,float r, float g, float b){
    super(x, y, speed * cos(angle), speed * sin(angle), dmg, duration, hitRadius);
    bm.addEnemyBullet(this);
    this.c = color(r,g,b);
  }
  
  public void display(){
    fill(c);
    ellipse(x, y, hitRadius, hitRadius);
  }
}

public class EnemyBulletR extends EnemyBullet{
  float r;
  float x_c;
  float y_c;
  float startAngle;
  float dtheta;
  float timer = 0;
  color c = color(255);
  
  public EnemyBulletR(float x, float y, float x_c, float y_c, float vel, int dmg, int duration, float hitRadius){
    super(x,y,0,0,dmg,duration,hitRadius);
    this.x_c = x_c;
    this.y_c = y_c;
    this.startAngle = atan((y-y_c)/(x-x_c));
    if (x - x_c < 0){
      this.startAngle += PI;
    }
    this.r = dist(x,y,x_c,y_c);
    this.dtheta = vel/r;
  }
  
  public EnemyBulletR(float x, float y, float x_c, float y_c, int dmg, int duration, float hitRadius){
    super(x,y,0,0,dmg,duration,hitRadius);
    this.x_c = x_c;
    this.y_c = y_c;
    this.startAngle = atan((y-y_c)/(x-x_c));
    if (x - x_c < 0){
      this.startAngle += PI;
    }
    this.r = dist(x,y,x_c,y_c);
    this.dtheta = PI/240;
  }
  public EnemyBulletR(float x, float y, float x_c, float y_c, int dmg, int duration, float hitRadius, boolean extra){
    this(x,y,x_c,y_c,dmg,duration,hitRadius);
    if (extra) this.c = color(255,0,0);
  }
  
  public EnemyBulletR(float x, float y, float x_c, float y_c, float k, int dmg, int duration, float hitRadius, boolean extra){
    this(x,y,x_c,y_c,dmg,duration,hitRadius);
    this.dtheta = k*-PI/300;
    if (extra) this.c = color(255,0,0);
  }
  
  public void move(){
    x = r*cos(startAngle + dtheta*(float)timer)+x_c;
    y = r*sin(startAngle + dtheta*(float)timer)+y_c;
    if (Game.ticks - this.spawnTick >= duration) outOfBounds = true;
    timer++;
  }
  
  public void display(){
    fill(c);
    ellipse(x, y, hitRadius, hitRadius);
  }
}

public class EnemyBulletA extends EnemyBullet{
  float v;
  float vf;
  float accel;
  boolean inc;
  float angle;
  color c = color(255);
  public EnemyBulletA(float x, float y, float v, float vf, float accel, float angle, int dmg, int duration, float hitRadius){
    super(x,y,v,angle,dmg,duration,hitRadius);
    this.v = v;
    this.vf = vf;
    this.angle = angle;
    this.accel = accel;
  }
  
  public EnemyBulletA(float x, float y, float v, float vf, float accel, float angle, int dmg, int duration, float hitRadius, float red, float green, float blue){
    this(x,y,v,vf,accel,angle,dmg,duration,hitRadius);
    this.c = color(red,green,blue);
  }
  
  public void move(){
    x += v*cos(angle);
    y += v*sin(angle);
    if (v < vf) v += accel;
    if (Game.ticks - this.spawnTick >= duration) outOfBounds = true;
    if (x < 0 - border || x > 700 + border || y < 0 - border || y > height + border) outOfBounds = true;
  }
  
  public void display(){
    fill(c);
    ellipse(x, y, hitRadius, hitRadius);
  }
}

public class PlayerBullet extends Bullet{
  Enemy enemy;
  
  public PlayerBullet(float x, float y, float speed, float angle){


    this(x, y, speed * cos(angle), speed * sin(angle), 1+(int)random(2), 200);
    if(!joseph) dmg = 10;

  }
  
  public PlayerBullet(float x, float y, float dx, float dy, int dmg, int duration){
    super(x, y, dx, dy, dmg, duration, 20.0);
    bm.addPlayerBullet(this);
  }
  
  public void display(){
    fill(0,255,0,50);
    ellipse(x, y, hitRadius, hitRadius);
  } 
}
