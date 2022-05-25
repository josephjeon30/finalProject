BulletManager bm = new BulletManager();
float angle = 0;
boolean alive = true;
boolean[] keys; 
Stage currentStage;

Player yoi = new Player();

void setup(){
  size(1000, 750);
  noStroke();
  keys = new boolean[255];
}
  
void keyPressed() {
  if (key == CODED && keyCode < 255) {
    keys[keyCode] = true;
  }
}

void keyReleased() {
  if (key == CODED && keyCode < 255) {
    keys[keyCode] = false;
  }
}

void draw(){
  
  fill(color(0, 0, 0, 50));
  rect(0,0,width, height);
  
  if (keys[UP] || keys[DOWN]){
    if (keys[UP]) yoi.dy -= 1;
    if (keys[DOWN]) yoi.dy += 1;
  }
  else yoi.dy *= 0.6;
  if (keys[LEFT] || keys[RIGHT]){
    if (keys[LEFT]) yoi.dx -= 1;
    if (keys[RIGHT]) yoi.dx += 1;
  }
  else yoi.dx *= 0.6;
  
  yoi.dx = clamp(yoi.dx, -7, 7);
  yoi.dy = clamp(yoi.dy, -7, 7);
  
  yoi.move();
  yoi.display();
  
  bm.move();
  bm.display();
  
  angle += 0.01;    
    
}

public float clamp(float input, float low, float high){
  if (input < low) return low;
  else if (input > high) return high;
  else return input;
}

  
