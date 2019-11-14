class Asteroid extends Floater
{

	private double                                                                                                                                                                                                                                                        rotationRate;

	public Asteroid(
		int corners,
		int[] xCorners,
		int[] yCorners,
		int myColor,
		double myCenterX, double myCenterY,
		double myDirectionX, double myDirectionY,
		double myPointDirection,
		double rotationRate
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

		this.rotationRate = rotationRate;
	}

	public void move()
	{
		this.myPointDirection += this.rotationRate;
		super.move();
	}
}