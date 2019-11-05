class Spaceship extends Floater  
{   
	public Spaceship(
		int corners,
		int[] xCorners,
		int[] yCorners,
		int myColor,
		double myCenterX, double myCenterY,
		double myDirectionX, double myDirectionY,
		double myPointDirection
	)
	{
		this.corners = corners;
		this.xCorners = xCorners;
		this.yCorners = yCorners;
		this.myColor = myColor;
		this.myCenterX = myCenterX;
		this.myCenterY = myCenterY;
		this.myDirectionX = myDirectionX;
		this.myDirectionY = myDirectionY;
		this.myPointDirection = myPointDirection;
	}
}
