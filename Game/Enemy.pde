public class Enemy implements Damageable{
  public float x, y, dx, dy;
  public int maxHP;
  public int HP;
  public int type;
  public Phase attack;
  float hitRadius = 10;
  public float timer = 0;
  public int moving;
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
        //textSize(11);
        //text("HP: "+HP,30,height-30);
    }
  }
  public void dealDamage(Damageable other,int dmg){
    other.takeDamage(dmg);
  }
  public void takeDamage(int dmg){
    HP-=dmg;
  }
  public void shoot(){}
  public boolean collisions(Player other){
    return (dist(x,y, yoi.x, yoi.y) < hitRadius/2+yoi.hitRadius/2);
  }
  //public void setX(float k){}
  //public void setY(float k){}
  //public void setDX(float k){}
  //public void setDY(float k){}
  
}
public class ghost extends Enemy{
  public ghost(int h,int x,int y){
    super(h,x,y);
    hitRadius=30;
    dy=2;
    dx=0;
  }
  public void display(){
    fill(210,240,240);
    ellipse(x,y,hitRadius,hitRadius);
  }
  public void shoot(){
    //EnemyBullet b = new EnemyBullet(x,y,dx,dy,10,1000,1000,25);
    //bm.addEnemyBullet(b);
    if(collisions(yoi)) yoi.takeDamage(1);
  }
  public void move(){
    if(y>790)HP=0;
     x=370 + 30*sin(0.012*timer);
     y+=dy;
     //x+=dx;
     timer++;
  }
}

public class Bomb extends Enemy{
  public Bomb(int h,int x,int y, float dx, float dy){
    super(h,x,y);
    this.dx = dx;
    this.dy = dy;
    hitRadius=30;
  }
  
  public void display(){
    fill(255);
    ellipse(x,y,hitRadius,hitRadius);
    fill(0);
    ellipse(x,y,hitRadius-10,hitRadius-1);
  }
  
  public void shoot(){
    if(collisions(yoi)) yoi.takeDamage(10);
    if (this.y >= height+50) {
      float newDir = -PI/2;
      Bullet b;
      b = new EnemyBulletA(x,y,0,20,2,newDir,20,100,200,255,0,0);
      b = new EnemyBulletA(x,y,0,17.5,2,newDir,20,100,175,255,50,0);
      b = new EnemyBulletA(x,y,0,15,2,newDir,20,100,150,255,100,0);
      b = new EnemyBulletA(x,y,0,12.5,2,newDir,20,100,125,255,140,0);
      b = new EnemyBulletA(x,y,0,11,2,newDir,20,200,100,255,175,0);
      b = new EnemyBulletA(x,y,0,9,2,newDir,20,200,75,255,200,0);
      b = new EnemyBulletA(x,y,0,7,2,newDir,20,200,50,255,220,0);
      b = new EnemyBulletA(x,y,0,5,2,newDir,20,200,25,255,255,0);
      HP = 0;
    }
  }
  
  public void move(){
    dy += 0.1;
    x += dx;
    y += dy;
  }
}

public class kama extends Enemy{
  float newDir;
  public kama(int h,int x,int y){
    super(h,x,y);
    hitRadius=30;
    if (y < height / 2){
      dy=5;
    }
    else{
      dy = -5;
    }
    dx=0;
  }
  public kama(int h,int x,int y,float spd){
    super(h,x,y);
    hitRadius=30;
    if (y < height / 2){
      this.dy = spd;
    }
    else{
      this.dy = -spd;
    }
    dx=0;
  }
  public void display(){
    fill(210,240,240);
    ellipse(x,y,hitRadius,hitRadius);
  }
  public void shoot(){
    if(collisions(yoi)) yoi.takeDamage(3);
    if (timer > 200&&timer % 3 == 0) {
      Phase phase = new Shotgun(x,y,3,1,random(2*PI),2*PI/3,10,80);
    }
  }
  public void move(){
    if(y>height+150||y<-150)HP=0;
    if(x<-20||x>800)HP = 0;
    if(timer<150){
      if(timer%30==0&&dy>0){
        dy--;
      }
      else if (timer%30==0&&dy<0){
        dy++;
      }
      y+=dy;
    }else if(timer<200){
     x+=((int)random(3)-1);
     y+=+((int)random(3)-1);
     //x+=dx;
    }else{
      if(timer==200){
        newDir = atan((yoi.y-y)/(yoi.x-x));
        if (yoi.x - x < 0){
          newDir += PI;
        }
      }
      
      x+=cos(newDir)*10;
      y+=sin(newDir)*10;
    }
     timer++;

  }
}
public class fairy extends Enemy{
  //int tick = 0;
  public float k = 0.004;
  
  public fairy(){
    super();
    dx=5;
    dy=0;
  }
  public fairy(int h, int x, int y, int movepattern){
    super(h,x,y);
    dx=0;
    dy=5;
    moving=movepattern;
  }
  public void shoot(){
    if(timer%20==0){
      float newDir = atan((yoi.y-y)/(yoi.x-x));
      if (yoi.x - x < 0){
        newDir += PI;
      }
      attack = new Shotgun(x, y, 3, 3, newDir, PI/10,20);

    }
  }  
  public void move(){
    timer++;
    if(y<-50||x<-50||x>800){
      HP=0;
    }
    switch(moving){
      case 1:
        x=cos(-0.01*timer+4.19)*(200-350*sin(-0.01*timer+4.19))+370;
        y=sin(-0.01*timer+4.19)*(200-350*sin(-0.01*timer+4.19))+400;
        break;
      case 2:
        x=cos(0.01*timer+5.19)*(200-350*sin(0.01*timer+5.19))+370;
        y=sin(0.01*timer+5.19)*(200-350*sin(0.01*timer+5.19))+400;
        break;
      case 3:
        x=370*2-cos(-k*timer+4.6)*(2*600*cos(-k*timer+4.6))-100;
        y=0.8*sin(-k*timer+4.6)*(2*600*cos(-k*timer+4.6))-100;
        break;
      case 4:
        x=cos(-k*timer+4.6)*(2*600*cos(-k*timer+4.6))+100;
        y=0.8*sin(-k*timer+4.6)*(2*600*cos(-k*timer+4.6))-100;
        break;
      default:
        if(timer%30==0){
          dy--;
        }
        
        y+=dy;
        //x = 500 + 400*sin(0.012*timer);
        

    }

  }
}
public class Boss extends Enemy{
  public int currentPhase=0;
  float r = 0;
  float s = 0;
  int t = 0;
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
    if (timer > 1000){
      if (timer % 50 < 20){
        fill(0);
        rect(0,0,width,height);
        image(elira[t],370,height/2);  
      }
      if (timer % 50 == 30) t = (t + 1) % 5;
    }
  }
  public void move(){
    timer++;
    if (currentPhase <9 && this.HP < this.maxHP/4){
      currentPhase = 8;
    }
    switch(currentPhase){
      case 0:  //reset 
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
        if (timer > 1000){
          while (currentPhase % 2 != 0 || currentPhase == 0){
            currentPhase = 2*(int)(random(4)); 
          }
          timer = 0;
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
        
        if (timer > 1000){
          while (currentPhase % 2 != 0 || currentPhase == 2){
            currentPhase = 2*(int)(random(4)); 
          }
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
        x = 25*(-cos(0.01*timer)+1)*cos(0.1*timer)+370;
        y = 25*(-cos(0.01*timer)+1)*sin(0.1*timer) + height/2;
        if (timer > 1000){
          while (currentPhase % 2 != 0 || currentPhase == 4){
            currentPhase = 2*(int)(random(4)); 
          }
          timer = 0;
        }
        break;
      case 6:
        if (dist(x,y,370,height/2)>10 || timer < 100){
          dx = 0.03*(370 - x);
          dy = 0.03*(height/2 - y);
          x += dx;
          y += dy;
        }
        else{
          currentPhase = 7;
          timer = 0;
        }
        break;
      case 7:
        if (timer > 1000){
          while (currentPhase % 2 != 0 || currentPhase == 6){
            currentPhase = 2*(int)(random(4)); 
          }
          timer = 0;
        }
        break;
      case 8:
        if (dist(x,y,370,-100)>5){
          dx = 0.05*(370 - x);
          dy = 0.05*(-100 - y);
          x += dx;
          y += dy;
        }
        else {
          y = -700;
          currentPhase = 9;
          timer = 0;  
        }
        break;
      case 9: //DEATH!!!!
        if (timer > 400 && timer < 600){
          if (timer == 401){
            x = 0;
            y = height/2;
          }
          x += 4;
          y = height/2 - 300*sin((PI/200)*(timer-400));
        }
        else if (timer > 650 && timer < 850){
          if (timer == 651){
            x = 740;
            y = height/2;
          }
          x -= 4;
          y = height/2 + 300*sin((PI/200)*(timer-650));
        }
        else if (timer > 900 && timer < 1000){
          if (dist(x,y,370,100)>5){
            dx = 0.05*(370 - x);
            dy = 0.05*(100 - y);
            x += dx;
            y += dy;
          }
        }
        else if (timer > 1000){
          x = 370 + 75 * cos(timer/20);
          y = 100 + 100 * sin(timer/10);
        }
        else {
          x = 370;
          y = -700;
        }
        if(this.HP < this.maxHP/10){
          currentPhase = 10;
        }
        break;
      case 10:  //death
        timer = 420;
        if (dist(x,y,370,height/2)>10){
          dx = 0.03*(370 - x);
          dy = 0.03*(height/2 - y);
          x += dx;
          y += dy;
        }
        break;
      default:
        break;
    } 
  }
  public void shoot(){
    switch(currentPhase){
      case 1: //wings
        if(timer%3==0) {
          int v = 5;
          attack = new Shotgun(x, y, 5, v, -0.01*timer+PI/8, PI / 20,10);
          attack = new Shotgun(x, y, 5, v, -0.01*timer+ 9*PI/8, PI/20,10);
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
        if (timer % 200 == 0){
          r = (PI/4)*(int)random(4);
        }
        if (timer % 200 > 100){
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
      case 7:
        if (timer == 1) currentStage.enemyonfield.add(new kama(100,370,-100,4));
        if (timer > 300 && timer < 800 && timer % 100 == 0){
          float spd = 4;
          currentStage.enemyonfield.add(new kama(100,100,-100,spd));
          currentStage.enemyonfield.add(new kama(100,370,-100,spd));
          currentStage.enemyonfield.add(new kama(100,640,-100,spd));
          
          currentStage.enemyonfield.add(new kama(100,100,height+100,spd));
          currentStage.enemyonfield.add(new kama(100,370,height+100,spd));
          currentStage.enemyonfield.add(new kama(100,640,height+100,spd));
        }
        break;
      case 9:
        if (timer > 10 && timer < 180 && timer % 20 == 0){
          currentStage.enemyonfield.add(new kama(100,(int)timer*4,-100,4));
          currentStage.enemyonfield.add(new kama(100,740-(int)timer*4,height+100,4));
        }
        else if (timer > 400 && timer < 600){
          attack = new Shotgun(x,y,6,3,random(2*PI),2*PI/6,10,200);
        }
        else if (timer > 650 && timer < 850){
          attack = new Shotgun(x,y,6,3,random(2*PI),2*PI/6,10,200);
        }
        else if (timer > 1000){
          if(timer%3==0) {
            int v = 5;
            attack = new Shotgun(x, y, 5, v, 0, PI / 20,10);
            attack = new Shotgun(x, y, 5, v, PI, PI/20,10);
          }
          if (timer % 100 == 0){
            bm.enemyBullets = new LinkedList<EnemyBullet>();
            float newDir = atan((yoi.y-y)/(yoi.x-x));
            if (yoi.x - x < 0){
              newDir += PI;
            }
            Bullet b;
            b = new EnemyBulletA(x,y,-20,10,2,newDir,20,100,200,255,255,0);
          }
          if (timer % 100 == 50){
            bm.enemyBullets = new LinkedList<EnemyBullet>();
            r = (PI/4)*(int)random(4);
          }
          if (timer % 100 > 50){
            if (timer % 5 == 0){
              attack = new Wall(370 - 400*cos(r) + 35*cos(r + PI/2), 350 - 400*sin(r)+35*sin(r + PI/2), 20, 3, r, 70,20);
              attack = new Wall(370 + 400*cos(r), 350 + 400*sin(r), 20, 3, r+PI, 70,20);
            }
          }
        }
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
    timer++;
    if (currentPhase < 10 && this.HP < this.maxHP/10){
      currentPhase = 10;
    }
    switch(currentPhase){
      case 0:  //reset 
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
      case 1: //Circular
        if (timer > 1000){
          while (currentPhase % 2 != 0 || currentPhase == 0){
            currentPhase = 2*(int)(random(5)); 
          }
          bm.enemyBullets = new LinkedList<EnemyBullet>();
          timer = 0;
        }
        break;
      case 2:  //reset
        if (dist(x,y,370,100)>10||timer < 100){
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
        float newDir = atan((yoi.y-y)/(yoi.x-x));
        if (yoi.x - x < 0){
          newDir += PI;
        }
        x += 3*cos(newDir);
        y += 3*sin(newDir);
        if (timer > 1000){
          while (currentPhase % 2 != 0 || currentPhase == 2){
            currentPhase = 2*(int)(random(5)); 
          }
          bm.enemyBullets = new LinkedList<EnemyBullet>();
          timer = 0;
        }
        break;
      case 4:  //reset
        if (dist(x,y,370,100)>10||timer < 100){
          dx = 0.03*(370 - x);
          dy = 0.03*(100 - y);
          x += dx;
          y += dy;
        }
        else{
          currentPhase = 5;
          timer = 0;
        }
        break;
      case 5:
        if (timer == 1){
          dy = 2;
          dx = 2;
        }
        if (x < 0 || x > 740){
          dx *= -1;
        }
        if (y < 0 || y > height) {
          dy *= -1;
        }
        super.move();
        if (timer > 1000){
          while (currentPhase % 2 != 0 || currentPhase == 4){
            currentPhase = 2*(int)(random(5)); 
          }
          timer = 0;
        }
        break;
      case 6:
        if (dist(x,y,370,200)>10||timer < 100){
          dx = 0.03*(370 - x);
          dy = 0.03*(200 - y);
          x += dx;
          y += dy;
        }
        else{
          currentPhase = 7;
          timer = 0;
        }
        break;
      case 7:
        if (timer > 1000){
          while (currentPhase % 2 != 0 || currentPhase == 6){
            currentPhase = 2*(int)(random(5)); 
          }
          timer = 0;
        }
        break;
      case 8:
        if (dist(x,y,370,200)>10||timer < 100){
          dx = 0.03*(370 - x);
          dy = 0.03*(200 - y);
          x += dx;
          y += dy;
        }
        else{
          currentPhase = 9;
          timer = 0;
        }
        break;
      case 9:
        if (timer > 1000){
          while (currentPhase % 2 != 0 || currentPhase == 8){
            currentPhase = 2*(int)(random(5)); 
          }
          timer = 0;
        }
        break;
      case 10:  //death
        bm.enemyBullets = new LinkedList<EnemyBullet>();
        timer = 420;
        if (dist(x,y,370,height/2)>10){
          dx = 0.03*(370 - x);
          dy = 0.03*(height/2 - y);
          x += dx;
          y += dy;
        }
        break;
    } 
  }
  public void shoot(){
    switch(currentPhase){
      case 0:
        break;
      case 1:
        if (timer % 50 == 0){
          r = 40*(int)random(height/80)-90;
          s = 40*(int)random(height/80)-90+20;
        }
        if (timer % 5 == 0){
          Bullet b = new EnemyBulletR(370,r,x,y,5,1,900,15);
          b = new EnemyBulletR(370,s,x,y,-5,1,900,15);
        }
        if (timer == 1){
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
        if (timer < 140 && timer % 20 == 1){
          Bullet b;
          b = new EnemyBulletR(370,-10,x,y,-1,100,2000,30,true);
          b = new EnemyBulletR(370,height+10,x,y,-1,100,2000,30,true);
          b = new EnemyBulletR(-10,height/2,x,y,-1,100,2000,30,true);
          b = new EnemyBulletR(370+height/2+10,height/2,x,y,-1,100,2000,30,true);
          
          b = new EnemyBulletR(370,-70,x,y,1,100,2000,30,true);
          b = new EnemyBulletR(370,height+70,x,y,1,100,2000,30,true);
          b = new EnemyBulletR(-70,height/2,x,y,1,100,2000,30,true);
          b = new EnemyBulletR(370+height/2+70,height/2,x,y,1,100,2000,30,true);
          
          b = new EnemyBulletR(370,-110,x,y,-1,100,2000,30,true);
          b = new EnemyBulletR(370,height+110,x,y,-1,100,2000,30,true);
          b = new EnemyBulletR(-110,height/2,x,y,-1,100,2000,30,true);
          b = new EnemyBulletR(370+height/2+110,height/2,x,y,-1,100,2000,30,true);
        }
      case 2:
        break;
      case 3:  //squarze
        float spread = 25;
        float a = 0.01;
        if (timer % 20 == 0){
          bm.addEnemyBullet(new EnemyBullet(x, y, 0, 0,20,600,10));
          bm.addEnemyBullet(new EnemyBullet(x, y, 0, 0,20,400,20));
          bm.addEnemyBullet(new EnemyBullet(x, y, 0, 0,20,200,30));
        }
        if (timer % 40 == 20){
          float c = random(45)+210;
          float d = random(255);
          //right
          bm.addEnemyBullet(new EnemyBulletA(x-2*spread,y-2*spread,0,5,a,0,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x-spread,y-spread,0,5,a,0,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x,y,0,5,a,0,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x-spread,y+spread,0,5,a,0,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x-2*spread,y+2*spread,0,5,a,0,1,200,20,c,d,0));
          //left
          bm.addEnemyBullet(new EnemyBulletA(x+2*spread,y-2*spread,0,5,a,PI,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x+spread,y-spread,0,5,a,PI,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x,y,0,5,a,PI,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x+spread,y+spread,0,5,a,PI,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x+2*spread,y+2*spread,0,5,a,PI,1,200,20,c,d,0));
          //top
          bm.addEnemyBullet(new EnemyBulletA(x-2*spread,y+2*spread,0,5,a,3*PI/2,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x-spread,y+spread,0,5,a,3*PI/2,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x,y,0,5,a,3*PI/2,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x+spread,y+spread,0,5,a,3*PI/2,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x+2*spread,y+2*spread,0,5,a,3*PI/2,1,200,20,c,d,0));
          //bottom
          bm.addEnemyBullet(new EnemyBulletA(x-2*spread,y-2*spread,0,5,a,PI/2,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x-spread,y-spread,0,5,a,PI/2,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x,y,0,5,a,PI/2,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x+spread,y-spread,0,5,a,PI/2,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x+2*spread,y-2*spread,0,5,a,PI/2,1,200,20,c,d,0));
        }
        if (timer % 40 == 0){
          float c = random(45)+210;
          float d = random(255);
          //tr
          bm.addEnemyBullet(new EnemyBulletA(x,y+2*spread,0,5,a,7*PI/4,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x,y+spread,0,5,a,7*PI/4,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x,y,0,5,a,7*PI/4,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x-spread,y,0,5,a,7*PI/4,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x-2*spread,y,0,5,a,7*PI/4,1,200,20,c,d,0));
          //tl
          bm.addEnemyBullet(new EnemyBulletA(x,y+2*spread,0,5,a,5*PI/4,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x,y+spread,0,5,a,5*PI/4,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x,y,0,5,a,5*PI/4,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x+spread,y,0,5,a,5*PI/4,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x+2*spread,y,0,5,a,5*PI/4,1,200,20,c,d,0));
          //br
          bm.addEnemyBullet(new EnemyBulletA(x,y-2*spread,0,5,a,PI/4,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x,y-spread,0,5,a,PI/4,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x,y,0,5,a,PI/4,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x-spread,y,0,5,a,PI/4,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x-2*spread,y,0,5,a,PI/4,1,200,20,c,d,0));
          //bl
          bm.addEnemyBullet(new EnemyBulletA(x,y-2*spread,0,5,a,3*PI/4,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x,y-spread,0,5,a,3*PI/4,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x,y,0,5,a,3*PI/4,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x+spread,y,0,5,a,3*PI/4,1,200,20,c,d,0));
          bm.addEnemyBullet(new EnemyBulletA(x+2*spread,y,0,5,a,3*PI/4,1,200,20,c,d,0));
        }
        break; 
      case 5:  //PHD
        if (timer % 100 == 0){
          float newDir = atan((yoi.y-y)/(yoi.x-x));
          if (yoi.x - x < 0){
            newDir += PI;
          }
          Bullet b;
          b = new EnemyBulletA(x,y,-20,20,2,newDir,20,100,200,255,0,0);
          b = new EnemyBulletA(x,y,-20,17.5,2,newDir,20,100,175,255,50,0);
          b = new EnemyBulletA(x,y,-20,15,2,newDir,20,100,150,255,100,0);
          b = new EnemyBulletA(x,y,-20,12.5,2,newDir,20,100,125,255,140,0);
          b = new EnemyBulletA(x,y,-20,11,2,newDir,20,200,100,255,175,0);
          b = new EnemyBulletA(x,y,-20,9,2,newDir,20,200,75,255,200,0);
          b = new EnemyBulletA(x,y,-20,7,2,newDir,20,200,50,255,220,0);
          b = new EnemyBulletA(x,y,-20,5,2,newDir,20,200,25,255,255,0);
        }
        if (timer % 3 == 0){
          attack = new Shotgun(x,y,3,2,random(2*PI),2*PI/3,15,200,255,0,0);
          attack = new Shotgun(x,y,3,1.75,random(2*PI),2*PI/3,12,200,255,125,0);
          attack = new Shotgun(x,y,3,1.5,random(2*PI),2*PI/3,10,200,255,255,0);
        }
        break;
      case 7:
        if (timer % 25 == 0){
          currentStage.enemyonfield.add(new Bomb(10000,(int)x,(int)y,random(6)-3,-5));
        }
        break;
      case 9:
        if (timer % 150 == 0){
          int k = (int)random(5);
          for (int i = 0; i < 5; i++){
            if (k != i){
              currentStage.enemyonfield.add(new Bomb(10000,740/5 * i + 740/10,0,0,0));
            }
          }
        }
        break;
    }
  }
}
