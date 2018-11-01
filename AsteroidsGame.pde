Spaceship bob;
Star[] bobby;
public void setup() 
{
  size(400,400);
  background(200);
  bob = new Spaceship();
  bobby = new Star[10];
  for(int i=0;i<bobby.length;i++)
  {
    bobby[i] = new Star();
  }
}
public void draw() 
{
 background(200);
 bob.show();
 bob.move();
 for(int i=0;i<bobby.length;i++)
 {
   bobby[i].showAsteroids();
 }
}
public void keyPressed()
{
 if(key == 'c')
 {
   background(200);
   bob.show();
 }
 if(key == 'w')
  {
    bob.accelerate(0.5);
    background(200);
    bob.show();
    key='c';
  }
  if(key == 'd')
  {
    background(200);
    bob.show();
    bob.turn(5);
    key='c';
  }
  if(key == 'a')
  {
    background(200);
    bob.show();
    bob.turn(-5);
    key='c';
  }
  if(key == 'h')
  {
    bob.setPointDirection(((int)(Math.random()*360)));
    bob.setX((int)(Math.random()*375+25));
    bob.setY((int)(Math.random()*375+25));
    bob.setDirectionX(0);
    bob.setDirectionY(0);
  }
}
