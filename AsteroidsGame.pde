Spaceship ufo;
Asteroid [] rocks;
Star [] starfield;
public void setup() 
{
	size(600,600);
	background(0);
	starfield = new Star[100];
	for (int i = 0; i < starfield.length; i++)
	{
		starfield[i] = new Star();
	}
	rocks = new Asteroid[20];
	for (int i = 0; i < rocks.length; i++)
	{
		rocks[i] = new Asteroid();
	}
	ufo = new Spaceship();
	ufo.setX(width/2);
	ufo.setY(height/2);
}
public void draw()
{
	background(0);
 	for (int i = 0; i < starfield.length; i++)
 	{
  		starfield[i].show();
  	}
	ufo.move();
	ufo.show();
	for (int i = 0; i < rocks.length; i++)
	{
		rocks[i].setX((int)(Math.random()*width));
		rocks[i].setY((int)(Math.random()*height));
		rocks[i].move();
		rocks[i].show();
	}
}
//how do you make it so that you can turn and accelerate at the same time
public void keyPressed()
{
	if(key == 'w')
	{
		ufo.accelerate(1);
	}
	if(key == 's')
	{
		ufo.accelerate(-1);
	}
	if(key == 'a')
	{
		ufo.turn(-25);
	}
	if(key == 'd')
	{
		ufo.turn(25);
	}
	if(key == 'h')
	{
		ufo.setX((int)(Math.random()*600));
		ufo.setY((int)(Math.random()*600));
		ufo.setDirectionX(0);
		ufo.setDirectionY(0);
	}
}