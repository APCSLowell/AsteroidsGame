//your variable declarations here
Spaceship ship;
public void setup() 
{
  ship=new Spaceship();
  ship.setX(500);
  ship.setY(500);
  size(1000, 1000);
  background(0, 0, 0);
  //your code here
}
public void draw() 
{
	ship.show();
	if (keyPressed) {
    	if (key == 'b' || key == 'B') {
      		fill(0);
    	}else {
    	fill(255);
  		}
  	rect(25, 25, 50, 50)
	}
}

