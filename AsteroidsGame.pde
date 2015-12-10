public SpaceShip tom;
public Asteroid bob;
private ArrayList <Asteroid> aList;
aList = new ArrayList <Asteroid>();
//Star[] bob = new Star[200];
private boolean keyW = false;
private boolean keyA = false;
private boolean keyS = false;
private boolean keyD = false;
private boolean keyB = false;
private PImage back;

public void setup() 
{
  size(600,600);
  tom = new SpaceShip(0,0,0);
  bob = new Asteroid();
  back = loadImage("deathstar.png");
  /*for (int i = 0; i < bob.length; i++)
  {
    bob[i] = new Star();
  }*/
}
public void draw() 
{
  image(back,300,300,600,600);
  tom.show();
  tom.move();
  tom.notAccelerating();
  bob.show();
  bob.move();
  /*for (int i = 0; i < bob.length; i++)
  {
    bob[i].show();
  }*/
  
}
public void keyPressed()
{
  if(key == 'w' || keyCode == UP)
  {
    keyW = true;
  }
  if(key == 'a' || keyCode == LEFT)
  {
    keyA = true;
  }
  if(key == 'd' || keyCode == RIGHT)
  {
    keyD = true;
  }
  if(key == 's' || keyCode == DOWN)
  {
    keyS = true;
  }
  if(key == 'h')
  {
    tom.hyperSpace();
    tom.setDirectionX(0);
    tom.setDirectionY(0);
  }
  if(key == 'b')
  {
    keyB = true;
  }
}
public void keyReleased()
{
  if(key == 'w' || keyCode == UP)
  {
    keyW = false;
  }
  if(key == 'a' || keyCode == LEFT)
  {
    keyA = false;
  }
  if(key == 's' || keyCode == DOWN)
  {
    keyS = false;
  }
  if(key == 'd' || keyCode == RIGHT)
  {
    keyD = false;
  }
  if(key == 'b')
  {
    keyB = false;
  }
}
class SpaceShip extends Floater  
{   
    private PImage ship;
    private String currentShip;
    private double dRadians;
    private int maxSpeed;
    private int maxBreak;
    public SpaceShip(int x, int y, int degrees) 
    {
      /*corners = 4;  //the number of corners, a triangular floater has 3   
      int[] xS = {40,-21,0,-12};
      int[] yS = {0,-20,0,20};
      xCorners = xS;
      yCorners = yS;    //OLD SHIP
      myColor = 255; */  
      myCenterX = 300;
      myCenterY = 300; //holds center coordinates   
      myDirectionX = 0; 
      myDirectionY = 0; //holds x and y coordinates of the vector for direction of travel   
      myPointDirection = 0;
      ship = loadImage("falcon.png");
      currentShip = "falcon.png";
      // dRadians = Math.asin((mouseY-myCenterY) / (dist((float)myCenterX,(float)myCenterY,mouseX,mouseY))); 
      // if((mouseX - myCenterX)<0)
      // {
      //   dRadians=Math.PI-dRadians;
      // }
    }
    public void hyperSpace()
    {
      myCenterX = (int)(Math.random()*600);
      myCenterY = (int)(Math.random()*600);
      myPointDirection = (int)(Math.random()*360);
    }
    public void show()
    {
      // super.show();
      // double dRadians = myPointDirection*(Math.PI/180);
      // translate((int)myCenterX,(int)myCenterY);
      // rotate((float)(dRadians - (270*(Math.PI/180))));
      // image(ship,0,0,80,58);
      // rotate(-(float)(dRadians -(270*(Math.PI/180))));
      // translate(-(int)myCenterX,-(int)myCenterY);
      // if(dist((float)myCenterX,(float)myCenterY,mouseX,mouseY) != 0)
      // {
      //   dRadians = Math.acos((mouseX-myCenterX)/(dist((float)myCenterX,(float)myCenterY,mouseX,mouseY))); 
      // }
      // if((mouseY - myCenterY) < 0)
      // {
      // dRadians *=- 1;
      // }
        super.show();
        double dRadians = myPointDirection*(Math.PI/180);
        translate((int)(myCenterX),(int)(myCenterY));
        imageMode(CENTER);
        if(keyW == true)
        {
          tom.accelerate(0.3);
        }
        if(keyA == true)
        {
          rotate((float)Math.PI/2);
          rotate((float)-Math.PI/2);
        }
        if(keyS == true)
        {
          tom.accelerate(-0.3);
        }
        if(keyD == true)
        {
          rotate((float)-Math.PI/2);
          rotate((float)Math.PI/2);
        }
        if(keyB == true)
        {
          tom.stop(0);
        }
        rotate((float)(dRadians-(0*(Math.PI/180))));
        image(ship,0,0,80,58);
        rotate(-(float)(dRadians-(0*(Math.PI/180))));
        translate(-(int)(myCenterX),-(int)(myCenterY));
        ship = loadImage(currentShip);
    }
    public void accelerate(double dAmount)
    {
      maxSpeed = 5;
      myDirectionX += ((dAmount) * Math.cos(dRadians)); 
      myDirectionY += ((dAmount) * Math.sin(dRadians));
      if(myDirectionX > maxSpeed)
        myDirectionX = maxSpeed;
      if(myDirectionY > maxSpeed)
        myDirectionY = maxSpeed;
      if(myDirectionX < -1 * maxSpeed)
        myDirectionX = -1 * maxSpeed;
      if(myDirectionY < -1 * maxSpeed)
        myDirectionY = -1 * maxSpeed;
      if(dAmount > 0)
      {
        currentShip = "falconmove.png";
      }
    }
    public void notAccelerating()
    {
      if(currentShip != "falcon.png")
      {
        currentShip = "falcon.png";
      }
    }
    public void stop(double dAmount)
    {
      maxBreak = 0;
      myDirectionX += ((dAmount) * Math.cos(dRadians)); 
      myDirectionY += ((dAmount) * Math.sin(dRadians));
      if(myDirectionX > maxBreak)
        myDirectionX = maxBreak;
      if(myDirectionY > maxBreak)
        myDirectionY = maxBreak;
      if(myDirectionX < -1 * maxBreak)
        myDirectionX = -1 * maxBreak;
      if(myDirectionY < -1 * maxBreak)
        myDirectionY = -1 * maxBreak;
      if(dAmount > 0)
      {
        currentShip = "falconmove.png";
      }
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
class Asteroid extends Floater
{
  private int rotSpeed;
  private PImage tie;
  public Asteroid()
  {
    myCenterX = (int)(Math.random()*600); 
    myCenterY = (int)(Math.random()*600);
    rotSpeed = (int)(Math.random()*5)-3;
    corners = 4;
    int[] xS = {-5,5,5,-5};
    int[] yS = {-5,-5,5,5};
    xCorners = xS;
    yCorners = yS; 
    myColor = 255; //OLD SHIP
    // tie = loadImage("tieAsteroid1.png");
  }
  public void move()
  {
    super.move();
    myPointDirection+=rotSpeed;
  }   
  public void show()
  {
    super.show();// image(tie,300,300,59,66);
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
class Star
{
  int x, y;
  Star()
  {
    x = (int)(Math.random()*600);
    y = (int)(Math.random()*600);
  }
  public void show()
  {
    stroke(255,255,255);
    fill(255,255,255);
    ellipse(x, y, 1, 1);
  }
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
  public void turn (int nDegreesOfRotation)   
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