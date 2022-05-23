import java.util.Queue;

public class Phase {
  public Queue<Bullet> bullets;
  public Queue<Float> delay;
  public String name;
}

public class Shotgun extends Phase{
  public Shotgun(float x, float y, int count, float speed, float dir, float spread){
    float startDir = dir - ((1.0 * count / 2) * spread);
    for (int i = 0; i < count; i++){
      bullets.add(new Bullet(x, y, speed, startDir + (i * spread)));
      delay.add(0.0);
    }
  }
}
