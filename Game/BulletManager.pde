import java.util.LinkedList;

public class BulletManager{
  LinkedList<EnemyBullet> enemyBullets = new LinkedList<EnemyBullet>();
  LinkedList<PlayerBullet> playerBullets = new LinkedList<PlayerBullet>();
  
  public void move(){
    for (int i = 0; i < enemyBullets.size(); i++){
      enemyBullets.get(i).move();
      if (enemyBullets.get(i).outOfBounds) enemyBullets.remove(enemyBullets.get(i));
    }
    for (int i = 0; i < playerBullets.size(); i++){
      playerBullets.get(i).move();
      if (playerBullets.get(i).outOfBounds) playerBullets.remove(playerBullets.get(i));
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
  
  public void addEnemyBullet(EnemyBullet eb){
    enemyBullets.add(eb);
  }
  public void addPlayerBullet(PlayerBullet pb){
    playerBullets.add(pb);
  }
  
  public void detectCollision(){
    for (EnemyBullet eb: enemyBullets){
      if (dist(eb.x,eb.y, eb.player.x, eb.player.y) < eb.hitRadius + eb.player.hitRadius){
        eb.player.takeDamage(eb.dmg);
      }
    } 
  }
}
