public class Bolt extends Floater
{
	public Bolt()
    {
    	yCorners=new int[]{-2,2,2,-2};
    	xCorners=new int[]{20,20,-20,-20};
    	corners=4;
    	myColor=color(204,255,255);
    	myCenterX=ship.getX();
    	myCenterY=ship.getY();
    	myDirectionX=ship.getDirectionX();
    	myDirectionY=ship.getDirectionY();
    	myPointDirection=ship.getPointDirection();
    	accelerate(25);
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
    public void move()
    {
    	myCenterX += myDirectionX;    
    	myCenterY += myDirectionY; 
    }
}