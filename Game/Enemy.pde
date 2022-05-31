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
        text("HP: "+HP,900,200);
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
      attack = new Shotgun(x, y, 5, v, 0.01*angle, PI/24);
      attack = new Shotgun(x, y, 5, v, 0.01*angle+ PI, PI/24);
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
  public Boss(){
    super(10000,500,20);
    //phases = {new Shotgun(x, y, 5, v, 0.01*angle, PI/24)};
  }
  public Boss(int[] moves, int[] time){
    super(10000,500,20);
    phases=moves;
    phaseDur=time;
  }
  public void move(){
    switch(currentPhase){
      case 0:  //reset
        if (dist(x,y,width/2,height/2)>10){
          dx = 0.03*(width/2 - x);
          dy = 0.03*(height/2 - y);
          x += dx;
          y += dy;
        }
        else{
          currentPhase = 1;
        }
        break;
      case 1:   //wings
        y = 350 + 150 * sin(0.1* timer);
        x = 500 + 400 * sin(0.012*timer);
        timer++;
        if (timer > 200){
          currentPhase = 2;
        }
        break;
      case 2:   //reset
        if (dist(x,y,width/2,100)>10){
          dx = 0.03*(width/2 - x);
          dy = 0.03*(100 - y);
          x += dx;
          y += dy;
        }
        else {
          currentPhase = 3;
          timer = 0;  
        }
        break;
      case 3:  //walls
        x = 25*(-cos(0.01*timer)+1)*cos(0.1*timer)+width/2;
        y = 25*(-cos(0.01*timer)+1)*sin(0.1*timer) + 100;
        timer++;
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
          attack = new Shotgun(x, y, 5, v, 0.01*angle, PI / 20);
          attack = new Shotgun(x, y, 5, v, 0.01*angle+ PI, PI/20);
          
        }
        break;
      case 3: //walls
        float r = random(PI);
        break;
      default:
        break;
        
    }
    phasecooldown++;
  }
}
