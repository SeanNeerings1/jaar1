Player player;
ArrayList<Platform> platforms;
ArrayList<ShowPlatforms> showplatform;


boolean[] keys = new boolean[128];

void setup() {
  fullScreen();
  
  player = new Player(100, 400, 50, 50);

  platforms = new ArrayList<Platform>();
  platforms.add(new Platform(0, 550, 300, height)); // Start platform
  platforms.add(new Platform(400, 550, 100, 20)); 
  platforms.add(new Platform(600, 500, 100, 20));
  platforms.add(new Platform(900, 450, 20, 20));
  platforms.add(new Platform(1000, 400, 20, 20));
  platforms.add(new Platform(width - 286, 550, 300, height)); // Finish platform

  
  showplatform = new ArrayList<ShowPlatforms>();
  showplatform.add(new ShowPlatforms(0, 550, 300, height)); // Start platform
  showplatform.add(new ShowPlatforms(400, 250, 100, 20)); 
  showplatform.add(new ShowPlatforms(600, 200, 100, 20));
  showplatform.add(new ShowPlatforms(900, 150, 20, 20));
  showplatform.add(new ShowPlatforms(1000, 100, 20, 20));
  showplatform.add(new ShowPlatforms(width - 286, 550, 300, height)); // Finish platform
}






void keyPressed() {
  if (key < 128) keys[key] = true;
}

void keyReleased() {
  if (key < 128) keys[key] = false;
}

void update() {
  if (keys['a'] || keys['A']) {
    player.xVelocity = -5;
  } else if (keys['d'] || keys['D']) {
    player.xVelocity = 5;
  } else {
    player.xVelocity = 0;
  }

  if ((keys['w'] || keys['W'] || keys[' ']) && player.onGround) {
    player.yVelocity = -10;
    player.onGround = false;
  }

  player.x += player.xVelocity;
  player.y += player.yVelocity;
  player.yVelocity += player.gravity;
  player.onGround = false;

  if (player.y > height + 100) player.respawn();

  for (Platform p : platforms) {
    if (player.x + player.w > p.x && player.x < p.x + p.w &&
        player.y + player.h > p.y && player.y < p.y + p.h) {

      if (player.yVelocity > 0 && player.y + player.h - p.y < 20) {
        player.y = p.y - player.h;
        player.yVelocity = 0;
        player.onGround = true;
      } 
      else if (player.yVelocity < 0 && p.y + p.h - player.y < 100) {
        player.y = p.y + p.h;
        player.yVelocity = 4;
      } 
      else {
        if (player.x + player.w / 2 < p.x + p.w / 2)
          player.x = p.x - player.w;
        else
          player.x = p.x + p.w;
        player.xVelocity = 0;
      }
    }
  }
}

void draw() {
  background(135, 206, 235); 
  
  update();
  
  player.display();
  
  for (ShowPlatforms s : showplatform) {
    s.display();
  }
}

class Player {
  float x, y, w, h;
  float yVelocity = 0;
  float xVelocity = 0;
  float gravity = 0.5;
  boolean onGround = false;
  float spawnX, spawnY;

  Player(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    spawnX = x;
    spawnY = y;
  }

  void respawn() {
    x = spawnX;
    y = spawnY;
    xVelocity = 0;
    yVelocity = 0;
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

class ShowPlatforms {
  float x, y, w, h;
  
  ShowPlatforms(float x, float y, float w, float h) {
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
