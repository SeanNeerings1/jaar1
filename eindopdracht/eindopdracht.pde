Player player;
Platform ground;
Platform platform1;

void setup() {
  fullScreen();
  
  player = new Player(100, 400, 50, 50);
  ground = new Platform(0, 550, 800, 50);
  platform1 = new Platform(300, 400, 200, 20);
  
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    player.xVelocity = -5;
  } else if (key == 'd' || key == 'D') {
    player.xVelocity = 5;
  } else if (key == 'w' || key == 'W') {
    if (player.onGround) {
      player.yVelocity = -10;
      player.onGround = false;
    }
  }
}

void keyReleased() {
  if (key == 'a' || key == 'A' || key == 'd' || key == 'D') {
    player.xVelocity = 5;
  }
}

void draw() {
  background(135, 206, 235); 
  
  player.display();
  ground.display();
  platform1.display();
}

class Player {
  float x, y, w, h;
  float yVelocity = 0;
  float xVelocity = 0;
  float gravity = 0.5;
  boolean onGround = false;


  Player(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void display() {
    fill(255, 0, 0); 
    rect(x, y, w, h);
  }
}

class Platform {
  float x, y, w, h;
  
  Platform(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void display() {
    fill(0, 255, 0); 
    rect(x, y, w, h);
  }
}