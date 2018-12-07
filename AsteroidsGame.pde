//your variable declarations here
Spaceship ship;
PImage img;
PImage end1;
PImage end2;
PImage end3;
PImage end4;
PImage end5;
PImage end6;
PImage end7;
PImage end8;
PImage end9;
int count=0, tCount=0, bCount=0, eCount=0, turn=0;
boolean tele = false;
boolean boom = false;
boolean tStop = false;
boolean endGame = false;
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
  	end1=loadImage("explofr1.gif");
  	end2=loadImage("explofr2.gif");
  	end3=loadImage("explofr3.gif");
  	end4=loadImage("explofr4.gif");
  	end5=loadImage("explofr5.gif");
  	end6=loadImage("explofr6.gif");
  	end7=loadImage("explofr7.gif");
  	end8=loadImage("explofr8.gif");
  	end9=loadImage("explofr9.gif");
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
  		if(ship.distDet(rockBottom.get(f).getX(),rockBottom.get(f).getY()))
  		{
  			endGame=true;
		}
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
  				tStopX.remove(c);
  				tStopY.remove(c);
  				break;
  			}
  		}
  	}
  	//bolt to asteroid impact detection
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
	//frame counter for teleportation image
	
	if(eCount<201&&endGame)
	{
		if(eCount<20)
		{
			image(end1, ship.getX()-150,ship.getY()-150, 300, 300);
		}
		if(eCount>19&&eCount<40)
		{
			image(end2, ship.getX()-150,ship.getY()-150, 300, 300);
		}
		if(eCount>39&&eCount<60)
		{
			image(end3, ship.getX()-150,ship.getY()-150, 300, 300);
		}
		if(eCount>59&&eCount<80)
		{
			image(end4, ship.getX()-150,ship.getY()-150, 300, 300);
		}
		if(eCount>79&&eCount<100)
		{	
			image(end5, ship.getX()-150,ship.getY()-150, 300, 300);
		}
		if(eCount>99&&eCount<120)
		{
			image(end6, ship.getX()-150,ship.getY()-150, 300, 300);
		}
		if(eCount>119&&eCount<140)
		{
			image(end7, ship.getX()-150,ship.getY()-150, 300, 300);
		}
		if(eCount>139&&eCount<160)
		{
			image(end8, ship.getX()-150,ship.getY()-150, 300, 300);
		}
		if(eCount>159&&eCount<180)
		{
			image(end9, ship.getX()-150,ship.getY()-150, 300, 300);
		}
		if(eCount==200)
		{
			endGame=false;
			exit();
		}
		if(endGame)
		{
			eCount++;
		}
	}
	//ship explosion counter at the end of the game
	if(bCount<51&&boom)
	{
		if(bCount==50)
		{
			boom=false;
			bCount=0;;
		}
	}
	if(boom)
	{
		fill(255,255,255);
		ellipse(ship.getBombX(), ship.getBombY(), bCount*50, bCount*50);
		fill(0,0,0);
		ellipse(ship.getBombX(), ship.getBombY(), (bCount*35), (bCount*35));
		for(int z=0;z<rockBottom.size();z++)
		{
			if(rockBottom.get(z).bomDet(ship.getBombX(), ship.getBombY(), bCount*50))
			{
				rockBottom.remove(z);

				break;
			}
		}
		bCount++;
	}
	//pulse bomb impact detection
	if(turn%100==0)
	{
		rockBottom.add(new Asteroid());
	}
	turn++;
	//adds a new asteroid every 100 frames
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
	for(int d=0;d<rockBottom.size()-1;d++)
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
	/*start working with the explogif. each frame of the gif 
	plays every 0.01 seconds and the framerate of this 
	program is 60 frames per second*/
