Particle[] star = new Particle[100];
void setup()
{
  size(800, 600);
  background(0);
  for (int i = 0; i < star.length; i++){
    star[i] = new Particle();
    star[0] = new OddballParticle();
  }
}
void draw()
{
  background(0);
  for (int i = 0; i < star.length; i++){
    star[i].show();
    star[i].move();
  }
}
class Particle
{
  double myX, myY, myAngle, mySpeed;
  color myColor;
  
  Particle(){
    myX = width / 2;
    myY = height / 2;
    myColor = color((int)(Math.random()*255),(int)(Math.random()*255), (int)(Math.random()*255));
    myAngle = Math.random()*360; 
    mySpeed = Math.random()*5 + 1;
  }
  void show(){
    // random colored stars
    fill(myColor);
    star((int)myX, (int)myY, 10, 40, 5);
  }
  void move(){
    // moves star outward and back inward
    myX += (Math.cos(myAngle))*(mySpeed);
    myY += (Math.sin(myAngle))*(mySpeed);
    myAngle+= 0.02;
  }
}

class OddballParticle extends Particle
{
  OddballParticle(){
    myX = width / 2;
    myY = height / 2;
    myColor = color(210, 155, 100);
    myAngle = Math.random()*360; 
    mySpeed = Math.random()*1;
  }
  void show(){
    //UFO
    fill(myColor);
    ellipse((int)myX, (int)myY, 100, 30);
    fill(255);
    ellipse((int)myX, (int)myY - 10, 30, 30);
  }
  void move(){
    //Moves outward only
    myX += (Math.cos(myAngle))*(mySpeed);
    myY += (Math.sin(myAngle))*(mySpeed);
  }
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
