public class Boss extends Floater
{
	int ver=0;
    int hor=0;
    public Boss()
    {
    	//xCorners=new int[]{-1,-2,-2,-6,-6,-14,-14,-15,-15,-16,-16,-17,-17,-16,-16,-15,-15,-14,-14,-5,-5,-3,-3,-2,-2,2,2,3,3,5,5,14,14,15,15,16,16,17,17,16,16,15,15,14,14,6,6,2,2,1};
    	//yCorners=new int[]{20,1,2,2,1,1,2,2,15,15,2,2,-10,-10,-11,-11,-10,-10,-9,-11,-16,-16,-10,-9,-11,-11,-9,-10,-16,-16,-11,-9,-10,-10,-11,-11,-10,-10,2,2,15,15,2,2,1,1,2,2,1,20};
    	yCorners=new int[]{-100,80,90,100,100,90,80};
    	xCorners=new int[]{0,40,20,20,-20,-20,-40};
    	for(int v=0;v<yCorners.length;v++)
        {
            ver=yCorners[v];
            ver=ver*4;
            yCorners[v]=ver;
        }
        for(int h=0;h<xCorners.length;h++)
        {
            hor=xCorners[h];
            hor=hor*4;
            xCorners[h]=hor;
        }
        //corners=50;
    	corners=7;
    	myColor=color(211,211,211);
    	myCenterX=900;
    	myCenterY=500;
    	myDirectionX=0;
    	myDirectionY=0;
    	myPointDirection=180;
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