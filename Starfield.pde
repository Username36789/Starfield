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
  
  for (int i = 0; i < particles.length; i++) {
    Particle p = particles[i];
    p.move();
    p.show();
  }
}

class Particle {
  double x, y;
  double angle, speed;
  color col;

  Particle() {
    x = width / 2.0;
    y = height / 2.0;
    angle = Math.random() * TWO_PI;
    speed = (Math.random() * 2) + 1;
    col = color((int) Math.round(Math.random() * 255), (int) Math.round(Math.random() * 255), (int) Math.round(Math.random() * 255));
  }

  void move() {
    //x for cos; y for sin
    x += Math.cos(angle) * speed;
    y += Math.sin(angle) * speed;
    
    if (x < 0) x = width;
    if (x > width) x = 0;
    if (y < 0) y = height;
    if (y > height) y = 0;
  }

  void show() {
    fill(col);
    noStroke();
    ellipse((float) x, (float) y, 5, 5);
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
    angle += (Math.random() * 0.2) - 0.1;
    super.move();
  }

  @Override
  void show() {
    fill(col);
    noStroke();
    ellipse((float) x, (float) y, 10, 10);
  }
}
