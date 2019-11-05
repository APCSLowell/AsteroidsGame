//your variable declarations here
Spaceship spaceship;
public void setup() 
{
  //your code here
	size(500, 500);
	spaceship = new Spaceship(3, new int[]{-8, 16, -8}, new int[]{-8, 0, 8}, color(255), width/2, height/2, 0, 0, 0); 
}
public void draw() 
{
 	//your code here
	spaceship.show();
	spaceship.move();
}

public void keyPressed()
{
	switch(keyCode)
	{
		case UP:
			spaceship.accelerate(2);
			break;
		case DOWN:
			spaceship.accelerate(-2);
			break;
		case LEFT:
			spaceship.turn(-5);
			break;
		case RIGHT:
			spaceship.turn(5);
			break;
	}
}
