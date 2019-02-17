public class Missile extends Floater
{
	int speed;
    public Missile()
    {
    	yCorners=new int[]{0,-1,-2,-2,-1,-1,-2,-3,-3,-2,-1,1,2,3,3,2,1,1,2,2,1};
    	xCorners=new int[]{10,8,4,2,0,-1,-2,-4,-8,-6,-5,-5,-6,-8,-4,-2,-1,0,2,4,8};
    	corners=21;
    	myColor=color(0,0,255);
    	myCenterX=ship.getX();
    	myCenterY=ship.getY();
    	myDirectionX=ship.getDirectionX();
    	myDirectionY=ship.getDirectionY();
    	myPointDirection=ship.getPointDirection();
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
    public void accelerate(int x)
    {
        speed+=x;
        super.accelerate(x);
    }
}