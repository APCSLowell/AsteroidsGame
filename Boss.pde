public class Boss extends Floater
{
	int ver=0;
    int hor=0;
    public Boss()
    {
    	//xCorners=new int[]{-1,-2,-2,-6,-6,-14,-14,-15,-15,-16,-16,-17,-17,-16,-16,-15,-15,-14,-14,-5,-5,-3,-3,-2,-2,2,2,3,3,5,5,14,14,15,15,16,16,17,17,16,16,15,15,14,14,6,6,2,2,1};
    	//yCorners=new int[]{20,1,2,2,1,1,2,2,15,15,2,2,-10,-10,-11,-11,-10,-10,-9,-11,-16,-16,-10,-9,-11,-11,-9,-10,-16,-16,-11,-9,-10,-10,-11,-11,-10,-10,2,2,15,15,2,2,1,1,2,2,1,20};
    	yCorners=new int[]{-200,-200,-190,-190,-200,-200,100,60,80,80,60,100,100,60,0,0,10,10,-80,-80};
    	xCorners=new int[]{-35,-45,-45,-55,-55,-65,-80,-65,-65,-35,-35,-20,0,60,60,40,40,30,10,-10};
    	for(int v=0;v<yCorners.length;v++)
        {
            ver=yCorners[v];
            ver=ver*2;
            yCorners[v]=ver;
        }
        for(int h=0;h<xCorners.length;h++)
        {
            hor=xCorners[h];
            hor=hor*2;
            xCorners[h]=hor;
        }
        //corners=50;
    	corners=20;
    	myColor=color(255,255,255);
    	myCenterX=1000;
    	myCenterY=400;
    	myDirectionX=0;
    	myDirectionY=0;
    	myPointDirection=270;
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
}