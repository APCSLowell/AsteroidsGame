//your variable declarations here
Spaceship spaceship;
ArrayList<Star> starList;
boolean accelerating;
boolean rightDown;
boolean leftDown;
boolean javascript;
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
	accelerating = false;
	rightDown = false;
	leftDown = false;

	//console.log(javascript);

	try
	{
		if (javascript)
		{
			size(50, 50);
		}
	}
	catch(Exception e)
	{

	}
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

public void keyPressed()
{
	switch(keyCode)
	{
		case UP:
			accelerating = true;
			break;
		case DOWN:
			accelerating = false;
			break;
		case LEFT:
			leftDown = true;
			break;
		case RIGHT:
			rightDown = true;
			break;
	}
}

public void keyReleased()
{
	switch(keyCode)
	{
		case UP:
			accelerating = false;
			try {
				if (javascript)
				{
					System.out.println("doo");
					engineAudio.stop();
					engineAudio.currentTime = 0;
				}
			}
			catch(Exception _) {}
			break;
		case DOWN:
			break;
		case LEFT:
			leftDown = false;
			break;
		case RIGHT:
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