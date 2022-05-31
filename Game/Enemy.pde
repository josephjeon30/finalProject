public class Enemy implements Damageable{
  public float x, y, dx, dy;
  public int HP;
  public int type;
  public Phase attack;
  float hitRadius = 10;
  public float timer = 0;
  
  public Enemy(){

    this(80,0,0);
  }
  public Enemy(int hp,int spawnX,int spawnY){
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
    if(timer%2==0){
      int v = 3;
      attack = new Shotgun(x, y, 5, v, 0.01*angle, PI/24,10);
      attack = new Shotgun(x, y, 5, v, 0.01*angle+ PI, PI/24,10);
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
  public int[] phases;
  public int[] phaseDur;
  public int currentPhase=0;
  public int phasecooldown=0;
  float r = 0;
  int countDown = 0;
  
  public Boss(){
    super(10000,370,20);
    //phases = {new Shotgun(x, y, 5, v, 0.01*angle, PI/24)};
  }
  public Boss(int[] moves, int[] time){
    super(10000,370,20);
    phases=moves;
    phaseDur=time;
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
      case 5:
        timer++;
        x = 25*(-cos(0.01*timer)+1)*cos(0.1*timer)+370;
        y = 25*(-cos(0.01*timer)+1)*sin(0.1*timer) + height/2;
        if (timer > 1000){
          currentPhase = 0;
          timer = 0;
        }
        break;
    } 
  }
  public void shoot(){
    /**
    if(phasecooldown==phaseDur[currentPhase]){//each phase should have it's own duration
      currentPhase=(int)(Math.random() * phases.length);
      phasecooldown=0;
    }**/
    switch(currentPhase){
      case 1: //wings
        if(timer%2==0) {
          int v = 5;
          attack = new Shotgun(x, y, 5, v, 0.01*angle, PI / 20,10);
          attack = new Shotgun(x, y, 5, v, 0.01*angle+ PI, PI/20,10);
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
      case 5:  //absolute bs
        if (timer % 2 == 0){
          int k = 2+(int)random(4);
          attack = new Shotgun(x, y, k,3,random(PI), 2 * PI / k, 10);
        }
        break;
      default:
        break;
        
    }
    phasecooldown++;
  }
}
