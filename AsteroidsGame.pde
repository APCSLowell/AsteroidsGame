SpaceShip tom = new SpaceShip(0,0,0);

public void setup() 
{
  size(600,600);
}
public void draw() 
{
  background(0);
  tom.show();
  tom.move();
}
public void keyPressed()
{
  if(key == 'w' || keyCode == UP)
  {
    tom.accelerate(0.3);
  }
  if(key == 's' || keyCode == DOWN)
  {
    tom.accelerate(-0.3);
  }
  if(key == 'b')
  {
    tom.brake();
  }
  if(key == 'd' || keyCode == RIGHT)
  {
    tom.rotate(10);
  }
  if(key == 'a' || keyCode == LEFT)
  {
    tom.rotate(-10);
  }
  if(key == 'h')
  {
    tom.hyperSpace();
  }
}
class SpaceShip extends Floater  
{   
    SpaceShip(int x, int y, int degrees) 
    {
      corners = 12;  //the number of corners, a triangular floater has 3   
      int[] xS = {-11,0,18,18,13,13,18,18,7,10,10,0};
      int[] yS = {0,11,3,2,2,-1,-1,-2,-7,-8,-9,-10};
      xCorners = xS;
      yCorners = yS;
      myColor = 255;   
      myCenterX = 300;
      myCenterY = 300; //holds center coordinates   
      myDirectionX = 0; 
      myDirectionY = 0; //holds x and y coordinates of the vector for direction of travel   
      myPointDirection = 0; 
    }
    public void brake()
    {
      boolean brake = true;
      if(brake == true)
      {
        tom.accelerate(-0.9);
      }
      if(myDirectionX == 0)
      {
        tom.accelerate(0);
        brake = false;
      }
    }
    public void hyperSpace()
    {
      myCenterX = (int)(Math.random()*600);
      myCenterY = (int)(Math.random()*600);
      myPointDirection = (int)(Math.random()*360);
    }
    public void setX(int x){myCenterX = x;}  
    public int getX(){return (int)myCenterX;}   
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX = x;}   
    public double getDirectionX(){return myDirectionX;}   
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return myDirectionY;}   
    public void setPointDirection(int degrees){myPointDirection = degrees;}   
    public double getPointDirection(){return myPointDirection;}
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians = myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX > width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 