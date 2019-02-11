//your variable declarations here
Spaceship ship;
Leftwing lWing;
Rightwing rWing;
Leftbackwing lbWing;
Rightbackwing rbWing;
Boss boss;
BossHull hull;
PImage img, end1, end2, end3, end4, end5, end6, end7;
PImage end8, end9, tieBoom, boomwait, telewait, timewait,crosswait;
int count=0, tCount=0, bCount=0, dCount=0, cCount=0, eCount=0, hCount=0;
int turn=0, endX=0, endY=0, dedPer=0, bolAstX=0, bolAstY=0;
int blastWait=900, chroWait=600, telWait=300, plusWait=300;
float invfill=0, bossfill=0;
int tSize=45, bX=5, bY=50;
boolean tele = false, boom = false, tStop = false, endGame = false;
boolean blast = false, bolCross = false, invinc = false, help=false, invTest=false;
boolean code1=false, code2=false, code3=false, code4=false, cheatCode=false;
int teleX, teleY;
color rd=color(255,0,0);
color og=color(255,127,0);
color yw=color(255,255,0);
color gn=color(0,255,0);
color bu=color(0,0,255);
color pe=color(139,0,255);
ArrayList<Bolt> bolt = new ArrayList<Bolt>();
ArrayList<Double> tStopX = new ArrayList<Double>();
ArrayList<Double> tStopY = new ArrayList<Double>();
ArrayList<Integer> tieBlastX = new ArrayList<Integer>();
ArrayList<Integer> tieBlastY = new ArrayList<Integer>();
ArrayList<Integer> destroyID = new ArrayList<Integer>();
Star[] stars=new Star[500];
ArrayList<Asteroid> rockBottom = new ArrayList<Asteroid>();
PImage[] endBoom = new PImage[9];
public void setup() 
{
	ship=new Spaceship();
	lWing=new Leftwing();
	rWing=new Rightwing();
	lbWing=new Leftbackwing();
	rbWing=new Rightbackwing();
	boss=new Boss();
	hull=new BossHull();
	size(1000, 1000);
	frameRate(60);
	background(0, 0, 0);
	noStroke();
	for(int i=0; i<stars.length;i++)
  	{
  		stars[i]=new Star();
  	}
  	for(int h=0;  h<5; h++)
  	{
  		rockBottom.add(new Asteroid());
  		if(rockBottom.get(rockBottom.size()-1).getDirectionX()==0)
  		{
  			if(rockBottom.get(rockBottom.size()-1).getDirectionY()==0)
  			{
  				bolAstX=rockBottom.get(rockBottom.size()-1).getX();
  				bolAstY=rockBottom.get(rockBottom.size()-1).getY();
  				image(tieBoom, bolAstX, bolAstY, 50, 50);
  				rockBottom.remove(rockBottom.size()-1);
  			}
  		}
  		if(rockBottom.get(rockBottom.size()-1).cloDet(ship.getX(), ship.getY()))
		{
			rockBottom.remove(rockBottom.size()-1);
		}
  	}
  	img=loadImage("flashtele.png");
  	endBoom[0]=loadImage("explofr1.gif");
  	endBoom[1]=loadImage("explofr2.gif");
  	endBoom[2]=loadImage("explofr3.gif");
  	endBoom[3]=loadImage("explofr4.gif");
  	endBoom[4]=loadImage("explofr5.gif");
  	endBoom[5]=loadImage("explofr6.gif");
  	endBoom[6]=loadImage("explofr7.gif");
  	endBoom[7]=loadImage("explofr8.gif");
  	endBoom[8]=loadImage("explofr9.gif");
  	tieBoom=loadImage("explosion.png");
  	boomwait=loadImage("boomwait.png");
  	telewait=loadImage("telewait.png");
  	timewait=loadImage("timewait.png");
  	crosswait=loadImage("crosswait.png");
}
public void show()
{
	helpDraw();
	starShow();
  	shipShow();
  	boss.show();
  	hull.show();
  	//shows the boss
  	tieShow();
  	boltShow();
  	noStroke();
  	fill(255,255,255);
  	rect(70, 5, 60, chroWait/10);
  	image(timewait, 70, 5, 60, 60);
  	rect(135, 5, 60, telWait/5);
  	image(telewait, 135, 5, 60, 60);
  	rect(200, 5, 60, plusWait/5);
  	image(crosswait, 200, 5, 60, 60);
  	rect(5,5,60,blastWait/15);
  	image(boomwait,5,5,60,60);
  	arc(965, 35, 60, 60, 0, radians(3.6*invfill), PIE);
  	rect(5,80,5,250);
  	fill(255,0,0);
  	rect(5, 80, 5, bossfill);
  	fill(255,255,255);
  	textSize(15);
	text("PRESS H FOR HELP", 5, 80);
	invTest();
	if(cheatCode)
	{
		rect(20, 200, 210, 210);
		rect(270, 200, 210, 210);
		rect(520, 200, 210, 210);
		rect(770, 200, 210, 210);
		textSize(50);
		text("INPUT CHEAT CODE", 270, 150);
	}
}
public void draw() 
{
	fill(0,0,0);
	rect(0, 0, 1000, 1000);
	//makes background
  	timeFrameCount();
  	tieMove();
	moveShip();
	gameOver();
	boltMove();
  	boAst();
  	teleFrameCount();
  	shipExploCounter();
	//boltAstCount();
	bombRingCount();
	invincCount();
	boltCross();
	newTie();
	abilCount();
	show();
}






public void keyPressed()
{
	switch (key) {
		case 'w':
			shipAccel(1);
		break;
		case 'a':
			shipTurn(-10);
		break;
		case 's':
			shipAccel(-1);
		break;
		case 'd':
			shipTurn(10);
		break;
		case 'z':
			ship.setTagX(ship.getX());
			ship.setTagY(ship.getY());
		break;
		case 'x':
			if(ship.getTagX()==0)
			{
				ship.setTagX(ship.getX());
			}
			if(ship.getTagY()==0)
			{
				ship.setTagY(ship.getY());
			}
			if(telWait==300)
			{
				tele=true;
				count=0;
				image(img, ship.getX()-140, ship.getY()-106, 280, 212);
				teleX=ship.getX();
				teleY=ship.getY();
				shipTeleSet(ship.getTagX(), ship.getTagY());
				dedPer=(int)(Math.random()*10);
				if(dedPer!=4)
				{
					image(img, ship.getTagX()-140, ship.getTagY()-106, 280, 212);
				}else if(dedPer==4){
					endX=ship.getX();
	  				endY=ship.getY();
		  			endGame=true;
		  			stopShip();
				}
				telWait=0;
			}
		case 'f':
			stopShip();
		break;
		case 'c':
			if(plusWait==300)
			{
				bolCross=true;
				plusWait=0;
			}
		case ' ':
			bolt.add(new Bolt());
			/*bolt.setX(ship.getX());
			bolt.setY(ship.getY());
			bolt.setPointDirection((int)ship.myPointDirection);
			bolt.accelerate(2);*/
		break;
		case 'e':
			if(chroWait==600)
			{
				tStop=true;
				tCount=0;
				tStopX.clear();
				tStopY.clear();
				for(int f=0;f<rockBottom.size();f++)
				{
					tStopX.add(rockBottom.get(f).getDirectionX());
					tStopY.add(rockBottom.get(f).getDirectionY());
				}
				tiStop();
				chroWait=0;
			}
		break;
		case 'q':
			if(blastWait>=900)
			{
				boom=true;
				ship.setBombX(ship.getX());
				ship.setBombY(ship.getY());
				blastWait=0;
			}
		break;
		case 'r':
			endX=ship.getX();
			endY=ship.getY();
  			stopShip();
  			endGame=true;
  		break;
  		case 'v':
  			invinc=true;
  		break;
  		case 'b':
  			if(invfill<100)
  			{
  				invfill+=25;
  			}
  		break;
  		case 'n':
  			if(invfill>0)
  			{
  				invfill=0;
  			}
  		break;
  		case 'h':
  			help=!help;
  		break;
  		case 't':
  			for(int h=0;  h<20; h++)
		  	{
		  		rockBottom.add(new Asteroid());
		  		if(rockBottom.get(rockBottom.size()-1).getDirectionX()==0)
		  		{
		  			if(rockBottom.get(rockBottom.size()-1).getDirectionY()==0)
		  			{
		  				bolAstX=rockBottom.get(rockBottom.size()-1).getX();
		  				bolAstY=rockBottom.get(rockBottom.size()-1).getY();
		  				image(tieBoom, bolAstX, bolAstY, 50, 50);
		  				rockBottom.remove(rockBottom.size()-1);
		  			}
		  		}
		  		if(rockBottom.get(rockBottom.size()-1).cloDet(ship.getX(), ship.getY()))
				{
					rockBottom.remove(rockBottom.size()-1);
				}
		  	}
		break;
		case 'y':
			rockBottom.clear();
		break;
		case 'g':
			invTest=!invTest;
		break;
		case 'l':
			cheatCode=true;
		break;
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
	if(dedPer!=4)
	{
		image(img, ship.getTagX()-140, ship.getTagY()-106, 280, 212);
	}
}
public void invShipFlash(float i)
{
	switch((int)i%10)
	{
		case 0:
			ship.myColor=rd;
			lWing.myColor=og;
			rWing.myColor=yw;
			lbWing.myColor=gn;
			rbWing.myColor=bu;
		break;
		case 1:
			ship.myColor=pe;
			lWing.myColor=rd;
			rWing.myColor=og;
			lbWing.myColor=yw;
			rbWing.myColor=gn;
		break;
		case 2:
			ship.myColor=bu;
			lWing.myColor=pe;
			rWing.myColor=rd;
			lbWing.myColor=og;
			rbWing.myColor=yw;
		break;
		case 3:
			ship.myColor=gn;
			lWing.myColor=bu;
			rWing.myColor=pe;
			lbWing.myColor=rd;
			rbWing.myColor=og;
		break;
		case 4:
			ship.myColor=yw;
			lWing.myColor=gn;
			rWing.myColor=bu;
			lbWing.myColor=pe;
			rbWing.myColor=rd;
		break;
		case 5:
			ship.myColor=og;
			lWing.myColor=yw;
			rWing.myColor=gn;
			lbWing.myColor=bu;
			rbWing.myColor=pe;
		break;
		case 6:
			ship.myColor=rd;
			lWing.myColor=og;
			rWing.myColor=yw;
			lbWing.myColor=gn;
			rbWing.myColor=bu;
		break;
		case 7:
			ship.myColor=pe;
			lWing.myColor=rd;
			rWing.myColor=og;
			lbWing.myColor=yw;
			rbWing.myColor=gn;
		break;
		case 8:
			ship.myColor=bu;
			lWing.myColor=pe;
			rWing.myColor=rd;
			lbWing.myColor=og;
			rbWing.myColor=yw;
		break;
		case 9:
			ship.myColor=gn;
			lWing.myColor=bu;
			rWing.myColor=pe;
			lbWing.myColor=rd;
			rbWing.myColor=og;
		break;
	}
}
void timeFrameCount()
{
	if(tCount==60&&tStop)
	{
		tStop=false;
		tiStart();
	}else if(tStop)
	{
		tCount++;
	}
}
//frame counter for the time stop button
void tieMove()
{
	for(int g=0; g<rockBottom.size();g++)
  	{
  		rockBottom.get(g).move();
  	}
}
//moves all tie fighter asteroids
void gameOver()
{
	for(int f=0; f<rockBottom.size();f++)
  	{
  		if(ship.distDet(rockBottom.get(f).getX(),rockBottom.get(f).getY())&&invinc==false)
  		{
  			rockBottom.remove(f);
  			endX=ship.getX();
			endY=ship.getY();
  			stopShip();
  			endGame=true;
		}
  	}
}
//ship to asteroid impact detector
void stopShip()
{
	ship.setDirectionX(0);
	ship.setDirectionY(0);
	lWing.setDirectionX(0);
    lWing.setDirectionY(0);
    rWing.setDirectionX(0);
    rWing.setDirectionY(0);
    lbWing.setDirectionX(0);
    lbWing.setDirectionY(0);
    rbWing.setDirectionX(0);
    rbWing.setDirectionY(0);
}
//stops the ship
void boltMove()
{
	for(int e=0; e<bolt.size();e++)
  	{
  		bolt.get(e).move();
  	}
}
//moves the bolts
void moveShip()
{
	ship.move();
	lWing.move();
	rWing.move();
	lbWing.move();
	rbWing.move();
}
//moves the ship and its parts
void boltRemove()
{
	for(int e=0; e<bolt.size();e++)
  	{
  		if(bolt.get(e).myCenterX>1000||bolt.get(e).myCenterX<0||bolt.get(e).myCenterY>1000||bolt.get(e).myCenterY<0)
    	{
    		bolt.remove(e);
    	}
  	}
}
//removes the bolts once they go offscreen
void teleFrameCount()
{
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
//frame counter for teleportation image
void shipExploCounter()
{
	if(eCount<201&&endGame)
	{
		if(eCount/10<9)
		{
			image(endBoom[eCount/10], endX-150,endY-150, 300, 300);
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
}
//ship explosion counter at the end of the game
public void helpWall()
{
	fill(255, 0, 0, 100);
	rect(0, 0, 1000,1000);
	fill(255,255,255);
	text("ability: description, button, time w/o invincibility, time w/ invincibility",5,100);
	text("bomb: destroys all ships on screen, Q, 15 seconds, 3 seconds", 5,130);
	text("time stop: stops all ships from moving for one second, E, 10 seconds, 2 seconds",5,160);
	text("set teleport tag:places the tag that the teleport move teleports to, Z, no recharge",5,190);
	text("teleport: teleports the ship to the teleport tag, X, 5 seconds, 1 second",5,220);
	text("cross: makes a cross of bullets from the ship, C, 5 seconds, 1 second",5,250);
	text("invincibility: become invincible for a max of ten seconds, V, destroy ships to recharge", 5,280);
	text("but length depends on counter of destroyed ships in top right corner",5,310);
	stroke(255, 255, 255);
	line(900, 100, 930, 70);
	line(910,70,930,70);
	line(930,70,930,90);
	text("invincibility counter", 850,120);
}
//help button code
public void boomDis()
{
	for(int z=0;z<tieBlastY.size();z++)
	{
		image(tieBoom, tieBlastX.get(tieBlastX.size()-1), tieBlastY.get(tieBlastY.size()-1), 50, 50);
	}
}
	/*start working with the explogif. each frame of the gif 
	plays every 0.01 seconds and the framerate of this 
	program is 60 frames per second*/
public void boAst()
{
	int ccount=0;
	for(int c=0; c<rockBottom.size();c++)
  	{
  		for(int b=0; b<bolt.size();b++)
  		{
  			if(rockBottom.get(c).cloDet(bolt.get(b).getX(),bolt.get(b).getY()))
  			{
  				bolAstX=rockBottom.get(c).getX();
  				bolAstY=rockBottom.get(c).getY();
  				//image(tieBoom, bolAstX, bolAstY, 50, 50);
  				//breakpoint1
  				rockBottom.remove(c-ccount);
  				ccount++;
  				//destroyID.add(c);
  				blast=true;
  				if(invfill<101)
  				{
  					invfill++;
  				}
  				if(bossfill<251)
  				{
  					bossfill++;
  				}
  				if(rockBottom.size()-ccount-1==c)
  				{
  					break;
  				}
  			}
  		}
  		//boomDis();
  	}
}
//bolt to asteroid impact detection
/*public void boltAstCount()
{
	if(dCount<31&&blast)
	{
		boAst();
		image(tieBoom, bolAstX, bolAstY, 50, 50);
		if(dCount==30)
		{
			blast=false;
			dCount=0;
		}
		if(blast)
		{
			dCount++;
		}
	}
}
//bolt to asteroid frame counter*/

public void bombRingCount()
{
	if(bCount<51&&boom)
	{
		boomDis();
		if(bCount==50)
		{
			boom=false;
			bCount=0;
			tieBlastX.clear();
			tieBlastY.clear();
		}
	}
	if(boom)
	{
		fill(255,255,255);
		ellipse(ship.getBombX(), ship.getBombY(), bCount*50, bCount*50);
		fill(0,0,0);
		ellipse(ship.getBombX(), ship.getBombY(), (bCount*35), (bCount*35));
		int ccount=0;
		for(int z=0;z<rockBottom.size();z++)
		{
			if(rockBottom.get(z).bomDet(ship.getBombX(), ship.getBombY(), bCount*25/**43*/))
			{
				tieBlastX.add(rockBottom.get(z).getX());
				tieBlastY.add(rockBottom.get(z).getY());
				rockBottom.remove(z);
				boomDis();
				//destroyID.add(z);
				if(invfill<101)
				{
					invfill++;
				}
				if(bossfill<251)
				{
					bossfill++;
				}
			}else{
				println("missed me");
			}
		}
		bCount++;
	}
	realGone();
}
//pulse bomb impact detection
public void invincCount()
{
	if(invfill>0&&invinc)
	{
		invShipFlash(invfill);
	}
	if(invfill<=0&&endGame==false)
		{	
			invinc=false;
			invfill=0;
			ship.myColor=color(211,211,211);
			lWing.myColor=color(255,0,0);
			rWing.myColor=color(255,0,0);
			lbWing.myColor=color(255,0,0);
			rbWing.myColor=color(255,0,0);
		}
	if(invinc)
	{
		invfill-=0.16;
	}
}
//invincibility color counter
public void newBoltCross(int x, int y, int z)
{
	bolt.add(new Bolt());
	bolt.get(bolt.size()-1).setDirectionX(x);
	bolt.get(bolt.size()-1).setDirectionY(y);
	bolt.get(bolt.size()-1).setPointDirection(z);
}
//adds a bolt for bolt cross
public void boltCross()
{
	if(cCount<3600&&bolCross)
	{
		if(cCount==40)
		{
			bolCross=false;
			cCount=0;
		}
		if(bolCross)
		{
			newBoltCross(25,0,0);
			newBoltCross(0,-25,90);
			newBoltCross(-25,0,180);
			newBoltCross(0,25,270);
			cCount++;
		}
	}
}
//bolt cross frame counter
public void newTie()
{
	if(turn%100==0&&tStop==false)
	{
		rockBottom.add(new Asteroid());
		if(rockBottom.get(rockBottom.size()-1).cloDet(ship.getX(), ship.getY()))
		{
			rockBottom.remove(rockBottom.size()-1);
		}
	}
	turn++;
}
//adds a new asteroid every 100 frames
public void abilCount()
{
	if(invinc==false)
	{
		if(blastWait<900)
		{
			blastWait++;
		}
		if(chroWait<600)
		{
			chroWait++;
		}
		if(telWait<300)
		{
			telWait++;
		}
		if(plusWait<300)
		{
			plusWait++;
		}
	}else if(invinc==true)
	{
		if(blastWait<900)
		{
			blastWait+=5;
		}
		if(chroWait<600)
		{
			chroWait+=5;
		}
		if(telWait<300)
		{
			telWait+=5;
		}
		if(plusWait<300)
		{
			plusWait+=5;
		}
	}
}
//determines recharge time
public void helpDraw()
{
	if(help)
  	{
  		helpWall();
  	}
}
public void starShow()
{
	for(int i=0; i<stars.length;i++)
  	{
  		stars[i].show();
  	}
}
//shows the stars
public void shipShow()
{
	if(endGame==false)
  	{
  		ship.show();
	  	lWing.show();
	  	rWing.show();
	  	lbWing.show();
	  	rbWing.show();
	}
}
//shows the ship if it isnt a fucking dumbass and dies
public void tieShow()
{
	for(int g=0; g<rockBottom.size();g++)
  	{
  		rockBottom.get(g).show();
  	}
}
//shows the tie fighter asteroid
public void boltShow()
{
	for(int e=0; e<bolt.size();e++)
  	{
  		bolt.get(e).show();
  	}
}
//shows the bolts
public void shipAccel(int x)
{
	ship.accelerate(x);
	lWing.accelerate(x);
	rWing.accelerate(x);
	lbWing.accelerate(x);
	rbWing.accelerate(x);
}
public void shipTurn(int x)
{
	ship.turn(x);
	lWing.turn(x);
	rWing.turn(x);
	lbWing.turn(x);
	rbWing.turn(x);
}
public void shipTeleSet(int x, int y)
{
	ship.setX(x);
	ship.setY(y);
	lWing.setX(x);
	lWing.setY(y);
	rWing.setX(x);
	rWing.setY(y);
	lbWing.setX(x);
	lbWing.setY(y);
	rbWing.setX(x);
	rbWing.setY(y);
}
public void realGone()
{
	for(int p=0;p<destroyID.size()-1;p++)
	{
		rockBottom.remove(destroyID.get(p)-p);
	}
	destroyID.clear();
}
public void invTest()
{
	if(invTest)
	{
		invfill=100;
		invinc=true;
	}
}