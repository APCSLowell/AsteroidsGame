class Spaceship extends SpaceFloater
{  
  public Spaceship(int[] x, int[] y){
		super(x, y);
	}
  protected void drawSelf(){
    //convert degrees to radians for rotate()     
    float dRadians = radians((float) myPointDirection);
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    
    endShape(CLOSE);
  }
}