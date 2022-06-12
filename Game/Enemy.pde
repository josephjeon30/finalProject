public class Enemy implements Damageable{
  public float x, y, dx, dy;
  public int maxHP;
  public int HP;
  public int type;
  public Phase attack;
  float hitRadius = 10;
  public float timer = 0;
  
  
  public Enemy(){

    this(80,0,0);
  }
  public Enemy(int hp,int spawnX,int spawnY){
    maxHP=hp;
    HP=hp;
    x=spawnX;
    y=spawnY;
  }
  
  public void move(){
    switch(type){
      default:
        x+=dx;
        y+=dy;
    }
  }
  public void display(){
    switch(type){
      default:
        fill(234,234,40);
        ellipse(x, y, 25, 60);
        fill(240);
        textSize(11);
        text("HP: "+HP,30,height-30);
    }
  }
  public void dealDamage(Damageable other,int dmg){
    other.takeDamage(dmg);
  }
  public void takeDamage(int dmg){
    HP-=dmg;
  }
  public void shoot(){}

  //public void setX(float k){}
  //public void setY(float k){}
  //public void setDX(float k){}
  //public void setDY(float k){}
  
}
public class fairy extends Enemy{
  //int tick = 0;
  
  public fairy(){
    super();
    dx=5;
    dy=0;
  }
  public fairy(int h, int x, int y){
    super(h,x,y);
    dx=5;
    dy=0;
  }
  public void shoot(){
    if(timer%30==0){
      float newDir = atan((yoi.y-y)/(yoi.x-x));
          if (yoi.x - x < 0){
            newDir += PI;
          }
          attack = new Shotgun(x, y, 5, 3, newDir, PI/10,50);
    }
  }  
  public void move(){
    //if(x<5||x>995) dx*=-1;
    y = 350 + 100*sin(0.1* timer);
    x = 500 + 400*sin(0.012*timer);
    timer++;
  }
}
public class Boss extends Enemy{
  public int currentPhase=0;
  float r = 0;
  float s = 0;
  int countDown = 0;
  
  public Boss(){
    super(10000,370,20);
  }
  public Boss(int startphase){
    super(10000,370,20);
    currentPhase=startphase;
  }
  public void display(){
    super.display();
    fill(150,timer*2);
    rect(60,50,620,30);
    fill(255,0,0,timer*2);
    rect(65,55,610*((float)HP/maxHP),20);
  }
  public void move(){
    switch(currentPhase){
      case 0:  //reset
        timer++;
        if (dist(x,y,370,height/2)>10 || timer < 100){
          dx = 0.03*(370 - x);
          dy = 0.03*(height/2 - y);
          x += dx;
          y += dy;
        }
        else{
          currentPhase = 1;
          timer = 0;
        }
        break;
      case 1:   //wings
        y = height/2+50*sin(0.1* timer);
        x = 370 + 330*sin(0.012*timer);
        timer++;
        if (timer > 1000){
          currentPhase = 2;
        }
        break;
      case 2:   //reset
        if (dist(x,y,370,100)>5){
          dx = 0.05*(370 - x);
          dy = 0.05*(100 - y);
          x += dx;
          y += dy;
        }
        else {
          currentPhase = 3;
          timer = 0;  
        }
        break;
      case 3:  //walls
        x = 25*(-cos(0.01*timer)+1)*cos(0.1*timer)+370;
        y = 25*(-cos(0.01*timer)+1)*sin(0.1*timer) + 100;
        timer++;
        if (timer > 1000){
          currentPhase = 4;
          timer = 0;
        }
        break;
      case 4:  //reset
        if (dist(x,y,370,height/2)>10){
          dx = 0.03*(370 - x);
          dy = 0.03*(height/2 - y);
          x += dx;
          y += dy;
        }
        else{
          currentPhase = 5;
          timer = 0;
        }
        break;
      case 5:  //B.S. (bachelor of science)
        timer++;
        x = 25*(-cos(0.01*timer)+1)*cos(0.1*timer)+370;
        y = 25*(-cos(0.01*timer)+1)*sin(0.1*timer) + height/2;
        if (timer > 1000){
          currentPhase = 6;
          timer = 0;
        }
        break;
      
      case 8:
        x = 370;
        y = height/2;
        break;
    } 
  }
  public void shoot(){
    switch(currentPhase){
      case 1: //wings
        if(timer%3==0) {
          int v = 5;
          attack = new Shotgun(x, y, 5, v, -0.01*timer, PI / 20,10);
          attack = new Shotgun(x, y, 5, v, -0.01*timer+ PI, PI/20,10);
        }
        if(timer % 75 == 0){
          
          float newDir = atan((yoi.y-y)/(yoi.x-x));
          if (yoi.x - x < 0){
            newDir += PI;
          }
          attack = new Shotgun(x, y, 5, 3, newDir, PI/10,50);
        }
        break;
      case 3: //walls
        countDown = (countDown + 1)%100;
        if (timer % 50 == 0){
          r = (PI/4)*(int)random(4);
        }
        if (countDown > 50){
          if (timer % 5 == 0){
            attack = new Wall(370 - 400*cos(r) + 35*cos(r + PI/2), 350 - 400*sin(r)+35*sin(r + PI/2), 20, 3, r, 70,20);
            attack = new Wall(370 + 400*cos(r), 350 + 400*sin(r), 20, 3, r+PI, 70,20);
          }
        }
        break;
      case 5:  //absolute bs (bachelor of science)
        if (timer % 3 == 0){
          int k = 2+(int)random(4);
          attack = new Shotgun(x, y, k,3,random(PI), 2 * PI / k, 10);
        }
        if (timer % 40 == 0){
          attack = new Shotgun(x,y,13,4,random(PI),2 * PI / 13,50);
        }
        break;
      
      case 8:
        if (timer%2 == 0){
          attack = new Shotgun(x,y,99*timer,3,2*PI/3);
        }
        timer++;
        break;
      default:
        break;
        
    }
  }
}

public class Boss2 extends Enemy{
  public int currentPhase=0;
  float r = 0;
  float s = 0;
  int countDown = 0;
  
  public Boss2(){
    super(10000,370,20);
  }
  public Boss2(int startphase){
    super(10000,370,20);
    currentPhase=startphase;
  }
  public void display(){
    super.display();
    fill(150,timer*2);
    rect(60,50,620,30);
    fill(255,0,0,timer*2);
    rect(65,55,610*((float)HP/maxHP),20);
  }
  public void move(){
    switch(currentPhase){
      case 0:
        x = 370;
        y = height/2;
        currentPhase = 1;
        break;
      case 1: //Circular
        if (timer > 100){
          currentPhase = 2;
          bm.enemyBullets = new LinkedList<EnemyBullet>();
          timer = 0;
        }
        break;
      case 2:  //reset
        if (dist(x,y,370,100)>10){
          dx = 0.03*(370 - x);
          dy = 0.03*(100 - y);
          x += dx;
          y += dy;
        }
        else{
          currentPhase = 3;
          timer = 0;
        }
        break;
      case 3: //chase
        timer++;
        
        float newDir = atan((yoi.y-y)/(yoi.x-x));
        if (yoi.x - x < 0){
          newDir += PI;
        }
        x += 3*cos(newDir);
        y += 3*sin(newDir);
        break;
        
    } 
  }
  public void shoot(){
    switch(currentPhase){
      case 0:
        break;
      case 1:
        if (timer % 50 == 0){
          r = 40*(int)random(height/40 - 1.5)-90;
          s = 40*(int)random(height/40 - 1.5)-90+20;
        }
        if (timer % 5 == 0){
          Bullet b = new EnemyBulletR(370,r,x,y,5,1,900,15);
          b = new EnemyBulletR(370,s,x,y,-5,1,900,15);
        }
        if (timer == 0){
          Bullet b;
          for (int i = 0; i <=12; i++){
            b = new EnemyBulletR(340+5*i,5*i,x,y,50,2000,10, true);
          }
          for (int i = 0; i <= 55; i++){
            b = new EnemyBulletR(340,5*i,x,y,50,2000,10, true);
          }
          b = new EnemyBulletR(355,275,x,y,50,2000,10, true);
          b = new EnemyBulletR(355,325,x,y,50,2000,10, true);
          b = new EnemyBulletR(385,325,x,y,50,2000,10, true);
          b = new EnemyBulletR(385,275,x,y,50,2000,10, true);
          for (int i = 1; i <= 43; i++){
            b = new EnemyBulletR(400,60+5*i,x,y,10,2000,10, true);
          }

        }
        timer++;
        break;
      case 2:
        break;
      case 3:
        float spread = 20;
        float a = 0.1;
        if (timer % 10 == 0){
          bm.addEnemyBullet(new EnemyBullet(x, y, 0, 0,20,300,10));
          bm.addEnemyBullet(new EnemyBullet(x, y, 0, 0,20,200,20));
          bm.addEnemyBullet(new EnemyBullet(x, y, 0, 0,20,100,30));
        }
        if (timer % 40 == 20){
          //right
          bm.addEnemyBullet(new EnemyBulletA(x-2*spread,y-2*spread,0,5,a,0,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x-spread,y-spread,0,5,a,0,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x,y,0,5,a,0,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x-spread,y+spread,0,5,a,0,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x-2*spread,y+2*spread,0,5,a,0,1,200,20));
          //left
          bm.addEnemyBullet(new EnemyBulletA(x+2*spread,y-2*spread,0,5,a,PI,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x+spread,y-spread,0,5,a,PI,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x,y,0,5,a,PI,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x+spread,y+spread,0,5,a,PI,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x+2*spread,y+2*spread,0,5,a,PI,1,200,20));
          //top
          bm.addEnemyBullet(new EnemyBulletA(x-2*spread,y+2*spread,0,5,a,3*PI/2,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x-spread,y+spread,0,5,a,3*PI/2,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x,y,0,5,a,3*PI/2,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x+spread,y+spread,0,5,a,3*PI/2,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x+2*spread,y+2*spread,0,5,a,3*PI/2,1,200,20));
          //bottom
          bm.addEnemyBullet(new EnemyBulletA(x-2*spread,y-2*spread,0,5,a,PI/2,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x-spread,y-spread,0,5,a,PI/2,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x,y,0,5,a,PI/2,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x+spread,y-spread,0,5,a,PI/2,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x+2*spread,y-2*spread,0,5,a,PI/2,1,200,20));
        }
        if (timer % 40 == 0){
          //tr
          bm.addEnemyBullet(new EnemyBulletA(x,y+2*spread,0,5,0.1,7*PI/4,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x,y+spread,0,5,0.1,7*PI/4,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x,y,0,5,0.1,7*PI/4,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x-spread,y,0,5,0.1,7*PI/4,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x-2*spread,y,0,5,0.1,7*PI/4,1,200,20));
          //tl
          bm.addEnemyBullet(new EnemyBulletA(x,y+2*spread,0,5,a,5*PI/4,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x,y+spread,0,5,a,5*PI/4,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x,y,0,5,a,5*PI/4,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x+spread,y,0,5,a,5*PI/4,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x+2*spread,y,0,5,a,5*PI/4,1,200,20));
          //br
          bm.addEnemyBullet(new EnemyBulletA(x,y-2*spread,0,5,a,PI/4,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x,y-spread,0,5,a,PI/4,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x,y,0,5,a,PI/4,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x-spread,y,0,5,a,PI/4,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x-2*spread,y,0,5,a,PI/4,1,200,20));
          //bl
          bm.addEnemyBullet(new EnemyBulletA(x,y-2*spread,0,5,a,3*PI/4,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x,y-spread,0,5,a,3*PI/4,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x,y,0,5,a,3*PI/4,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x+spread,y,0,5,a,3*PI/4,1,200,20));
          bm.addEnemyBullet(new EnemyBulletA(x+2*spread,y,0,5,a,3*PI/4,1,200,20));
        }
        break;
    }
  }
}
