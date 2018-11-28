//your variable declarations here
Spaceship ship;
PImage img;
int count=0;
boolean tele = false;
int teleX, teleY;
Star[] stars=new Star[500];
ArrayList<Asteroid> rockBottom = new ArrayList<Asteroid>();
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
  for(int h=0;  h<20; h++)
  {
  	rockBottom.add(new Asteroid());
  }
  img=loadImage("flashtele.png");
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
  	for(int g=0; g<rockBottom.size();g++)
  	{
  		rockBottom.get(g).move();
  		rockBottom.get(g).show();
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
	if(count<5&&tele)
	{
		flashDis();
		if(count==4)
		{
			tele=false;
		}
	}
	if(tele)
	{
		count++;
	}
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
		case 'z':
			ship.setTagX(ship.getX());
			ship.setTagY(ship.getY());
		break;
		case 'x':
			tele=true;
			count=0;
			image(img, ship.getX()-140, ship.getY()-106, 280, 212);
			teleX=ship.getX();
			teleY=ship.getY();
			ship.setX(ship.getTagX());
			ship.setY(ship.getTagY());
			image(img, ship.getTagX()-140, ship.getTagY()-106, 280, 212);
		case 'f':
			ship.setDirectionX(0);
			ship.setDirectionY(0);
		break;
	}
}
public void flashDis()
{
	image(img, teleX-140, teleY-106, 280, 212);
	image(img, ship.getTagX()-140, ship.getTagY()-106, 280, 212);
}