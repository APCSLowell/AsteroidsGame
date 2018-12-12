class Asteroid extends Floater
{
	private int astRot;
	public Asteroid(int x, int y, int rot)
	{
		astRot = rot;
		myColor = #808487;
		corners = 8;
		xCorners = new int[corners];
		yCorners = new int[corners];
		xCorners[0] = -0;
		yCorners[0] = -25;
		xCorners[1] = 10;
		yCorners[1] = -10;
		xCorners[2] = 25;
		yCorners[2] = 0;
		xCorners[3] = 10;
		yCorners[3] = 10;
		xCorners[4] = 0;
		yCorners[4] = 25;
		xCorners[5] = -10;
		yCorners[5] = 10;
		xCorners[6] = -25;
		yCorners[6] = 0;
		xCorners[7] = -10;
		yCorners[7] = -10;
		setDirectionX(Math.random()*6-3);
		setDirectionY(Math.random()*2-1);
		setX(x);
		setY(y);
	}
	public void setX(int x) {myCenterX = x;}
  	public int getX() {return (int)myCenterX;}
  	public void setY(int y) {myCenterY = y;}
  	public int getY() {return (int)myCenterY;}
  	public void setDirectionX(double x) {myDirectionX = x;}
  	public double getDirectionX() {return myDirectionX;}
  	public void setDirectionY(double y) {myDirectionY = y;}
 	public double getDirectionY() {return myDirectionY;}
  	public void setPointDirection(int degrees) {myPointDirection = degrees;}
  	public double getPointDirection() {return (double)myPointDirection;}
  	public void move()
  	{
  		turn(astRot);
  		super.move();
  	}
  	public void show()
  	{
  		super.show();
  	}
}