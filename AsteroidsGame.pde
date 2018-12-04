//your variable declarations here
Spaceship ship;
PImage img;
int count=0, tCount=0, bCount=0;
boolean tele = false;
boolean boom = false;
boolean tStop = false;
int teleX, teleY;
ArrayList<Bolt> bolt = new ArrayList<Bolt>();
ArrayList<Double> tStopX = new ArrayList<Double>();
ArrayList<Double> tStopY = new ArrayList<Double>();
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
  	for(int h=0;  h<5; h++)
  	{
  		rockBottom.add(new Asteroid());
  	}
  	img=loadImage("flashtele.png");
  //your code here
}
public void show()
{
	for(int i=0; i<stars.length;i++)
  	{
  		stars[i].show();
  	}
  	//makes stars
  	ship.show();
  	//shows the ship
  	for(int g=0; g<rockBottom.size();g++)
  	{
  		rockBottom.get(g).show();
  	}
  	//shows the tie fighter asteroid
  	for(int e=0; e<bolt.size();e++)
  	{
  		bolt.get(e).show();
  	}
  	//shows the bolts
}
public void draw() 
{
	fill(0,0,0);
	rect(0, 0, 1000, 1000);
	//makes background
  	if(tCount==20&&tStop)
	{
		tStop=false;
		tiStart();
	}else if(tStop)
	{
		tCount++;
	}
	//frame counter for the time stop button
  	for(int g=0; g<rockBottom.size();g++)
  	{
  		rockBottom.get(g).move();
  	}
  	//moves all tie fighter asteroids
	ship.move();
	//moves the ship
	for(int f=0; f<rockBottom.size();f++)
  	{
  		ship.distDet(rockBottom.get(f).getX(),rockBottom.get(f).getY());
  	}
  	//ship to asteroid impact detector
	for(int e=0; e<bolt.size();e++)
  	{
  		bolt.get(e).move();
  	}
  	//moves the bolts
  	for(int e=0; e<bolt.size();e++)
  	{
  		if(bolt.get(e).myCenterX>1000||bolt.get(e).myCenterX<0||bolt.get(e).myCenterY>1000||bolt.get(e).myCenterY<0)
    	{
    		bolt.remove(e);
    	}
  	}
  	//removes the bolts
  	for(int c=0; c<rockBottom.size();c++)
  	{
  		for(int b=0; b<bolt.size();b++)
  		{
  			if(rockBottom.get(c).cloDet(bolt.get(b).getX(),bolt.get(b).getY()))
  			{
  				rockBottom.remove(c);
  				break;
  			}
  		}
  	}
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
	if(bCount<100&&boom)
	{
		bRad();
		if(bCount==99)
		{
			boom=false;
		}
	}
	if(boom)
	{
		count++;
	}
	//frame counter for the teleportation image
	show();
}
public void keyPressed()
{
	switch (key) {
		case 'w':
			ship.accelerate(1);
		break;
		case 'a':
			ship.turn(-10);
		break;
		case 's':
			ship.accelerate(-1);
		break;
		case 'd':
			ship.turn(10);
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
		case ' ':
			bolt.add(new Bolt());
			/*bolt.setX(ship.getX());
			bolt.setY(ship.getY());
			bolt.setPointDirection((int)ship.myPointDirection);
			bolt.accelerate(2);*/
		break;
		case 'e':
			tStop=true;
			tCount=0;
			tStopX.clear();
			tStopY.clear();
			for(int f=0;f<rockBottom.size();f++)
			{
				tStopX.add(rockBottom.get(f).getDirectionX());
				tStopY.add(rockBottom.get(f).getDirectionY());
			}
			tStop=true;
			tCount=0;
			tiStop();
		break;
		case 'q':
			boom=true;
			ship.setBombX(ship.getX());
			ship.setBombY(ship.getY());
			for(int l=0;l<500;l+=10)
			{
				for(int z=0;z<rockBottom.size();z++)
				{
					if(rockBottom.get(z).bomDet(ship.getBombX(),ship.getBombY(),l))
					{
						rockBottom.remove(z);
						break;
					}
				}
			}
	}
}
public void bRad()
{
	for(int l=0;l<500;l+=10)
	{
		fill(255,255,255);
		ellipse(ship.getBombX(), ship.getBombY(), l, l);
	}
}
public void tiStop()
{
	for(int e=0;e<rockBottom.size();e++)
	{
		rockBottom.get(e).setDirectionX(0);
		rockBottom.get(e).setDirectionY(0);
	}
}
public void tiStart()
{
	for(int d=0;d<rockBottom.size();d++)
	{
		rockBottom.get(d).setDirectionX(tStopX.get(d));
		rockBottom.get(d).setDirectionY(tStopY.get(d));
	}
}
public void flashDis()
{
	image(img, teleX-140, teleY-106, 280, 212);
	image(img, ship.getTagX()-140, ship.getTagY()-106, 280, 212);
}