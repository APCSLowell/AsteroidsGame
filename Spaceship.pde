class Spaceship extends Floater  
{   
	private int tagX, tagY, bombX, bombY, colCon, speed;
    public Spaceship()
    {
    	//xCorners=new int[]{-1,-2,-2,-6,-6,-14,-14,-15,-15,-16,-16,-17,-17,-16,-16,-15,-15,-14,-14,-5,-5,-3,-3,-2,-2,2,2,3,3,5,5,14,14,15,15,16,16,17,17,16,16,15,15,14,14,6,6,2,2,1};
    	//yCorners=new int[]{20,1,2,2,1,1,2,2,15,15,2,2,-10,-10,-11,-11,-10,-10,-9,-11,-16,-16,-10,-9,-11,-11,-9,-10,-16,-16,-11,-9,-10,-10,-11,-11,-10,-10,2,2,15,15,2,2,1,1,2,2,1,20};
    	yCorners=new int[]{-2,-4,-4,-2,-5,-5,-4,-4,-3,-3,-2,-2,-3,-3,-4,-4,-6,-10,-10,-11,-11,-12,-12,-11,-11,-10,-10,-14,-18,-18,-10,-6,-6,-2,-2,2,2,6,6,10,18,18,14,10,10,11,11,12,12,11,11,10,10,6,4,4,3,3,2,2,3,3,4,4,5,5,2,4,4,2};
    	xCorners=new int[]{0,-4,-14,-16,-14,-4,0,2,2,1,1,19,19,3,3,16,20,8,6,6,8,8,2,2,5,5,2,2,-2,-12,-20,-18,-22,-22,-18,-18,-22,-22,-18,-20,-12,-2,2,2,5,5,2,2,8,8,6,6,8,20,16,3,3,19,19,1,1,2,2,0,-4,-14,-16,-14,-4,0};
    	corners=Math.min(xCorners.length, yCorners.length);
    	myColor=color(211,211,211);
    	myCenterX=500;
    	myCenterY=500;
    	myDirectionX=0;
    	myDirectionY=0;
    	myPointDirection=0;
        //Ported inits
        tagX=0;
        tagY=0;
        bombX=0;
        bombY=0;
        colCon=0;
    }
    public void setX(int x){myCenterX=x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY=y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX=x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY=y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection=degrees;}
    public double getPointDirection(){return myPointDirection;}
    public void setTagX(int x){tagX=x;}
    public int getTagX(){return (int)tagX;}
    public void setTagY(int y){tagY=y;}
    public int getTagY(){return (int)tagY;}
    public void setBombX(int x){bombX=x;}
    public int getBombX(){return (int)bombX;}
    public void setBombY(int y){bombY=y;}
    public int getBombY(){return (int)bombY;}
    public void setSpeed(int y){speed=y;}
    public int getSpeed(){return (int)speed;}

    public void show()
    {
    	noStroke();
        fill(211,211,211);
        //tag drawn
    	rect(tagX-10, tagY-5, 20, 10);
        //bomb drawn
        ellipse(bombX, bombY, 20, 10);
    	super.show();
    }
    public boolean distDet(int asx, int asy)
    {
        return dist(asx, asy, (float)myCenterX, (float)myCenterY)<=14;
    }
    public void accelerate(int x)
    {
        speed+=x;
        super.accelerate(x);
    }
}
