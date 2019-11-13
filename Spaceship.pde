class Spaceship extends Floater  
{   
	long hyperspaceTime;

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
		this.hyperspaceTime = 0;
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

		if ((new Date()).getTime() - hyperspaceTime > 0)
		{
			fill(0, 0, 255, 20);
			ellipse((float)(this.myCenterX), (float)(this.myCenterY), 10, 15);
		}
		else
		{
			this.hyperspaceTime = 0;
		}


			
		}
		super.show();
	}

	public void hyperspace()
	{
		this.myCenterX = Math.random() * width;
		this.myCenterY = Math.random() * height;
		this.myDirectionX = 0;
		this.myDirectionY = 0;
		this.myPointDirection = 0;
		this.hyperspaceTime = (new Date()).getTime();
	}
}
