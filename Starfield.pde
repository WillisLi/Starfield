Particle[] aBunch;
float transparency = 255;
PImage a;
PImage b;
PImage c;
void setup(){
  size(400, 400);
  noStroke();
  a = loadImage("https://image.ibb.co/fOXdt0/spider.png");
  b = loadImage("https://image.ibb.co/j6x3t0/580b585b2edbce24c47b26f6.png");
  c = loadImage("https://image.ibb.co/n3ndt0/sky-with-clouds-1122-2108.jpg");
  aBunch = new Particle[100];
  for(int i = 0; i < aBunch.length; i++){
    if(i == 1){
      aBunch[i] = new OddballParticle();
    }else if(i == 2){
      aBunch[i] = new Jumbo();
    }else{
      aBunch[i] = new NormalParticle();
    }
  }
}

void draw(){
  background(0);
  image(c, 0, 0, 400, 400);
  for(int i = 0; i < aBunch.length; i++){
    aBunch[i].move();
    aBunch[i].show();
  }
  if (transparency > 0) { 
    transparency -= 0.7; 
  }
  tint(255, transparency);
  image(a, 0, 210, 300, 200);
  image(b, 130, 260, 280, 200);
}

interface Particle{
  public void show();
  public void move();
}

class NormalParticle implements Particle{
  double X, Y, Speed, Angle;
  int Color;
  NormalParticle(){
    X = (Math.random()* 300);
    Y = (Math.random() * 100) + 300;
    Speed = Math.random() * 2 + 1;
    Angle = Math.random() * -1 * Math.PI;
    Color = color(255, 100);
  }
  public void move(){
    X = X + Math.cos(Angle)* Speed;
    Y = Y + Math.sin(Angle)* Speed;
  }
  public void show(){
    fill(Color);
    rect((float)X, (float)Y, 10, 10);
  }
}

class OddballParticle implements Particle{
  double X, Y, Speed, Angle;
  int Color;
  OddballParticle(){
    X = Y = 200;
    Speed = Math.random()* 50;
    Angle = Math.random()* 2 * Math.PI;
    Color = color(255, 200);
  }
  public void move(){
    X = X + Math.cos(Angle)* Speed;
    Y = Y + Math.sin(Angle)* Speed;
  }
  public void show(){
    fill(Color);
    ellipse((float)X, (float)Y, 10, 10);
  }
}

class Jumbo extends NormalParticle{
  double X, Y, Speed, Angle;
  int Color;
  Jumbo(){
    X = Y = 200;
    Speed = Math.random()* 30;
    Angle = Math.random()* -1 * Math.PI;
    Color = color(255, 100);
  }
  public void move(){
    X = X + Math.cos(Angle)* Speed;
    Y = Y + Math.sin(Angle)* Speed;
  }
  public void show(){
    fill(Color);
    ellipse((float)X, (float)Y, 40, 40);
  }
}
