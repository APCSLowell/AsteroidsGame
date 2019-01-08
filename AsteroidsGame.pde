Spaceship ufo;
//Asteroid[] rocks;
ArrayList <Asteroid> rocks;
Star[] starfield;
int rocksNum = 40;
public void setup() 
{
	size(600,600);
	background(0);
	// rocks = new Asteroid[40];
	// for (int i = 0; i < rocks.length; i++)
	// {
	// 	rocks[i] = new Asteroid((int)(Math.random()*width), (int)(Math.random()*height), (int)(Math.random()*3)+1);
	// }
	rocks = new ArrayList <Asteroid>();
	for (int i = 0; i < rocksNum; i++)
	{
		rocks.add(i,new Asteroid((int)(Math.random()*width), (int)(Math.random()*height), (int)(Math.random()*3)+1));
	}
	starfield = new Star[100];
	for (int i = 0; i < starfield.length; i++)
	{
		starfield[i] = new Star();
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
  	for (int i = 0; i < rocks.size(); i++)
  	{
  		// rocks[i].move();
  		// rocks[i].show();
  		rocks.get(i).move();
  		rocks.get(i).show();
  		if (dist(ufo.getX(), ufo.getY(), rocks.get(i).getX(), rocks.get(i).getY()) <= 37)
  		{
  			rocks.remove(i);
  		}
  	}
	ufo.move();
	ufo.show();
}
//how do you make it so that you can turn and accelerate at the same time
public void keyPressed()
{
	if(key == 'w')
	{
		ufo.accelerate(.25);
	}
	if(key == 's')
	{
		ufo.accelerate(-.25);
	}
	if(key == 'a')
	{
		ufo.turn(-17);
	}
	if(key == 'd')
	{
		ufo.turn(17);
	}
	if(key == 'h')
	{
		ufo.setX((int)(Math.random()*600));
		ufo.setY((int)(Math.random()*600));
		ufo.setDirectionX(0);
		ufo.setDirectionY(0);
		//make a force field
	}
}