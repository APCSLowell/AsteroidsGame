class Colorant extends Floater
{
	public Colorant(int[] xCoord, int[] yCoord, color coloring)
	{
		xCorners=xCoord;
		yCorners=yCoord;
    	corners=Math.min(xCorners.length, yCorners.length);
    	myColor=coloring;
    	myCenterX=500;
    	myCenterY=500;
    	myDirectionX=0;
    	myDirectionY=0;
    	myPointDirection=0;
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
    	myCenterX=ship.getX();
    	myCenterY=ship.getY();
    	myPointDirection=ship.getPointDirection();
    }
}