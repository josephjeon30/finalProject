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
    super(500,500,20);
    //phases = {new Shotgun(x, y, 5, v, 0.01*angle, PI/24)};
  }
  public Boss(int[] moves, int[] time){
    super(500,500,20);
    phases=moves;
    phaseDur=time;
  }
  public void display(){
    super.display();
    fill(150,timer*2);
    rect(60,670,620,30);
    fill(255,0,0,timer*2);
    rect(65,675,610*((float)HP/maxHP),20);
  }
  public void move(){
    switch(currentPhase){
      default: 

        y = 150+50*sin(0.1* timer);
        x = 370 + 330*sin(0.012*timer);

        timer++;
    } 
  }
  public void shoot(){
    if(phasecooldown==phaseDur[currentPhase]){//each phase should have it's own duration
      currentPhase=(int)(Math.random() * phases.length);
      phasecooldown=0;
    }
    switch(currentPhase){
      case 1 :
      case 2:
      //etc
      default:
        if(timer%2==0) {
          int v = 5;
          attack = new Shotgun(x, y, 5, v, 0.01*angle, PI / 20);
          attack = new Shotgun(x, y, 5, v, 0.01*angle+ PI, PI/20);
          
        }
    }
    phasecooldown++;
  }
}
