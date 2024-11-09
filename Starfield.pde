//your code here

Particle[] particles;

void setup() {
  size(600, 600);
  particles = new Particle[100];

  for (int i = 0; i < particles.length; i++) {
    if (i == 0) {
      particles[i] = new OddballParticle(); // first particle is the Oddball
    } else {
      particles[i] = new Particle(); // regular particles
    }
  }
}

void draw() {
  background(0);
  
  for (Particle p : particles) {
    p.move();
    p.show();
  }
}

class Particle {
  float x, y;
  float angle, speed;
  color col;

  Particle() {
    x = width / 2;
    y = height / 2;
    angle = random(TWO_PI);
    speed = random(1, 3);
    col = color(random(255), random(255), random(255));
  }

  void move() {
    //x for cos; y for sin
    x += cos(angle) * speed;
    y += sin(angle) * speed;
    
    if (x < 0) x = width;
    if (x > width) x = 0;
    if (y < 0) y = height;
    if (y > height) y = 0;
  }

  void show() {
    fill(col);
    noStroke();
    ellipse(x, y, 5, 5);
  }
}

//diff movement and appearance
class OddballParticle extends Particle {

  OddballParticle() {
    super();
    speed = 5; //faster speed
    col = color(255, 0, 0);
  }

  @Override
  void move() {
    angle += random(-0.1, 0.1);
    super.move();
  }

  @Override
  void show() {
    fill(col);
    noStroke();
    ellipse(x, y, 10, 10);
  }
}
