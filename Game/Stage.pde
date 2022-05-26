import java.util.Queue;
import java.util.LinkedList;

public class Stage{
  public Queue<Enemy> enemies = new LinkedList<Enemy>();
  public Queue<Float> delay = new LinkedList<Float>();
  
  public Stage(){}
  
  public void spawn(){}
}

public class Stage1 extends Stage{
  public Stage1(){
    enemies.add(new Enemy());
  }
}
