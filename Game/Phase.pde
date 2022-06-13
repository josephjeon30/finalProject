import java.util.Queue;
import java.util.LinkedList;

public class Phase {
  public Queue<Bullet> bullets = new LinkedList<Bullet>();
  public Queue<Float> delay = new LinkedList<Float>();
  public Queue<Enemy> enemies = new LinkedList<Enemy>();
  public String name;
}
public class twofairylima4ghostsmid extends Phase{
  public twofairylima4ghostsmid(){
    fairy a = new fairy(100,100,-20,1);
    delay.add(100.0);
    enemies.add(a);
    fairy b = new fairy(100,640,-20,2);
    delay.add(0.0);
    enemies.add(b);
    ghost c = new ghost(100,370,-20);
    delay.add(100.0);
    enemies.add(c);
    ghost d = new ghost(100,370,-20);
    delay.add(50.0);
    enemies.add(d);
    ghost e = new ghost(100,370,-20);
    delay.add(50.0);
    enemies.add(e);
    ghost f = new ghost(100,370,-20);
    delay.add(50.0);
    enemies.add(f);
  }
}
public class twofairies extends Phase{
  public twofairies(){
    delay.add(0.0);
    enemies.add(new fairy(100,100,-20,0));
    delay.add(0.0);
    enemies.add(new fairy(100,640,-20,0));
  }
}


public class acrosscreen extends Phase{
  public acrosscreen(){
    delay.add(0.0);
    enemies.add(new fairy(100,750,-20,3));
    delay.add(0.0);
    enemies.add(new fairy(100,-20,-20,4));
    delay.add(25.0);
    enemies.add(new fairy(100,750,-20,3));
    delay.add(0.0);
    enemies.add(new fairy(100,-20,-20,4));
     delay.add(25.0);
    enemies.add(new fairy(100,750,-20,3));
    delay.add(0.0);
    enemies.add(new fairy(100,-20,-20,4));
     delay.add(25.0);
    enemies.add(new fairy(100,750,-20,3));
    delay.add(0.0);
    enemies.add(new fairy(100,-20,-20,4));
  }
}
public class kamikaze extends Phase{
  public kamikaze(){
    delay.add(0.0);enemies.add(new kama(100,100,-20));
    delay.add(0.0);enemies.add(new kama(100,180,-20));
    delay.add(0.0);enemies.add(new kama(100,100,-100));
    delay.add(0.0);enemies.add(new kama(100,180,-100));
    
    delay.add(25.0);enemies.add(new kama(100,240,-20));
    delay.add(0.0);enemies.add(new kama(100,320,-20));
    delay.add(0.0);enemies.add(new kama(100,240,-100));
    delay.add(0.0);enemies.add(new kama(100,320,-100));
    
    delay.add(25.0);enemies.add(new kama(100,380,-20));
    delay.add(0.0);enemies.add(new kama(100,460,-20));
    delay.add(0.0);enemies.add(new kama(100,380,-100));
    delay.add(0.0);enemies.add(new kama(100,460,-100));
    
    delay.add(25.0);enemies.add(new kama(100,520,-20));
    delay.add(0.0);enemies.add(new kama(100,600,-20));
    delay.add(0.0);enemies.add(new kama(100,520,-100));
    delay.add(0.0);enemies.add(new kama(100,600,-100));
  }
}

//BOSSES

public class Angel extends Phase{
  public Angel(){
    delay.add(0.0);
    enemies.add(new Boss(0));
  }
}

public class Ifrit extends Phase{
  public Ifrit(){
    delay.add(0.0);
    enemies.add(new Boss2(0));
  }
}


public class Shotgun extends Phase{
  public Shotgun(float x, float y, float dir, int count, float spread){
    float startDir = dir - (((float)count / 2) * spread);
    for (int i = 0; i < count; i++){
      bm.addEnemyBullet(new EnemyBulletA(x, y, -5.3, 3, 0.05, startDir + (i * spread),1,200,20));
      //delay.add(0.0);
    }
  }
  public Shotgun(float x, float y, int count, float speed, float dir, float spread, float hitRadius){
    this(x,y,count,speed,dir,spread,hitRadius,200);
  }
  
  public Shotgun(float x, float y, int count, float speed, float dir, float spread, float hitRadius, int duration){
    float startDir = dir - (((float)count / 2) * spread);
    if (count % 2 == 0){
      for (int i = 0; i < count; i++){
        bm.addEnemyBullet(new EnemyBullet(x, y, speed, startDir + (i * spread),1,duration,hitRadius));
        //delay.add(0.0);
      }
    }
    else{
      for (int i = 0; i < count; i++){
        bm.addEnemyBullet(new EnemyBullet(x, y, speed, startDir + (i * spread)+spread/2,1,duration,hitRadius));
        //delay.add(0.0);
      }
    }
  }
}

public class Wall extends Phase{
  public Wall(float x, float y, int count, float speed, float dir, float spread,float hitRadius){
    for (int i = -count/2+1; i < count/2; i++){
      bm.addEnemyBullet(new EnemyBullet(x + spread * i * cos(dir - PI/2), y + spread * i * sin(dir - PI/2), speed, dir,1,200, hitRadius));
    }
  }
  
  public Wall(float x, float y, int count, float speed, float dir, float dirWall, float spread,float hitRadius){
    for (int i = -count/2+1; i < count/2; i++){
      bm.addEnemyBullet(new EnemyBulletA(x + spread * i * cos(dir - PI/2), y + spread * i * sin(dir - PI/2),0, speed,0.1, dirWall,1,200, hitRadius));
    }
  }
}

public class PWall extends Phase{
  public PWall(float x, float y, int count, float speed, float dir, float spread){
    for (int i = -count/2+1; i < count/2; i++){
      float newX = x + spread * i * cos(dir - PI/2);
      float newY = y + spread * i * sin(dir - PI/2);
      float newDir = atan((mouseY-newY)/(mouseX-newX));
      if (mouseX - newX < 0){
        newDir += PI;
      }
      bm.addPlayerBullet(new PlayerBullet(newX, newY, speed, newDir));
    }
  }
}
