//your variable declarations here
Spaceship ship;
Leftwing lWing;
Rightwing rWing;
Leftbackwing lbWing;
Rightbackwing rbWing;
Boss boss;
BossHull hull;
Missile miss;
PImage img, end1, end2, end3, end4, end5, end6, end7, boxTar;
PImage end8, end9, tieBoom, boomwait, telewait, timewait,spinwait,misstar;
int count=0, tCount=0, bCount=0, dCount=0, sCount=0, eCount=0, pCount=0, incCount=0, bossCount=0, corCount=0;
int turn=0, endX=0, endY=0, dedPer=0, bolAstX=0, bolAstY=0, missShip=0;
int misAstX=0, misAstY=0;
int blastWait=900, chroWait=600, telWait=300, plusWait=300;
float invfill=0, bossfill=0, codeCount=0, accelRate=0;
int tSize=45, bX=5, bY=50;
boolean tele = false, boom = false, tStop = false, endGame = false, inco=false, home=false;
boolean blast = false, bolSpi = false, invinc = false, help=false, invTest=false;
boolean cheatCode=false, cheat = false, start=false, open=true, bossGame=false, corCheat=false;
boolean fireHome=false, selectTar=false, missSet=false;
int teleX, teleY;
int rectX, rectY;
int circleX, circleY;
int tarX, tarY;
int rectSize=100;
int circleSize=100;
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
color currentColor;
public boolean rectOver=false;
public boolean circleOver=false;
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
// ArrayList<PImage> boxTars=new ArrayList<PImage>();
public String[] correctCode={"1","9","7","9"};
public String[] guessCode={"f", "f", "f","f"};
PImage[] endBoom=new PImage[9];
public void setup() 
{
	ship=new Spaceship();
	lWing=new Leftwing();
	rWing=new Rightwing();
	lbWing=new Leftbackwing();
	rbWing=new Rightbackwing();
	boss=new Boss();
	hull=new BossHull();
	miss=new Missile();
	size(1000, 1000);
	frameRate(60);
	background(0, 0, 0);
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
  	misstar=loadImage("missTar.png");
  	tieBoom=loadImage("explosion.png");
  	boomwait=loadImage("boomwait.png");
  	telewait=loadImage("telewait.png");
  	timewait=loadImage("timewait.png");
  	spinwait=loadImage("spinwait.png");
  	boxTar=loadImage("boxTarget.png");
	for(int i=0; i<stars.length;i++)
  	{
  		stars[i]=new Star();
  	}
	rectColor=color(150,0,0);
	rectHighlight=color(255,0,0);
	circleColor=color(150,0,0);
	circleHighlight=color(255,0,0);
	baseColor=color(102);
	currentColor=baseColor;
	circleX=250;
	circleY=600;
	rectX=250;
	rectY=500;
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
  		if(rockBottom.size()>0)
  		{
  			if(rockBottom.get(rockBottom.size()-1).cloDet(ship.getX(), ship.getY()))
			{
				rockBottom.remove(rockBottom.size()-1);
			}
		}
  	}
}
public void show()
{
	if(start)
	{
		starShow();
		helpDraw();
	  	shipShow();
	  	boss.show();
	  	hull.show();
	  	//shows the boss
	  	tieShow();
	  	boltShow();
	  	if(fireHome)
		{
			miss.show();
		}
	  	noStroke();
	  	if(home==false)
	  	{
	  		image(misstar, mouseX-25, mouseY-25, 50, 50);
	  	}else if(home==true)
	  	{
	  		image(misstar, tarX-25, tarY-25, 50, 50);
	  	}
	  	fill(255,255,255);
	  	rect(70, 5, 60, chroWait/10);
	  	image(timewait, 70, 5, 60, 60);
	  	rect(135, 5, 60, telWait/5);
	  	image(telewait, 135, 5, 60, 60);
	  	rect(200, 5, 60, plusWait/5);
	  	image(spinwait, 200, 5, 60, 60);
	  	rect(5,5,60,blastWait/15);
	  	image(boomwait,5,5,60,60);
	  	arc(965, 35, 60, 60, 0, radians(3.6*invfill), PIE);
	  	rect(5,80,5,500);
	  	fill(255,0,0);
	  	rect(5, 80, 5, bossfill/2);
	  	fill(255,255,255);
	  	textSize(15);
		text("PRESS H FOR HELP", 5, 80);
		invTest();
		if(endGame)
		{
			fill(255,0,0);
			textSize(150);
			text("GAME OVER", 50, 250);
		}
	}
}
public void draw() 
{
	if(open)
	{
		//update();
		fill(0,0,0);
		rect(0, 0, 1000, 1000);
		noFill();
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
			if(guessCode[guessCode.length-1]!="f")
			{
				for (int g=0;g<correctCode.length;g++)
				{
					println(correctCode[g]+" vs "+guessCode[g]);
					if(!correctCode[g].equals(guessCode[g]))
					{
						inco=true;
						incCodeCount();
						println("Nope");
						cheat=false;
						break;
					}else{
						guessCheck[g]=true;
						codeCount++;
					}
				}
				//inco=false;
				if(codeCount==4)
				{
					cheat=true;
					println("code worked");
					codeCount=0;
					corCheat=true;
					corCodeCount();
				}
				for(int ii=0; ii<guessCode.length;ii++)
				{
					guessCode[ii]="f";
				}
			}
		}
		if(overRect(rectX, rectY, 500, 50))
		{
			rectOver=true;
			//println("rect on");
			fill(255,0,0);
		}else{
			rectOver=false;
			//println("rect off");
			fill(150,0,0);
		}
		stroke(0);
		rect(rectX, rectY, 500, 50);
		noFill();
		fill(0,0,0);
		textSize(45);
		text("Start game", 400, 540);
		noFill();
		if(overRect(circleX, circleY, 500, 50))
		{
			circleOver=true;
			//println("circle on");
			fill(circleHighlight);
		}else{
			circleOver=false;
			//println("circle off");
			fill(circleColor);
		}
		stroke(0);
		rect(circleX, circleY, 500, 50);
		fill(0,0,0);
		textSize(45);
		text("Input cheat code", 350, 640);
		noFill();
	}else if(start)
	{
		fill(0,0,0);
		rect(0, 0, 1000, 1000);
		//makes background
		timeFrameCount();
		tieMove();
		moveShip();
		gameOver();
		boltMove();
		if(home)
		{
			miss.move();
		}
		boAst();
		if(bossGame)
		{
			bossMove();
			bossSet();
		}
		teleFrameCount();
		shipExploCounter();
		//boltAstCount();
		bombRingCount();
		invincCount();
		boltSpiral();
		newTie();
		abilCount();
		if(missSet)
		{
			tarX=rockBottom.get(missShip).getX();
			tarY=rockBottom.get(missShip).getY();
			selectTar=false;
			fireHome=true;
		}
		if(fireHome)
		{
			float turning=asin(Math.abs((tarY)-(miss.getY()))/(dist(miss.getX(),miss.getY(),tarX,tarY)));
			float a = degrees(turning);
			println("a="+a);
			//miss.setPointDirection((int)a);
			if(tarX>miss.getX()&&tarY>miss.getY())
			{
				//miss.setPointDirection(0);
				miss.setPointDirection((int)a);
			}
			if(miss.getX()>tarX&&tarY>miss.getY())
			{
				//miss.setPointDirection(0);
				miss.setPointDirection((int)((90-a+90)));
			}
			if(miss.getX()>tarX&&miss.getY()>tarY)
			{
				//miss.setPointDirection(0);
				miss.setPointDirection((int)(a+180));
			}
			if(tarX>miss.getX()&&miss.getY()>tarY)
			{
			    //miss.setPointDirection(0);
			    miss.setPointDirection((int)((90-a+270)));
			}
			missSpeed(miss.speed);
		}
		show();
	}
}






public void keyPressed()
{
	switch (key){
		case 'w':
			accelRate+=1;
			shipAccel(1);
		break;
		case 'a':
			shipTurnSpeed((int)-10);
		break;
		case 's':
			accelRate-=1;
			shipAccel((int)-1);
		break;
		case 'd':
			shipTurnSpeed((int)10);
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
			accelRate=0;
			stopShip();
		break;
		case 'c':
			if(plusWait==300)
			{
				bolSpi=true;
				plusWait=0;
			}
		case ' ':
			if(fireHome==false)
			{
				bolt.add(new Bolt());
			}
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
				if(fireHome!=true)
				{
					boom=true;
					ship.setBombX(ship.getX());
					ship.setBombY(ship.getY());
					blastWait=0;
				}
			}
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
  		case 'v':
  			invinc=true;
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
  			help=!help;
  			//if(cheat)
  			//{
  			//	cheatHelp=true;
  			//}
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
			}
		break;
		case 'g':
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
									println("put "+key+" into guessCode");
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
			tStopX.clear();
			tStopY.clear();
			tieBlastX.clear();
			tieBlastY.clear();
			destroyID.clear();
			rockBottom.clear();
			varReset();
			shipReset();
		break;
		case 'j':
			bossGame=true;
			println("sdgjkfgajkhgakjhgfkjhsagdkjhgaskjhgfkasgkfhgkajhgfkjagsdkfgkahgsdkfgaksdhgfk");
		break;
		case 'm':
			home=!home;
			if(home==false)
			{
				miss.setX(ship.getX());
				miss.setY(ship.getY());
				miss.setDirectionX(0);
				miss.setDirectionY(0);
				selectTar=false;
				fireHome=false;
				missSet=false;
				tarX=0;
				tarY=0;
			}
			if(home)
			{
				if(fireHome!=true)
				{
					selectTar=true;
				}else if(fireHome){
					selectTar=false;
					miss.setX(ship.getX());
					miss.setY(ship.getY());
					miss.setPointDirection((int)ship.getPointDirection());
					miss.accelerate(5);
				}
			}
		break;
		case 'l':
			cheat=!cheat;
		break;
	}
}
void shipTurnSpeed(int x)
{
	stopShip();
	shipTurn(x);
	shipAccel((int)accelRate);
}
void missSpeed(int x)
{
	miss.speed=0;
	miss.setDirectionX(0);
	miss.setDirectionY(0);
	miss.accelerate(5);
}
void bossSet()
{
	if(bossCount<10&&bossGame)
	{
		if(bossCount<2)
		{
			bossAccel(-160);
			println("qowiuyeroiqwueyriu");
		}
		if(bossCount>1)
		{
			bossStop();
			println("yuiytioytouyoityiuo");
		}
	}
	if(bossCount==10)
	{
		bossGame=false;
		bossCount=0;
	}
	if(bossGame)
	{
		bossCount++;
	}
}
void bossAccel(float x)
{
	boss.accelerate(x);
	hull.accelerate(x);
}
void bossMove()
{
	boss.move();
	hull.move();
}
void bossStop()
{
	boss.setDirectionX(0);
	boss.setDirectionY(0);
	hull.setDirectionX(0);
	hull.setDirectionY(0);
}
void varReset()
{
	count=tCount=bCount=dCount=sCount=eCount=pCount=incCount=0;
	turn=endX=endY=dedPer=bolAstX=bolAstY=0;
	blastWait=900;
	chroWait=600;
	telWait=300;
	plusWait=300;
	invfill=bossfill=0;
	tSize=45;
	bX=5;
	bY=50;
	tele=boom=tStop=endGame=inco=false;
	blast=bolSpi=invinc=help=invTest=false;
	cheat=start=open=true;
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
			println("cheat test hjgjngnhvfhnvhvhbrgvbhrgbhrgbh");
			cheatCode=true;
		}
		if(rectOver)
		{
			start=true;
			open=false;
		}
	}
	if(start)
	{
		if(home)
		{
			//tarX=mouseX-25;
			//tarY=mouseY-25;
			//fireHome=true;
			for(int m=0;m<rockBottom.size();m++)
			{
				
				if(dist(mouseX, mouseY, rockBottom.get(m).getX(), rockBottom.get(m).getY())<25)//pow(tarX,2)+pow(tarY,2)<=625)/*mouseX>=rockBottom.get(m).getX()-10&&mouseX<=rockBottom.get(m).getX()+10&&mouseY>=rockBottom.get(m).getY()-10&&mouseY<=rockBottom.get(m).getY()+10)*/
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
	if(dist(miss.getX(), miss.getY(), tarX, tarY)<5)
	{
		rockBottom.remove(missShip);
		fireHome=false;
	}
}
public void misAst()
{
	int ccount=0;
	misAstX=rockBottom.get(missShip).getX();
	misAstY=rockBottom.get(missShip).getY();
	rockBottom.remove(missShip);
	for(int c=0; c<rockBottom.size();c++)
  	{
  		if(rockBottom.get(c).cloDet(miss.getX(),miss.getY()))
  		{
  			bolAstX=rockBottom.get(c).getX();
  			bolAstY=rockBottom.get(c).getY();
  			//image(tieBoom, bolAstX, bolAstY, 50, 50);
  			//breakpoint1
  			boAstBo(bolAstX, bolAstY);
  			rockBottom.remove(c-ccount);
  			ccount++;
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
  			if(bossfill<1001)
  			{
  				bossfill++;
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
//bolt to asteroid impact detection
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
	if(inco==false)
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
}
public void corCodeCount()
{
	if(corCount<241&&corCheat)
	{
		if(corCount>60)
		{
			corWord();
			if(corCount==240)
			{
				corCheat=false;
				corCount=0;
				pCount=0;
				cheatCode=false;
			}
		}
	}
	if(corCheat)
	{
		corCount++;
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
}
public void corWord()
{
	fill(255,0,0);
	textSize(100);
	text("CODE CORRECT", 60, 300);
}
public void incCodeCount()
{
	if(incCount<241&&inco)
	{
		if(incCount>60)
		{
			incoWord();
			if(incCount==240)
			{
				inco=false;
				incCount=0;
				pCount=0;
			}
		}
	}
	if(inco)
	{
		incCount++;
	}
}
public void incoWord()
{
	fill(255,0,0);
	textSize(100);
	text("CODE INCORRECT", 60, 300);
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
			open=true;
			start=false;
			bolt.clear();
			tStopX.clear();
			tStopY.clear();
			tieBlastX.clear();
			tieBlastY.clear();
			destroyID.clear();
			rockBottom.clear();
			varReset();
			shipReset();
			boss.setX(900);
			boss.setY(500);
			hull.setX(900);
			hull.setY(500);
			home=false;
			miss.setX(ship.getX());
			miss.setY(ship.getY());
			miss.setDirectionX(0);
			miss.setDirectionY(0);
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
	text("spiral: makes a spiral of bullets from the ship, C, 5 seconds, 1 second",5,250);
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
  				if(bossfill<1001)
  				{
  					bossfill++;
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
}*/
//bolt to asteroid frame counter
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
				if(bossfill<1001)
				{
					bossfill++;
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
	if(sCount<3600&&bolSpi)
	{
		if(sCount==40)
		{
			bolSpi=false;
			sCount=0;
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