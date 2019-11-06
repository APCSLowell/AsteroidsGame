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

	public void accelerate(double dAmount)
	{
		super.accelerate(dAmount);
		if (this.myDirectionX > 10)
		{
			this.myDirectionX = 10;
		}
		if (this.myDirectionY > 10)
		{
			this.myDirectionY = 10;
		}
	}

	public void show(boolean accelerating)
	{
		if (accelerating)
		{
			pushMatrix();

			translate((float)myCenterX, (float)myCenterY);
			float dRadians = (float)(myPointDirection*(Math.PI/180));
			rotate(dRadians);

			noStroke();
			fill(255, 204, 0);

			beginShape();
			vertex(-8, -8);
			vertex(-16, -4);
			vertex(-8, 0);
			vertex(-16, 4);
			vertex(-8, 8);
			endShape(CLOSE);

			fill(255, 0, 0);
			beginShape();
			vertex(-8, -8);
			vertex(-10, -4);
			vertex(-8, 0);
			vertex(-10, 4);
			vertex(-8, 8);
			endShape(CLOSE);
			popMatrix();


			
		}
		super.show();

	}
}
