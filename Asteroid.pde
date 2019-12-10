public class Asteroid extends Floater
{
	int topSide=(int)(Math.random()*2+1);
	int leftRight=(int)(Math.random()*2+1);
	int topDown=(int)(Math.random()*2+1);
	int dir=(int)random(0,2);
    double ray;
    float rand=random(1,5);
    public Asteroid()
    {
    	//xCorners=new int[]{-1,-2,-2,-6,-6,-14,-14,-15,-15,-16,-16,-17,-17,-16,-16,-15,-15,-14,-14,-5,-5,-3,-3,-2,-2,2,2,3,3,5,5,14,14,15,15,16,16,17,17,16,16,15,15,14,14,6,6,2,2,1};
    	//yCorners=new int[]{20,1,2,2,1,1,2,2,15,15,2,2,-10,-10,-11,-11,-10,-10,-9,-11,-16,-16,-10,-9,-11,-11,-9,-10,-16,-16,-11,-9,-10,-10,-11,-11,-10,-10,2,2,15,15,2,2,1,1,2,2,1,20};
    	yCorners=new int[]{-10,-9,-9,-5,-4,-4,-3,-3,-1,1,3,3,4,4,5,9,9,10,10,9,9,5,4,3,1,-1,-3,-4,-5,-9,-9,-10};
    	xCorners=new int[]{8,8,1,1,3,7,7,4,5,5,4,7,7,3,1,1,8,8,-8,-8,-1,-1,-3,-4,-5,-5,-4,-3,-1,-1,-8,-8};
    	corners=Math.min(xCorners.length, yCorners.length);
    	myColor=color(255,255,255);
    	if(topSide==0)
    	{
    		myCenterX=(int)(Math.random()*990+5);
    		myCenterY=0;
    	}
    	myCenterY=(int)(Math.random()*990+5);
    	// myDirectionX=(int)(Math.random()*5+1);
    	// myDirectionY=(int)(Math.random()*5+1);
        if(dir==0)
        {
            myPointDirection=random(5,85);
        }else if(dir==1)
        {
            myPointDirection=random(275,355);
        }
        ray=(myPointDirection*(Math.PI/180));
        myDirectionX=(rand)*Math.cos(ray);
        myDirectionY=(rand)*Math.sin(ray);
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
    public void appear()
    {
    	if(topSide==1)
    	{
    		myCenterX=(int)(Math.random()*990+5);
    		if(topDown==1)
    		{	
    			myCenterY=0;
    		}else if(topDown==2)
    		{
    			myCenterY=1000;
    		}
    	}else if(topSide==2)
    	{
    		if(leftRight==1)
    		{
    			myCenterX=0;
    		}else if(leftRight==2)
    		{
    			myCenterX=1000;
    		}
    		myCenterY=(int)(Math.random()*990+5);
    	}
    }
    public boolean cloDet(int box, int boy)
	{
        //ALERT! You can use operator overiding for this and bomDet()
		return dist(box, boy, (float)myCenterX, (float)myCenterY)<=20;
	}
	public boolean bomDet(int box, int boy, int sphe)
	{
		//if(dist(box, boy, this.getX(), this.getY())>sphe+5||dist(box, boy, this.getX(), this.getY())<sphe-5)
		return dist(box, boy, (float)myCenterX, (float)myCenterY)<=sphe;
    }
}