import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class AsteroidsGame extends PApplet {

SpaceShip philip = new SpaceShip();

public void setup() 
{
  //your code here
  size(400,400);
}
public void draw() 
{
  //your code here
  background(0);
  philip.show();
  philip.move();

}

public void keyPressed()
{
  if(keyPressed == true && key == 'h')
    philip.hyperSpace();
  if(keyCode == LEFT)
    philip.rotate(-4);
  if(keyCode == RIGHT)
    philip.rotate(4);
  if(keyCode == UP)
    philip.accelerate(1);
  if(keyCode == DOWN)
    philip.accelerate(-1);

}

class SpaceShip extends Floater  
{   
  SpaceShip()
  {
     corners = 10;
     xCorners  = new int[corners];
     yCorners  = new int[corners];
     xCorners[0] = 10;  yCorners[0] = -7;
     xCorners[1] = 25;  yCorners[1] = 0;
     xCorners[2] = 10;  yCorners[2] = 7;
     xCorners[3] = 10;  yCorners[3] = 20;
     xCorners[4] = -20; yCorners[4] = 20;
     xCorners[5] = -13; yCorners[5]= 10;
     xCorners[6] = -13; yCorners[6] = 0;
     xCorners[7] = -13; yCorners[7] = -10;
     xCorners[8] = -20; yCorners[8] = -20;
     xCorners[9] = 10;  yCorners[9] = -20;

     myColor = (0xff45595F);
     myCenterX = 200;
     myCenterY = 200;
     myDirectionX = 0;
     myDirectionY = 0;
     myPointDirection = 0;
  }

  public void hyperSpace()
  {
      myPointDirection = 0;
      myDirectionX = 0;
      myDirectionY = 0;
      myCenterX = (int)(Math.random() * width);
      myCenterY = (int)(Math.random() * height);  
  }

  public void setX(int x){myDirectionX =x;}
  public int getX(){return (int)myDirectionX;}
  public void setY(int y) {myCenterY = y;}
  public int getY(){return (int)myCenterY;}

  public void setDirectionX(double x) {myDirectionX = x;} 
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
    double dRadians =myPointDirection*(Math.PI/180);     
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
    if(myCenterX >width)
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

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "AsteroidsGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
