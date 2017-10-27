abstract class SpaceFloater extends Floater {
  //Tells whether this instance uses sprites or point rendering
  protected final boolean IS_SPRITE_FLOATER;

	//Implement abstract getter/setter methods
  public int getX(){ return (int) myCenterX; }
  public void setX(int x){ myCenterX = x; }
  public void setY(int y){ myCenterY = y; };
  public int getY(){ return (int) myCenterY; }
  public void setDirectionX(double x){ myDirectionX = x; }
  public double getDirectionX(){ return (int) myDirectionX; }
  public void setDirectionY(double y){ myDirectionY = y; }
  public double getDirectionY(){ return (int) myDirectionY; }
  public void setPointDirection(int degrees){ myPointDirection = degrees; }
  public double getPointDirection(){ return (int) myPointDirection; }

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

  //Override show
  public void show(){
  	translate((float) myCenterX, (float) myCenterY);
  	rotate(radians((float) myPointDirection));
  	drawSelf();
  	translate(-1*(float) myCenterX, -1*(float) myCenterY);
  	rotate(radians(-1*(float) myPointDirection));
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

  //ShowSelf function that must be implemented by SpaceFloater's children
  abstract protected void drawSelf();
}
