class Spaceship extends SpaceFloater
{
  public Spaceship(int[] x, int[] y){
		super(x, y);
	}
  protected void drawSelf(){
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }

    endShape(CLOSE);
  }
}
