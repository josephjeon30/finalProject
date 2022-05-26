import java.util.Queue;
import java.util.LinkedList;

public class Stage{
  public Queue<Enemy> enemies = new LinkedList<Enemy>();
  public Queue<Float> delay = new LinkedList<Float>();
  int stagenum;
  
  public Stage(){
    switch(stagenum){
      default:
        Enemy egg = new Enemy();
        enemies.add(egg);
    }
  }
  
  public void spawn(){}
  public void proceed(){
    if(bossisdead){
      stagenum++;
      bossisdead=false;
    }
  }
}
