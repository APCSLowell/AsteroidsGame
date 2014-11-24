private SpaceShip philip = new SpaceShip();
private Asteroids[] peter = new Asteroids[7];
private starSystem [] surroundings = new starSystem[100];


public void setup() 
{
  //your code here
  size(400,400);
  for(int a = 0; a < 5; a++){
  surroundings[a] = new Sun();
  }

  for(int i = 5; i < surroundings.length; ++i){
    surroundings[i] = new Star();
  }

  for (int b = 0; b < peter.length;b++) {
    peter[b] = new Asteroids();
  }
  
}
public void draw() 
{
  //your code here
  background(0);
  for (int z = 5; z < surroundings.length; ++z) {
    surroundings[z].show();
  }
  for(int b = 0 ; b < 5; b++)
  surroundings[b].show();
  

  philip.show();
  philip.move();
  for(int a = 0; a < peter.length;a++)
  {
   peter[a].show();
   peter[a].move();
 }


}   

void keyPressed()
{
  
  if(keyPressed == true && key == 'h')
  {
    philip.hyperSpace();
     for(int a = 0; a < 5; a++){
        surroundings[a] = new Sun();
     }
     for(int i = 5; i < surroundings.length; ++i){
       surroundings[i] = new Star();
     }
    for (int b = 0; b < peter.length;b++) {
      peter[b] = new Asteroids();
    }   
  }
  
  if(keyCode == LEFT)
    philip.rotate(-4);
  if(keyCode == RIGHT)
    philip.rotate(4);
  if(keyCode == UP)
    philip.accelerate(1);
  if(keyCode == DOWN)
    philip.accelerate(-1);
}

interface starSystem
{
   public void show();
}

class Sun extends Pixel implements starSystem
{
  private int siz;
  private int[] sunSpot = {100,300};
  public Sun()
  {
    
    siz = 28;
    cornerz = 6;
    xCornerz = new int [cornerz];
    yCornerz = new int [cornerz];
    xCornerz[0] = siz;     yCornerz[0] = 0;
    xCornerz[1] = siz/2;   yCornerz[1] = (int)(Math.sqrt(3)*siz/2);
    xCornerz[2] = -siz/2;  yCornerz[2] = (int)(Math.sqrt(3)*siz/2);
    xCornerz[3] = -siz;    yCornerz[3] = 0;
    xCornerz[4] = -siz/2;  yCornerz[4] = (int)(-1 *Math.sqrt(3)*siz/2);
    xCornerz[5] = siz/2;   yCornerz[5] = (int)(-1 * Math.sqrt(3)*siz/2);


    myColorz = color(255,233,66);
    myCenterXz = sunSpot[(int)(Math.random()*2)];
    myCenterYz = sunSpot[(int)(Math.random()*2)];
  }
  public void setXz(int x){myCenterXz = x;} 
  public int getXz(){return (int)myCenterXz;}   
  public void setYz(int y){myCenterYz = y;}   
  public int getYz(){return (int)myCenterYz;}   
  //has public void show ()
}

class Star  implements starSystem 
{
  private int starX,starY;
  private int starColor;
  private int starSiz;

  Star()
  { 
    starX = (int)(Math.random()*width);
    starY = (int)(Math.random()*height);
    starColor = color(69,86,95);
    starSiz = 3;
  }
  public void show()
  {
    fill(starColor);   
    stroke(starColor); 
    ellipse(starX, starY, starSiz, starSiz);
  }

  public void setX(int x){starX = x;}  
  public int getX(){return (int)starX;}   
  public void setY(int y){starY = y;}
  public int getY(){return (int)starY;}
  public void setSiz(int z){starSiz = z;}
  public int getSiz(){return (int)starSiz;} 


}

class Asteroids extends Floater
{
  private double turn;
  Asteroids()
  {
    corners = 3;
    xCorners  = new int[corners];
    yCorners  = new int[corners];
    xCorners[0] = -10; yCorners[0] = -10;
    xCorners[1] = 8; yCorners[1] = -5;
    xCorners[2] = 5; yCorners[2] = 11;
    myColor = color(230,0,210);
    myCenterX = (int)(Math.random()*width);
    myCenterY = (int)(Math.random()*height);
    myDirectionX = Math.random()*11-5;
    myDirectionY = Math.random()*11-5;
    myPointDirection = 0;
    turn = Math.pow(-1,(int)(Math.random()*2))*3; 
    System.out.println(Math.pow(-1,(int)(Math.random()*2))*3);
  }
  public void setX(int x){myCenterX =x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}
  public int getY(){return (int)myCenterY;}

  public void setDirectionX(double x) {myDirectionX = x;} 
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;} 
  public double getDirectionY(){return myDirectionY;}

  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
 
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;  
    myPointDirection+= turn;   

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

     myColor = color(75,90,100);
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

abstract class Pixel
{
    protected int cornerz;
    protected int xCornerz[];
    protected int yCornerz[];
    protected int myColorz;
    protected double myCenterXz;
    protected double myCenterYz;
    abstract public void setXz(int x);  
    abstract public int getXz();   
    abstract public void setYz(int y);   
    abstract public int getYz();   
    public void show ()  //Draws the floater at the current position  
    {             
    fill(myColorz);   
    stroke(myColorz);    
    //make the myDirection always = 0        
    double dRadians = 0;                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < cornerz; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCornerz[nI]* Math.cos(dRadians)) - (yCornerz[nI] * Math.sin(dRadians))+myCenterXz);     
      yRotatedTranslated = (int)((xCornerz[nI]* Math.sin(dRadians)) + (yCornerz[nI] * Math.cos(dRadians))+myCenterYz);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
     }
}
