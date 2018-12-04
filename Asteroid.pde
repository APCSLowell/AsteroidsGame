public class Asteroid extends Floater
{
	public Asteroid()
    {
    	//xCorners=new int[]{-1,-2,-2,-6,-6,-14,-14,-15,-15,-16,-16,-17,-17,-16,-16,-15,-15,-14,-14,-5,-5,-3,-3,-2,-2,2,2,3,3,5,5,14,14,15,15,16,16,17,17,16,16,15,15,14,14,6,6,2,2,1};
    	//yCorners=new int[]{20,1,2,2,1,1,2,2,15,15,2,2,-10,-10,-11,-11,-10,-10,-9,-11,-16,-16,-10,-9,-11,-11,-9,-10,-16,-16,-11,-9,-10,-10,-11,-11,-10,-10,2,2,15,15,2,2,1,1,2,2,1,20};
    	yCorners=new int[]{-10,-9,-9,-5,-4,-4,-3,-3,-1,1,3,3,4,4,5,9,9,10,10,9,9,5,4,3,1,-1,-3,-4,-5,-9,-9,-10};
    	xCorners=new int[]{8,8,1,1,3,7,7,4,5,5,4,7,7,3,1,1,8,8,-8,-8,-1,-1,-3,-4,-5,-5,-4,-3,-1,-1,-8,-8};
    	//corners=50;
    	corners=32;
    	myColor=color(255,255,255);
    	myCenterX=(int)(Math.random()*990+5);
    	myCenterY=(int)(Math.random()*990+5);
    	myDirectionX=(int)(Math.random()*5+1);
    	myDirectionY=(int)(Math.random()*5+1);
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
    	super.move();
    }
    public boolean cloDet(int box, int boy)
	{
		if(dist(box, boy, this.getX(), this.getY())<=10)
		{
			return true;
		}else{
			return false;
		}
	}
	public boolean bomDet(int box, int boy, int sphe)
	{
		if(dist(box, boy, this.getX(), this.getY())<=sphe)
		{
			return true;
		}else{
			return false;
		}
	}
}