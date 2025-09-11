float y = 500;
float y1 = 500;
float x = 0;

void setup() {
  size(500, 500);
}

void draw() {
  background(0, 255, 0);
  y = y - 6;
  y1 =y1 - 3;
  x = x +3;
  //println(snelheid);
  ellipse(100, y, 30, 30);
  ellipse(200, y1, 30, 30);
  rect(x, 250, 20, 2);
  if (y <= 0) {
    y = 500;
  };
  if (y1 <= 0) {
    y1 = 500;
  };
  if (x >= 500) {
    x = 0;
  };
}
