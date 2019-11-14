import java.util.Date;

//your variable declarations here
Spaceship spaceship;
ArrayList<Star> starList;
ArrayList<Asteroid> asteroidList;
boolean accelerating;
boolean rightDown;
boolean leftDown;
boolean hyperspace;
DumbObject engineAudio;

public void setup() 
{
  //your code here
	size(500, 500);
	spaceship = new Spaceship(3, new int[]{-8, 16, -8}, new int[]{-8, 0, 8}, color(255), width/2, height/2, 0, 0, 0); 
	starList = new ArrayList<Star>();
	for (int i = 0; i < 50; i++)
	{
		starList.add(new Star((int)(width*Math.random()), (int)(height*Math.random())));
	}

	asteroidList = new ArrayList<Asteroid>();
	int[] asteroidVertexesX = {15, 8, 0, -7, -14,  -8, -6,    0,  8};
	int[] asteroidVertexesY = {3, 15, 8,  4,  -2, -18, -10, -3, -4};
	for (int i = 0; i < 15; i++)
	{
		asteroidList.add(new Asteroid(asteroidVertexesX.length, asteroidVertexesX, asteroidVertexesY, color(240), Math.random()*width, Math.random()*height, Math.random()*5-2, Math.random()*5-2,Math.random()*360, Math.random()*5-2));
	}
	//asteroidList.add(new Asteroid(asteroidVertexesX.length, asteroidVertexesX, asteroidVertexesY, color(240), Math.random()*width, Math.random()*height, 0, 0, 0, 0));
	accelerating = false;
	rightDown = false;
	leftDown = false;

	//console.log(javascript);

	/*try
	{
		console.log(javascript);
		if (javascript)
		{
			size(50, 50);
		}
	}
	catch(Exception e)
	{

	}*/
}
public void draw() 
{
 	background(0);
	spaceship.show(accelerating);
	spaceship.move();

	for (Star i : starList)
	{
		i.show();
	}

	for (Asteroid i : asteroidList)
	{
		i.show();
		i.move();
	}

	if (!spaceship.inHyperspace())
	{
		if (accelerating)
		{
			spaceship.accelerate(0.1);
		}

		if (leftDown && rightDown == false)
		{
			spaceship.turn(-4);
		}
		else if (rightDown && leftDown == false)
		{
			spaceship.turn(4);
		}
	}
}

public void keyPressed()
{
	switch(key)
	{
		case 'w':
		case 'W':
			accelerating = true;
			break;
		case 's':
		case 'S':
			accelerating = false;
			break;
		case 'a':
		case 'A':
			leftDown = true;
			break;
		case 'd':
		case 'D':
			rightDown = true;
			break;
		case 'f':
		case 'F':
			spaceship.hyperspace();
			break;
	}
}

public void keyReleased()
{
	switch(key)
	{
		case 'w':
		case 'W':
			accelerating = false;
			break;
		/*case 's':
		case 'S':
			accelerating = false;
			break;*/
		case 'a':
		case 'A':
			leftDown = false;
			break;
		case 'd':
		case 'D':
			rightDown = false;
			break;
	}
}
public void handleKeys()
{
	
}

class DumbObject
{
	public int currentTime;
	public void stop(){}
}