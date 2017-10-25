abstract class SpriteFloater extends Floater {
	//Implement abstract getter/setter methods
  public int getX(){ return (int) myCenterX; }
  public void setY(int y){ myCenterY = y; };
  public int getY(){ return (int) myCenterY; }
  public void setDirectionX(double x){ myDirectionX = x; }
  public double getDirectionX(){ return (int) myDirectionX; }
  public void setDirectionY(double y){ myDirectionY = y; }
  public double getDirectionY(){ return (int) myDirectionY; }
  public void setPointDirection(int degrees){ myPointDirection = degrees; }
  public double getPointDirection(){ return (int) myPointDirection; }

  //Add sprite image variable for storing location of sprite
  private PImage spriteImage;

  //Constructor
  SpriteFloater(String sprite){
    spriteImage = loadImage(sprite);
    myCenterX = 320;
    myCenterY = 240;

  }

  //Override show
  public void show(){
  	translate((float) myCenterX, (float) myCenterY);
  	rotate(radians((float) myPointDirection));
  	drawSelf();
  	translate(-1*(float) myCenterX, -1*(float) myCenterY);
  	rotate(radians(-1*(float) myPointDirection));
  }

  //Add ShowSelf function
  abstract void drawSelf();
}