class BossHull extends Boss
{
	int ver=0;
    int hor=0;
    public BossHull()
    {
    	//xCorners=new int[]{-1,-2,-2,-6,-6,-14,-14,-15,-15,-16,-16,-17,-17,-16,-16,-15,-15,-14,-14,-5,-5,-3,-3,-2,-2,2,2,3,3,5,5,14,14,15,15,16,16,17,17,16,16,15,15,14,14,6,6,2,2,1};
    	//yCorners=new int[]{20,1,2,2,1,1,2,2,15,15,2,2,-10,-10,-11,-11,-10,-10,-9,-11,-16,-16,-10,-9,-11,-11,-9,-10,-16,-16,-11,-9,-10,-10,-11,-11,-10,-10,2,2,15,15,2,2,1,1,2,2,1,20};
    	xCorners=new int[]{80,40,40,80};
    	yCorners=new int[]{20,20,-20,-20};
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
    	corners=4;
    	myColor=color(175,175,175);
        myCenterX=900;
        myCenterY=0;
        myDirectionX=0;
        myDirectionY=0;
        myPointDirection=270;
    }
}