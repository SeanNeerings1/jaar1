Player player;
Platform ground;
Platform platforms;

void setup() {
  fullScreen();
  
  player = new Player(100, 400, 50, 50);
  ground = new Platform(0, 550, width, 50);
  platform = new ArrayList<Platform>();
  platforms.add(new Platform(300, 400, 50, 50));
  platforms.add(new Platform(600, 500, 50, 50));
  platforms.add(new Platform(900, 350, 50, 50));
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
  } else if (key == ' ' || key == ' ') {
    if (player.onGround) {
      player.yVelocity = -10;
      player.onGround = false;
    }
  }
}

void keyReleased() {
  if (key == 'a' || key == 'A' || key == 'd' || key == 'D') {
    player.xVelocity = 0;
  }

  
}

void update() {
  player.x += player.xVelocity;
  player.y += player.yVelocity;
  
  player.onGround = false;

  if (!player.onGround) {
    player.yVelocity += player.gravity;
  }
  
 if (player.y + player.h >= ground.y && 
      player.x + player.w > ground.x && player.x < ground.x + ground.w) {
    player.y = ground.y - player.h;
    player.yVelocity = 0;
    player.onGround = true;
  }
}



void draw() {
  background(135, 206, 235); 
  
  update();
  
  player.display();
  ground.display();
  platforms.display();
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
  
  Platforms(float x, float y, float w, float h) {
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