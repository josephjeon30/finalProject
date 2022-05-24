import java.util.LinkedList;

public class BulletManager{
  LinkedList<EnemyBullet> enemyBullets = new LinkedList<EnemyBullet>();
  LinkedList<PlayerBullet> playerBullets = new LinkedList<PlayerBullet>();
  
  public void move(){
    for (EnemyBullet enemyBullet: enemyBullets){
      enemyBullet.move();
    }
    for (PlayerBullet playerBullet: playerBullets){
      playerBullet.move();
    }
  }
  
  public void display(){
    for (EnemyBullet enemyBullet: enemyBullets){
      enemyBullet.display();
    }
    for (PlayerBullet playerBullet: playerBullets){
      playerBullet.display();
    }
  }
}
