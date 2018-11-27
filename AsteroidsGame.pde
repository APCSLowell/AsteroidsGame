//your variable declarations here
Spaceship ship;
Star[] stars=new Star[500];
public void setup() 
{
  ship=new Spaceship();
  ship.setX(500);
  ship.setY(500);
  size(1000, 1000);
  background(0, 0, 0);
  for(int i=0; i<stars.length;i++)
  {
  	stars[i]=new Star();
  }
  //your code here
}
public void draw() 
{
	fill(0,0,0);
	rect(0, 0, 1000, 1000);
	for(int i=0; i<stars.length;i++)
  	{
  		stars[i].show();
  	}
	ship.move();
	ship.show();
	/*if (keyPressed) {
    	if (key == 'b' || key == 'B') {
      		fill(0);
    	}else {
    	fill(255);
  		}
  	rect(25, 25, 50, 50)
	}*/
}
public void keyPressed()
{
	switch (key) {
		case 'w':
			ship.accelerate(1);
		break;
		case 'a':
			ship.turn(-20);
		break;
		case 's':
			ship.accelerate(-1);
		break;
		case 'd':
			ship.turn(20);
		break;
		case 'f':
			ship.setDirectionX(0);
			ship.setDirectionY(0);
		break;

		case 'x':

		break;
	}
}
