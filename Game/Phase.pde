import java.util.Queue;
import java.util.LinkedList;

public class Phase {
  public Queue<Bullet> bullets = new LinkedList<Bullet>();
  public Queue<Float> delay = new LinkedList<Float>();
  public String name;
}

public class Shotgun extends Phase{
  public Shotgun(float x, float y, float dir, int count, float spread){
    float startDir = dir - (((float)count / 2) * spread);
    for (int i = 0; i < count; i++){
      bm.addEnemyBullet(new EnemyBulletA(x, y, -5.3, 3, 0.05, startDir + (i * spread),1,200,40));
      //delay.add(0.0);
    }
  }
  public Shotgun(float x, float y, int count, float speed, float dir, float spread, float hitRadius){
    float startDir = dir - (((float)count / 2) * spread);
    for (int i = 0; i < count; i++){
      bm.addEnemyBullet(new EnemyBullet(x, y, speed, startDir + (i * spread),1,200,hitRadius));
      //delay.add(0.0);
    }
  }
}

public class Wall extends Phase{
  public Wall(float x, float y, int count, float speed, float dir, float spread,float hitRadius){
    for (int i = -count/2+1; i < count/2; i++){
      bm.addEnemyBullet(new EnemyBullet(x + spread * i * cos(dir - PI/2), y + spread * i * sin(dir - PI/2), speed, dir,1,200, hitRadius));
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
