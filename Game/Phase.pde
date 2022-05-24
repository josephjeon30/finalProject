import java.util.Queue;
import java.util.LinkedList;

public class Phase {
  public Queue<Bullet> bullets = new LinkedList<Bullet>();
  public Queue<Float> delay = new LinkedList<Float>();
  public String name;
}

public class Shotgun extends Phase{
  public Shotgun(float x, float y, int count, float speed, float dir, float spread){
    float startDir = dir - ((1.0 * count / 2) * spread);
    for (int i = 0; i < count; i++){
      bullets.add(new EnemyBullet(x, y, speed, startDir + (i * spread)));
      delay.add(0.0);
    }
  }
}