class SpaceFloater extends Floater {
	//Implement abstract getter/setter methods
  public int getX(){ return myCenterX; }
  public void setY(int y); 
  public int getY(){ return myCenterY; };   
  public void setDirectionX(double x);   
  public double getDirectionX(){ return myDirectionX; };   
  public void setDirectionY(double y);   
  public double getDirectionY(){ return myDirectionY; };   
  public void setPointDirection(int degrees);   
  public double getPointDirection(){ return myPointDirection; };

  //Override show
  public void show(){
  	translate(myCenterX, myCenterY);
  	rotate(radians(myPointDirection));
  	drawSelf();
  	translate(-1*myCenterX, -1*myCenterY);
  	rotate(radians(-1*myPointDirection));
  }
}