import java.util.*;
import java.util.*;

public class Stage{
  public Queue<Enemy> enemies = new LinkedList<Enemy>();
  public Queue<Float> delay = new LinkedList<Float>();
  public ArrayList<Enemy> enemyonfield = new ArrayList<Enemy>();
  //int enemycount=0;
  int stagenum;
  
  
  public Stage(){
    switch(stagenum){
      default:
        Enemy egg=new fairy(80,500,500);
        enemies.add(egg);
        delay.add(200.0);
    }
  }
  
  public void spawn(){
    if(enemies.size()>0){
      if(spawndelay==delay.peek()){
        enemyonfield.add(enemies.remove());
        spawndelay=0;
        delay.remove();
      }
    }
  }
  public void processenemies(){
    for (int e = 0; e < enemyonfield.size(); e++){
      Enemy egg = enemyonfield.get(e);
      if (egg.HP<=0){
        enemyonfield.remove(e);
      }else{
        egg.move();
        egg.display();
        egg.shoot();
      }
    }
  }
  public void proceed(){
    if(enemies.size()==0)
    if(bossisdead){
      stagenum++;
      bossisdead=false;
    }
  }
}

public class Stage1 extends Stage{
  public Stage1(){
    enemies.add(new Enemy());
  }
}
