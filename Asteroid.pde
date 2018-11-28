public class Asteroid extends Floater
{
	public Asteroid()
    {
    	//xCorners=new int[]{-1,-2,-2,-6,-6,-14,-14,-15,-15,-16,-16,-17,-17,-16,-16,-15,-15,-14,-14,-5,-5,-3,-3,-2,-2,2,2,3,3,5,5,14,14,15,15,16,16,17,17,16,16,15,15,14,14,6,6,2,2,1};
    	//yCorners=new int[]{20,1,2,2,1,1,2,2,15,15,2,2,-10,-10,-11,-11,-10,-10,-9,-11,-16,-16,-10,-9,-11,-11,-9,-10,-16,-16,-11,-9,-10,-10,-11,-11,-10,-10,2,2,15,15,2,2,1,1,2,2,1,20};
    	yCorners=new int[]{-2,-4,-4,-2,-5,-5,-4,-4,-3,-3,-2,-2,-3,-3,-4,-4,-6,-10,-10,-11,-11,-12,-12,-11,-11,-10,-10,-14,-18,-18,-10,-6,-6,-2,-2,2,2,6,6,10,18,18,14,10,10,11,11,12,12,11,11,10,10,6,4,4,3,3,2,2,3,3,4,4,5,5,2,4,4,2};
    	xCorners=new int[]{0,-4,-14,-16,-14,-4,0,2,2,1,1,19,19,3,3,16,20,8,6,6,8,8,2,2,5,5,2,2,-2,-12,-20,-18,-22,-22,-18,-18,-22,-22,-18,-20,-12,-2,2,2,5,5,2,2,8,8,6,6,8,20,16,3,3,19,19,1,1,2,2,0,-4,-14,-16,-14,-4,0};
    	//corners=50;
    	corners=70;
    	myColor=color(211,211,211);
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
    	rotate(5);
    	super.move();
    }
}