import java.util.Queue;
import java.util.LinkedList;

public class Phase {
  public Queue<Bullet> bullets = new LinkedList<Bullet>();
  public Queue<Float> delay = new LinkedList<Float>();
  public String name;
}

public class Shotgun extends Phase{
  public Shotgun(float x, float y, int count, float speed, float dir, float spread){
    float startDir = dir - (((float)count / 2) * spread);
    for (int i = 0; i < count; i++){
      bm.addEnemyBullet(new EnemyBullet(x, y, speed, startDir + (i * spread)));
      //delay.add(0.0);
    }
  }
}

public class Wall extends Phase{
  public Wall(float x, float y, int count, float speed, float dir, float spread){
    for (int i = -count/2+1; i < count/2; i++){
      bm.addEnemyBullet(new EnemyBullet(x + spread * i * cos(dir - PI/2), y + spread * i * sin(dir - PI/2), speed, dir));
    }
  }
}
