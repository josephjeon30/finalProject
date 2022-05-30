import java.util.*;
import java.util.*;

public class Stage{
  public Queue<Enemy> enemies = new LinkedList<Enemy>();
  public Queue<Float> delay = new LinkedList<Float>();
  public ArrayList<Enemy> enemyonfield = new ArrayList<Enemy>();
  //int enemycount=0;
  int stagenum;
  
  
  public Stage(int num){
    stagenum=num;
    spawndelay=0;
    switch(stagenum){
      default:
        int[] moves = {4,5};
        int[] time = {500,500};
        Boss egg=new Boss(moves,time);
        delay.add(200.0);
        enemies.add(egg);
        
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
        if(enemies.size()==0&&enemyonfield.size()==0) currentStage = new Stage(stagenum+1);
      }else{
        egg.display();
        if (alive){
          egg.move();
          egg.shoot();
        }
      }
    }
  }
  //public void proceed(){
  //  if(enemies.size()==0){
  //    if(enemyonfield.get(0).HP<=0){
        
  //    }
  //  }
  //  //if(bossisdead){
  //  //  stagenum++;
  //  //  bossisdead=false;
  //  //}
  //}
}
public class titlestage extends Stage{
  public titlestage(){
    super(0);
  }
  public void spawn(){
    //visuals
    fill(50);
    rect(0,0,width,height);
    text("game lol", 495,500);
  }
  public void processenemies(){
    //menu navigation
  }
}
