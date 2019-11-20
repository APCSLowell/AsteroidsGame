//your variable declarations here
Spaceship ship;
Leftwing lWing;
Rightwing rWing;
Leftbackwing lbWing;
Rightbackwing rbWing;
Missile miss;
PImage img, end1, end2, end3, end4, end5, end6, end7, boxTar, xOut;
PImage end8, end9, tieBoom, boomwait, telewait, timewait,spinwait,misstar,misswait;
int count=0, tCount=0, bCount=0, dCount=0, sCount=0, eCount=0, pCount=0, missCount=0, incCount=0, corCount=0, scorCount=0, suckCount=0;
int turn=0, endX=0, endY=0, dedPer=0, bolAstX=0, bolAstY=0, missShip=0;
int blastWait=900, chroWait=600, telWait=300, spiWait=300, missWait=300;
float invfill=0, codeCount=0,theWorldCount=0;
int tSize=45, bX=5, bY=50;
boolean tele = false, boom = false, tStop = false, endGame = false, home=false, missOff=false, missBounce=false;
boolean blast = false, bolSpi = false, invinc = false, help=false, invTest=false;
boolean cheatCode=false, cheat = false, start=false, open=true, inco=false, corr=false;
boolean fireHome=false, selectTar=false, missSet=false, missi=false,theWorld=false;
int teleX, teleY;
int rectX, rectY;
int circleX, circleY;
int triX, triY;
int tarX, tarY, missEndX, missEndY;
color rectColor, circleColor, triColor;
color rectHighlight, circleHighlight, triHighlight;
boolean rectOver=false;
boolean circleOver=false;
boolean triOver = false;
color rd=color(255,0,0);
color og=color(255,127,0);
color yw=color(255,255,0);
color gn=color(0,255,0);
color bu=color(0,0,255);
color pe=color(139,0,255);
ArrayList<Bolt> bolt=new ArrayList<Bolt>();
ArrayList<Double> tStopX=new ArrayList<Double>();
ArrayList<Double> tStopY = new ArrayList<Double>();
ArrayList<Integer> tieBlastX=new ArrayList<Integer>();
ArrayList<Integer> tieBlastY=new ArrayList<Integer>();
ArrayList<Integer> destroyID=new ArrayList<Integer>();
boolean[] guessCheck={false, false, false, false};
Star[] stars=new Star[500];
ArrayList<Asteroid> rockBottom=new ArrayList<Asteroid>();
ArrayList<Integer> missTrailX=new ArrayList<Integer>();
ArrayList<Integer> missTrailY=new ArrayList<Integer>();
// ArrayList<PImage> boxTars=new ArrayList<PImage>();
public String[] correctCode={"1","9","7","9"};
public String[] guessCode={"f", "f", "f","f"};
PImage[] endBoom=new PImage[9];
PImage[] dio=new PImage[25];
public void setup() 
{
	ship=new Spaceship();
	lWing=new Leftwing();
	rWing=new Rightwing();
	lbWing=new Leftbackwing();
	rbWing=new Rightbackwing();
	miss=new Missile();
	size(1000, 1000);
	frameRate(60);
	background(0,0,0);
	noStroke();
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
  	dio[0]=loadImage("zawarudo1.gif");
  	dio[1]=loadImage("zawarudo2.gif");
  	dio[2]=loadImage("zawarudo3.gif");
  	dio[3]=loadImage("zawarudo4.gif");
  	dio[4]=loadImage("zawarudo5.jpg");
  	dio[5]=loadImage("zawarudo6.jpg");
  	dio[6]=loadImage("zawarudo7.jpg");
  	dio[7]=loadImage("zawarudo8.jpg");
  	dio[8]=loadImage("zawarudo9.jpg");
  	dio[9]=loadImage("zawarudo10.jpg");
  	dio[10]=loadImage("zawarudo11.jpg");
  	dio[11]=loadImage("zawarudo12.jpg");
  	dio[12]=loadImage("zawarudo13.jpg");
  	dio[13]=loadImage("zawarudo14.jpg");
  	dio[14]=loadImage("zawarudo15.jpg");
  	dio[15]=loadImage("zawarudo16.jpg");
  	dio[16]=loadImage("zawarudo17.jpg");
  	dio[17]=loadImage("zawarudo18.jpg");
  	dio[18]=loadImage("zawarudo19.jpg");
  	dio[19]=loadImage("zawarudo20.jpg");
  	dio[20]=loadImage("zawarudo21.jpg");
  	dio[21]=loadImage("zawarudo22.jpg");
  	dio[22]=loadImage("zawarudo23.jpg");
  	dio[23]=loadImage("zawarudo24.jpg");
  	dio[24]=loadImage("zawarudo25.jpg");
  	misstar=loadImage("missTar.png");
  	tieBoom=loadImage("explosion.png");
  	boomwait=loadImage("boomwait.png");
  	telewait=loadImage("telewait.png");
  	timewait=loadImage("timewait.png");
  	spinwait=loadImage("spinwait.png");
  	boxTar=loadImage("boxTarget.png");
  	misswait=loadImage("misswait.png");
  	xOut=loadImage("tempOut.png");
  	for(int i=0; i<stars.length;i++)
  	{
  		stars[i]=new Star();
  	}
	rectColor=color(150,0,0);
	rectHighlight=color(255,0,0);
	circleColor=color(150,0,0);
	circleHighlight=color(255,0,0);
	triColor=color(150,0,0);
	triHighlight=color(255,0,0);
	circleX=250;
	circleY=600;
	rectX=250;
	rectY=500;
	triX=250;
	triY=700;
	for(int h=0;h<5; h++)
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
}
public void show()
{
	if(start)
	{
		starShow();
	  	shipShow();
	  	tieShow();
	  	boltShow();
	  	missShow();
	  	tarLock();
	  	rechaImage();
	  	invTest();
	  	overWord();
	}
}
public void draw() 
{
	if(open)
	{
		backScreen();
		titleWord();
		cheatWord();
		buttonDraw();
		helpDraw();
		incCodeCount();
		corCount();
	}else if(start)
	{
		backScreen();
		//makes background
		timeFrameCount();
		tieMove();
		moveShip();
		gameOver();
		boltMove();
		missTrailDraw();
		boAst();
		teleFrameCount();
		shipExploCounter();
		//boltAstCount();
		bombRingCount();
		invincCount();
		boltSpiral();
		newTie();
		abilCount();
		missRun();
		missTarCheck();
		missCount();
		show();
	}
}






public void keyPressed()
{
	switch (key){
		case 'w':
			shipAccel(1);
		break;
		case 'a':
			shipTurn(-10);
			angReset();
			shipSpeed();
		break;
		case 's':
			shipAccel(-1);
		break;
		case 'd':
			shipTurn(10);
			angReset();
			shipSpeed();
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
				shipSet(ship.getTagX(), ship.getTagY());
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
			if(spiWait==300)
			{
				if(fireHome==false)
				{
					bolSpi=true;
					sCount=0;
					spiWait=0;
					missOff=true;
					retMiss();
					selectTar=false;
					fireHome=false;
					missSet=false;
					missTrailClear();
				}
			}
		break;
		case ' ':
			missOff=true;
			bolt.add(new Bolt());
			missOff=false;
		break;
		case 'e':
			if(chroWait==600)
			{
				if(fireHome==false)
				{
					tStop=true;
					missOff=true;
					theWorld=true;
					tCount=0;
					tStopX.clear();
					tStopY.clear();
					for(int f=0;f<rockBottom.size();f++)
					{
						tStopX.add(rockBottom.get(f).getDirectionX());
						tStopY.add(rockBottom.get(f).getDirectionY());
					}
					if(cheat==true)
					{
						zaWARUDO();
					}
					tiStop();
					chroWait=0;
					retMiss();
					selectTar=false;
					fireHome=false;
					missSet=false;
					missTrailClear();
				}
			}
		break;
		case 'q':
			if(blastWait>=900)
			{
				if(fireHome==false)
				{
					boom=true;
					missOff=true;
					ship.setBombX(ship.getX());
					ship.setBombY(ship.getY());
					blastWait=0;
					retMiss();
					selectTar=false;
					fireHome=false;
					missSet=false;
					missTrailX.clear();
					missTrailY.clear();
				}
			}
		break;
		case 'g':
			if(missOff==false)
			{
				if(missWait>=300)
				{
					home=!home;
					if(home==false)
					{
						retMiss();
						selectTar=false;
						fireHome=false;
						missSet=false;
						missTrailClear();
					}
					if(home)
					{
						if(fireHome!=true)
						{
							selectTar=true;
							missTrailClear();
						}
					}
				}
			}
		break;
		case 'v':
  			invinc=true;
  		break;
		case 'r':
			if(cheat)
			{
				endX=ship.getX();
				endY=ship.getY();
	  			stopShip();
	  			endGame=true;
			}
  		break;
  		case 'b':
  			if(cheat)
  			{
  				if(invfill<100)
	  			{
	  				invfill+=25;
	  			}
	  		}
  		break;
  		case 'n':
  			if(cheat)
  			{
  				if(invfill>0)
	  			{
	  				invfill=0;
	  			}
  			}
  		break;
  		case 'h':
  			if(cheat)
  			{
  				if(missOff==false)
				{
					if(missWait>=300)
					{
						home=!home;
						if(home==false)
						{
							retMiss();
							selectTar=false;
							fireHome=false;
							missSet=false;
							missTrailClear();
						}
						if(home)
						{
							if(fireHome!=true)
							{
								selectTar=true;
								missBounce=true;
								missTrailClear();
							}
						}
					}
				}
			}
  		break;
  		case 't':
  			if(cheat)
			{
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
			}
		break;
		case 'y':
			if(cheat)
			{
				rockBottom.clear();
				selectTar=false;
				fireHome=false;
				missSet=false;
				home=false;
				retMiss();
			}
		break;
		case 'm':
			if(cheat)
			{
				invTest=!invTest;
			}
		break;
		case '1':
		case '2':
		case '3':
		case '4':
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
		case '0':
			if(open)
			{
				if(cheatCode)
				{
					if(pCount>=0)
					{
						if(guessCode.length<5)
						{
							for(int i=0; i<correctCode.length; i++)
							{
								if(guessCode[i]=="f")
								{
									guessCode[i]=Character.toString(key);
									break;
								}
							}
						}
					}
				}
			}
		break;
		case 'u':
			open=true;
			start=false;
			bolt.clear();
			tStopClear();
			tieBlastClear();
			destroyID.clear();
			rockBottom.clear();
			varReset();
			shipReset();
		break;
		case 'k':
			rockBottom.add(new Asteroid());
			rockBottom.get(rockBottom.size()-1).accelerate(7);
		break;
		case 'o':
			if(cheat)
			{
				theWorld=!theWorld;
			}
		break;
	}
}

void missTrailClear()
{
	missTrailX.clear();
	missTrailY.clear();
}
void tieBlastClear()
{
	tieBlastX.clear();
	tieBlastY.clear();
}
void tStopClear()
{
	tStopX.clear();
	tStopY.clear();
}
void angReset()
{
	if(ship.getPointDirection()>=360)
    {
        ship.setPointDirection((int)(ship.getPointDirection()-360));
    }
}
void retMiss()
{
	miss.setX(ship.getX());
	miss.setY(ship.getY());
	miss.setDirectionX(0);
	miss.setDirectionY(0);
}
void missRun()
{
	if(home==false)
	{
		retMiss();
		selectTar=false;
		fireHome=false;
		missSet=false;
		missTrailX.clear();
		missTrailY.clear();
	}
	if(missSet)
	{
		if(missShip<rockBottom.size())
		{
			if(rockBottom.size()>0)
			{
				{
					tarX=rockBottom.get(missShip).getX();
					tarY=rockBottom.get(missShip).getY();
					selectTar=false;
					fireHome=true;
				}
			}
		}
		if(missShip<=1)
		{
			selectTar=false;
			fireHome=false;
			missSet=false;
			home=false;
			retMiss();
		}
	}
	if(fireHome)
	{
		float turning=asin(Math.abs((tarY)-(miss.getY()))/(dist(miss.getX(),miss.getY(),tarX,tarY)));
		float a = degrees(turning);
		if(tarX>miss.getX()&&tarY>miss.getY())
		{
			miss.setPointDirection(0);
			miss.setPointDirection((int)a);
		}
		if(miss.getX()>tarX&&tarY>miss.getY())
		{
			miss.setPointDirection(0);
			miss.setPointDirection((int)((90-a+90)));
		}
		if(miss.getX()>tarX&&miss.getY()>tarY)
		{
			miss.setPointDirection(0);
			miss.setPointDirection((int)(a+180));
		}
		if(tarX>miss.getX()&&miss.getY()>tarY)
		{
		    miss.setPointDirection(0);
		    miss.setPointDirection((int)((90-a+270)));
		}
		missSpeed(miss.speed);
	}
}
void missTrailDraw()
{
	if(home)
	{
		miss.move();
		int o=0;
		for (int h = missTrailX.size()-1; h>0;h--)
		{
			fill(206, 32, 41);
			noStroke();
			ellipse(missTrailX.get(o), missTrailY.get(o), h*4, h*4);
			o++;
			noFill();
		}
	}
}
void buttonDraw()
{
	if(help==false)
	{
		if(suckCount>=10&&cheat==false)
		{
			fill(255,255,255);
			textSize(15);
			text("Since you're such a GREAT player", 750, 300);
			text("and lost ten times, here's the", 750,320);
			text("cheat code: "+1979+"", 750,340);
			noFill();
		}
	}
	if(overRect(rectX, rectY, 500, 50))
	{
		rectOver=true;
		fill(255,0,0);
	}else{
		rectOver=false;
		fill(150,0,0);
	}
	stroke(0);
	rect(rectX, rectY, 500, 50);
	noFill();
	fill(0,0,0);
	textSize(45);
	text("Start game", 400, 540);
	noFill();
	if(cheat==false)
	{
		if(overRect(circleX, circleY, 500, 50))
		{
			circleOver=true;
			fill(circleHighlight);
		}else{
			circleOver=false;
			fill(circleColor);
		}
	}else if(cheat==true)
	{
		fill(0,255,0);
	}
	stroke(0);
	rect(circleX, circleY, 500, 50);
	fill(0,0,0);
	textSize(45);
	if(cheat==false)
	{
		text("Input cheat code", 350, 640);
	}else if(cheat)
	{
		text("Code already entered",275,640);
	}
	noFill();
	if(help)
	{
		fill(0,0,0);
		rect(0, 0, 1000, 1000);
		noFill();
		triX=750;
		triY=750;
		if(overRect(triX, triY, 200, 50))
		{
			triOver=true;
			fill(255,0,0);
		}else{
			triOver=false;
			fill(150,0,0);
		}
		stroke(0);
		rect(triX, triY, 200, 50);
		noFill();
		fill(0,0,0);
		textSize(20);
		text("Back to Main Menu", 760,775);
	}else if(help==false)
	{
		triX=250;
		triY=700;
		if(overRect(triX, triY, 500, 50))
		{
			triOver=true;
			fill(255,0,0);
		}else{
			triOver=false;
			fill(150,0,0);
		}
		stroke(0);
		rect(triX, triY, 500, 50);
		noFill();
		fill(0,0,0);
		textSize(45);
		if(cheat==false)
		{
			text("How to Play", 400, 740);
		}else if(cheat==true)
		{
			text("How to Play+Cheats", 300, 740);
		}
	}
	noFill();
}
void cheatWord()
{
	if(cheatCode)
	{
		fill(255,255,255);
		rect(20, 200, 210, 210);
		rect(270, 200, 210, 210);
		rect(520, 200, 210, 210);
		rect(770, 200, 210, 210);
		noFill();
		textSize(50);
		text("INPUT CHEAT CODE", 270, 150);
		codeNum();
		if(guessCode[guessCode.length-1]!="f"&&guessCode.length<5)
		{
			for (int g=0;g<correctCode.length;g++)
			{
				if(!correctCode[g].equals(guessCode[g]))
				{
					inco=true;
					incCount=0;
					cheat=false;
					cheatCode=false;
					for(int j=0;j<guessCode.length;j++)
					{
						guessCode[j]="f";
					}
					codeCount=0;
					break;
				}else if(correctCode[g].equals(guessCode[g])){
					guessCheck[g]=true;
					codeCount++;
				}
			}
			if(codeCount==4)
			{
				cheat=true;
				pCount=0;
				corr=true;
				corCount=0;
				cheatCode=false;
				for(int ii=0; ii<guessCode.length;ii++)
				{
					guessCode[ii]="f";
				}
			}
		}
	}
}
void backScreen()
{
	fill(0,0,0);
	rect(0, 0, 1000, 1000);
	noFill();
}
void overWord()
{
	textSize(15);
	if(endGame)
	{
		fill(255,0,0);
		textSize(150);
		text("GAME OVER", 50, 250);
	}
}
void rechaImage()
{
	fill(255,255,255);
  	rect(5,5,60,blastWait/15);
  	image(boomwait,5,5,60,60);
  	rect(70, 5, 60, chroWait/10);
  	image(timewait, 70, 5, 60, 60);
  	rect(135, 5, 60, telWait/5);
  	image(telewait, 135, 5, 60, 60);
  	rect(200, 5, 60, spiWait/5);
  	image(spinwait, 200, 5, 60, 60);
  	rect(265, 5, 60, missWait/5);
  	image(misswait, 265, 5, 60, 60);
  	if(fireHome)
  	{
  		image(xOut,5,5,60,60);
  		image(xOut,70,5,60,60);
  		image(xOut,200,5,60,60);
  	}
  	if(missOff==true)
  	{
  		image(xOut,265,5,60,60);
  	}
	arc(965, 35, 60, 60, 0, radians(3.6*invfill), PIE);
	textSize(45);
	text("HIGH SCORE: 2000", 350,35);
	text("SCORE: "+scorCount, 350,80);
}
void titleWord()
{
	if(cheatCode==false&&help==false)
	{
		textSize(150);
		fill(255,255,255);
		text("Asteroids", 150, 200);
		text("Game", 300, 400);
	}
}
void missShow()
{
	if(fireHome)
	{
		miss.show();
	}
}
void corCount()
{
	if(corCount<15&&corr)
	{
		fill(0,255,0);
		rect(0,0,1000,1000);
		noFill();
		if(corCount==60)
		{
			corCount=0;
			corr=false;
		}
	}
	if(corr)
	{
		corCount++;
	}
}
void incCodeCount()
{
	if(incCount<15&&inco)
	{
		fill(255,0,0);
		rect(0,0,1000,1000);
		noFill();
		if(incCount==60)
		{
			incCount=0;
			inco=false;
		}
	}
	if(inco)
	{
		incCount++;
	}
}
void tarLock()
{
	noStroke();
  	if(home==false)
  	{
  		image(misstar, mouseX-25, mouseY-25, 50, 50);
  	}else if(fireHome==true)
  	{
  		image(misstar, tarX-25, tarY-25, 50, 50);
  	}
}
void shipSpeed()
{
	int a=(int)ship.speed;
	ship.speed=0;
	stopShip();
	shipAccel(a);
}
void missSpeed(int x)
{
	miss.speed=0;
	miss.setDirectionX(0);
	miss.setDirectionY(0);
	if(missTrailX.size()<5)
	{
		missTrailX.add(0, miss.getX());
		missTrailY.add(0, miss.getY());
	}else if(missTrailX.size()==5)
	{
		missTrailX.remove(missTrailX.size()-1);
		missTrailY.remove(missTrailY.size()-1);
		missTrailX.add(0, miss.getX());
		missTrailY.add(0, miss.getY());
	}
	if(missBounce==false)
	{
		miss.accelerate(10);
	}else if(missBounce==true)
	{
		miss.accelerate(20);
	}
}
void varReset()
{
	count=tCount=bCount=dCount=sCount=eCount=0;
	pCount=missCount=incCount=corCount=scorCount=0;
	turn=endX=endY=dedPer=bolAstX=bolAstY=missShip=0;
	blastWait=900;
	chroWait=600;
	telWait=spiWait=missWait=300;
	invfill=codeCount=0;
	tSize=45;
	bX=5;
	bY=50;
	tele=boom=tStop=endGame=home=missOff=false;
	blast=bolSpi=invinc=help=invTest=false;
	cheatCode=start=false;
	open=true;
	inco=corr=false;
	fireHome=selectTar=missSet=missi=false;
	rectOver=circleOver=triOver=false;
}
void shipReset()
{
	ship.setX(500);
    ship.setY(500);
    lWing.setX(500);
    lWing.setY(500);
    rWing.setX(500);
    rWing.setY(500);
    lbWing.setX(500);
    lbWing.setY(500);
    rbWing.setX(500);
    rbWing.setY(500);
    stopShip();
    ship.setPointDirection(0);
    lWing.setPointDirection(0);
    rWing.setPointDirection(0);
    lbWing.setPointDirection(0);
    rbWing.setPointDirection(0);
    ship.setTagX(0);
	ship.setTagY(0);
    ship.setBombX(0);
    ship.setBombY(0);
}
void mousePressed() 
{
	if(open)
	{
		if(circleOver)
		{
			if(cheat==false)
			{
				cheatCode=true;
			}
		}
		if(rectOver)
		{
			start=true;
			open=false;
		}
		if(triOver)
		{
			help=!help;
		}
	}
	if(start)
	{
		if(home)
		{
			for(int m=0;m<rockBottom.size();m++)
			{
				
				if(mouseX>=rockBottom.get(m).getX()-25&&mouseX<=rockBottom.get(m).getX()+25&&mouseY>=rockBottom.get(m).getY()-25&&mouseY<=rockBottom.get(m).getY()+25)
				{
					missSet=true;
					missShip=m;
					break;
				}
			}
		}
	}
}
void missTarCheck()
{
	if(missBounce==false)
	{	
		if(dist(miss.getX(), miss.getY(), tarX, tarY)<10)
		{
			missi=true;
			missCount=0;
			rockBottom.remove(missShip-1);
			scorCount++;
			missEndX=tarX;
			missEndY=tarY;
			missWait=0;
			selectTar=false;
			fireHome=false;
			missSet=false;
			home=false;
			retMiss();
			
		}
	}else if(missBounce==true)
	{
		if(dist(miss.getX(), miss.getY(), tarX, tarY)<40)
		{
			missi=true;
			missCount=0;
			if(rockBottom.size()==missShip)
			{
				missShip-=1;
			}
			if(rockBottom.size()>0)
			{
				rockBottom.remove(missShip-1);
			}else if(rockBottom.size()==0)
			{
				rockBottom.remove(missShip);
			}
			scorCount++;
			missEndX=tarX;
			missEndY=tarY;
			if(rockBottom.size()-1==0)
			{
				missWait=0;
				selectTar=false;
				fireHome=false;
				missSet=false;
				home=false;
				missBounce=false;
				retMiss();
			}
		}
	}
}
void missCount()
{
	if(missCount<201&&missi)
	{
		if(missCount/10<9)
		{
			image(endBoom[missCount/10], missEndX-50,missEndY-50, 100, 100);
		}
		if(missCount==200)
		{
			missi=false;
		}
		if(missi)
		{
			missCount++;
		}
	}
}
boolean overRect(int x, int y, int width, int height)  {
	if(mouseX>=x&&mouseX<=x+width&&mouseY>=y&&mouseY<=y+height)
	{
    	return true;
  	}else{
    	return false;
	}
}

boolean overCircle(int x, int y, int diameter) {
	float disX = x - mouseX;
	float disY = y - mouseY;
	if(sqrt(sq(disX) + sq(disY)) < diameter/2)
	{
		return true;
	}else{
    	return false;
  	}
}
public void codeNum()
{
	for(int c=0;c<(int)(firstF())&&c<correctCode.length;c++)
	{
		String text=guessCode[c];
		textSize(100);
		//fill(255,255,255);
		fill(0,0,0);
		text(text, 80+250*c, 335);
	}
}
Integer firstF()
{
	for(int i=0; i<guessCode.length; i++)
	{
		if(guessCode[i]=="f")
		{
			int x=i;
			return i;
		}
	}
	return 50;
}public void zaWARUDO()
{
	if(theWorldCount<300&&theWorld)
	{
		if(theWorldCount/12<25)
		{
			image(dio[(int)(theWorldCount/12)],-166,250, 1332, 750);
			tint(255,127);
		}
		if(theWorldCount==300)
		{
			theWorldCount=0;
			theWorld=false;
		}
	}
	if(theWorld)
	{
		theWorldCount++;
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
		missOff=false;
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
  			scorCount++;
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
    ship.speed=0;
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
			open=true;
			start=false;
			bolt.clear();
			tStopClear();
			tieBlastClear();
			destroyID.clear();
			rockBottom.clear();
			varReset();
			shipReset();
			home=false;
			retMiss();
			suckCount++;
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
	textSize(25);
	fill(255,255,255);
	text("ability name: description, button,",5,30);
	text("time w/o invincibility, time w/ invincibility",5,60);
	text("move forward/backward: up/down arrow keys",5,100);
	text("turn left/right: left/right arrow keys",5,140);
	text("shoot bolt: space button",5,180);
	text("bomb: destroys all ships on screen, Q,", 5,220);
	text("15 seconds, 3 seconds",5,250);
	text("time stop: stops all ships from moving",5,300);
	text("for one second, E, 10 seconds, 2 seconds",5,330);
	text("set teleport tag: places the tag that the",5,380);
	text("teleport move teleports to, Z, no recharge",5,410);
	text("teleport: teleports the ship to the",5,460);
	text("teleport tag, X, 5 seconds, 1 second",5,490);
	text("spiral: makes a spiral of bullets from the",5,540);
	text("ship, C, 5 seconds, 1 second",5,570);
	text("invincibility: become invincible for a", 5,620);
	text("V, destroy ships to recharge but length",5,650);
	text("depends on counter of destroyed ships,",5,680);
	text("in top right corner, lasts max of ten seconds",5,710);
	text("homing missile: shoot a homing missile to",5,760);
	text("destroy one target, G, 5 seconds, 1 second",5,790);
	text("return to main menu: u",5, 740);
	line(500,0,500,1000);
	stroke(255, 255, 255);
	line(860, 30, 870, 40);
	line(820,40,870,40);
	line(860,50,870,40);
	text("invincibility counter", 580,50);
	if(cheat)
	{
		fill(255,0,0);
		text("Cheat Ability Keys:",550,150);
		text("R: game over test",550,200);
		text("B: fill invincibility counter by 25%",550,250);
		text("N: empties the invincibility counter",550,300);
		text("T: make 20 more tie fighters",550,350);
		text("Y: remove all tie fighters instantly",550,400);
		text("M: toggle invincibility, regardless",550,450);
		text("of the invincibility counter",550,490);
		text("K: makes 1 fast tie fighter",550,540);
		text("H: makes it so that the homing",550,590);
		text("missile destroys many targets after",550,620);
		text("it destroys the initial target, though",550,650);
		text("the score counter gets glitchy",550,680);
		text("O: bizarre effect to time stop",550,710);
	}
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
void boAstBo(int x, int y)
{
	image(tieBoom, x, y, 50, 50);
}
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
  				boAstBo(bolAstX, bolAstY);
  				rockBottom.remove(c-ccount);
  				ccount++;
  				scorCount++;
  				if(c+ccount>=rockBottom.size())
  				{
  					break;
  				}
  				//destroyID.add(c);
  				blast=true;
  				if(invfill<101)
  				{
  					invfill++;
  				}
  				if(rockBottom.size()-ccount-1==c)
  				{
  					break;
  				}
  			}
  			if(c+ccount>=rockBottom.size())
			{
				break;
			}
  		}
  		//boomDis();
  	}
}
//bolt to asteroid impact detection
public void boltAstCount()
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
//bolt to asteroid frame counter
public void bombRingCount()
{
	if(bCount<51&&boom)
	{
		boomDis();
		if(bCount==50)
		{
			boom=false;
			missOff=false;
			bCount=0;
			tieBlastClear();
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
				scorCount++;
				boomDis();
				//destroyID.add(z);
				if(invfill<101)
				{
					invfill++;
				}
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
public void newBoltSpiral()
{
	ship.setPointDirection((int)(ship.getPointDirection()-9));
	lWing.setPointDirection((int)(lWing.getPointDirection()-9));
	rWing.setPointDirection((int)(rWing.getPointDirection()-9));
	lbWing.setPointDirection((int)(lbWing.getPointDirection()-9));
	rbWing.setPointDirection((int)(rbWing.getPointDirection()-9));
	bolt.add(new Bolt());
}
//adds a bolt for bolt spiral
public void boltSpiral()
{
	if(sCount<41&&bolSpi)
	{
		if(sCount==40)
		{
			bolSpi=false;
			sCount=0;
			missOff=false;
		}
		if(bolSpi)
		{
			newBoltSpiral();
			sCount++;
		}
	}
}
//bolt spiral frame counter
public void newTie()
{
	if(turn%200==0&&tStop==false)
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
		if(spiWait<300)
		{
			spiWait++;
		}
		if(missWait<300)
		{
			missWait++;
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
		if(spiWait<300)
		{
			spiWait+=5;
		}
		if(missWait<300)
		{
			missWait+=5;
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
  		if(selectTar)
  		{
			for(int t=0;t<rockBottom.size();t++)
			{
				image(boxTar, rockBottom.get(g).getX()-25, rockBottom.get(g).getY()-25, 50, 50);
			}
		}
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
public void shipSet(int x, int y)
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