public class Bullet{
  float x, y, dx, dy;
  int dmg;
  float dmgCooldown;
  float duration;
  PImage img;
  
  public Bullet(){
    this(width / 2, 0);
  }
  
  public Bullet(float x, float y){
    this(x, y, 0, 5);
  }
    
  public Bullet(float x, float y, float speed, float angle){
    this(x, y, speed * cos(angle), speed * sin(angle), 100, 10.0, 200.0, null);
  }
  
  public Bullet(float x, float y, float dx, float dy, int dmg, float dmgCooldown, float duration, PImage img){
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.dmg = dmg;
    this.dmgCooldown = dmgCooldown;
    this.duration = duration;
    this.img = img;
  }
}
