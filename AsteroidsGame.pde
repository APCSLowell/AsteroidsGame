//your variable declarations here
Spaceship bob;
Star s[] = new Star[200];

public void setup()
{
  size(500, 500);
  bob = new Spaceship();
  for (int i = 0; i < 200; i++) {
    s[i] = new Star();
  }
}
public void draw()
{
  background(0);
  for (int i = 0; i < 200; i++) {
    s[i].show();
  }
} 
public void keyPressed()
{
    if ( key == 'q' || key == 'Q') {
      bob.setX((int)(Math.random()*width));
      bob.setY((int)(Math.random()*height));
      bob.myXspeed = 0;
      bob.myYspeed = 0;
      bob.setPointDirection((int)(Math.random()*36)*10);
      background(0);
    }
}
