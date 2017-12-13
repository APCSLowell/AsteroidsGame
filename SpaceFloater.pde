class SpaceFloater extends Floater implements Collidable{
  //Tells whether this instance uses sprites or point rendering
  protected final boolean IS_SPRITE_FLOATER;
  protected color myColor;

	//Implement abstract getter/setter methods
  public int getX(){ return (int) myCenterX; }
  public void setX(int x){ myCenterX = x; }
  public void setY(int y){ myCenterY = y; };
  public int getY(){ return (int) myCenterY; }
  public void setDirectionX(double x){ myDirectionX = x; }
  public double getDirectionX(){ return (int) myDirectionX; }
  public void setDirectionY(double y){ myDirectionY = y; }
  public double getDirectionY(){ return (int) myDirectionY; }
  public void setPointDirection(int degrees){
      myPointDirection = degrees;
      if (myPointDirection > 360) myPointDirection = myPointDirection - 360;
      if (myPointDirection < 0) myPointDirection = myPointDirection + 360;
  }
  public double getPointDirection(){ return (int) myPointDirection; }

  //Add getters for vertices
  //TODO fix these methods returning broken coordinates
  public double[] getXVertices(){
    double[] ret = new double[xCorners.length];
    //Loop through and apply angle, then add myCenterX
    for (int i = 0; i < xCorners.length; i++){
      double distance = Math.sqrt(Math.pow(xCorners[i], 2)+Math.pow(yCorners[i], 2));
      double angle = atan2(xCorners[i], yCorners[i]);
      ret[i] = cos(radians((float)myPointDirection)+(float)angle)*distance+myCenterX;
    }
    return ret;
  }
  public double[] getYVertices(){
    double[] ret = new double[yCorners.length];
    //Loop through and apply angle, then add myCenter Y
    for (int i = 0; i < yCorners.length; i++){
      double distance = Math.sqrt(Math.pow(xCorners[i], 2)+Math.pow(yCorners[i], 2));
      double angle = atan2(xCorners[i], yCorners[i]);
      ret[i] = sin(radians((float)myPointDirection)+(float)angle)*distance+myCenterY;
    }
    return ret;
  }

  //Add sprite image variable for storing location of sprite
  protected PImage spriteImage;

  //Constructor with sprite
  public SpaceFloater(String sprite){
    spriteImage = loadImage(sprite);
    myCenterX = 320;
    myCenterY = 240;
    IS_SPRITE_FLOATER = true;
  }

  //Constructor with points to draw
  public SpaceFloater(int[] x, int[] y){
    corners = x.length;
    xCorners = x;
    yCorners = y;
    myCenterX = 320;
    myCenterY = 240;
    IS_SPRITE_FLOATER = false;
  }

  //Default constructor
  public SpaceFloater(boolean spriteFloater){
    IS_SPRITE_FLOATER = spriteFloater;
  }

  //Override show
  public void show(){
    //Convert radians
    float dRadians = radians((float) myPointDirection);

    pushMatrix();
  	translate((float) myCenterX, (float) myCenterY);
  	rotate(dRadians);

    if(IS_SPRITE_FLOATER){
      //code for sprite rendering
    } else {
      fill(myColor);
      beginShape();
      for (int nI = 0; nI < xCorners.length; nI++)
      {
        vertex(xCorners[nI], yCorners[nI]);
      }
      endShape(CLOSE);
    }

  	popMatrix();
  }

  //New acceleration function for backwards movement
  //TODO fix this
  public void backAccelerate(double dAmount){
    //convert the current direction the floater is pointing to radians
    double dRadians =myPointDirection*(Math.PI/180);
    //change coordinates of direction of travel
    myDirectionX -= ((dAmount) * Math.cos(dRadians));
    myDirectionY -= ((dAmount) * Math.sin(dRadians));
  }

  //Memory-efficient turning
  public void turn (int nDegreesOfRotation)
  {
    //rotates the floater by a given number of degrees
    myPointDirection+=nDegreesOfRotation;
    if (myPointDirection > 360) myPointDirection -= 360;
    if (myPointDirection < 0) myPointDirection += 360;
  }
}
