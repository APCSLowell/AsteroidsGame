class Spaceship extends SpaceFloater implements Collidable
{
  public Spaceship(int[] x, int[] y){
		super(x, y);
    myColor = color(
			(int) (Math.random()*203+53),
			(int) (Math.random()*202+53),
			(int) (Math.random()*202+53)
    );
	}
	public void move(){
		super.move();
		myDirectionX = myDirectionX / 1.005;
		myDirectionY = myDirectionY / 1.005;
	}
  //Add getters for vertices
  public double[] getXVertices(){
    double[] ret = new double[xCorners.length-1];
    //Loop through and apply angle, then add myCenterX
    for (int i = 0; i < xCorners.length-1; i++){
      //Skip second vertex
      if (i == 2) continue;
      ret[i] = cos(radians((float)myPointDirection)*xCorners[i])+myCenterX;
    }
    return ret;
  }
  public double[] getYVertices(){
    double[] ret = new double[yCorners.length-1];
    //Loop through and apply angle, then add myCenter Y
    for (int i = 0; i < yCorners.length-1; i++){
      //Skip 2nd vertex
      if(i==2) continue;
      ret[i] = sin(radians((float) myPointDirection)*yCorners[i])+myCenterY;
    }
    return ret;
  }
}
