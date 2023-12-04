Spaceship m = new Spaceship();
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();


public void setup() 
{
  for(int i = 0; i < 8; i++){
    asteroids.add(new Asteroid());
  }
  size(500, 500);
  background(150);
}
public void draw() 
{
  background(0);
  m.show();
  m.myCenterX = m.myCenterX + m.myXspeed;
  m.myCenterY = m.myCenterY + m.myYspeed;
  if(m.myCenterX > 500){
    m.myCenterX = 0;
  }
  if(m.myCenterX < 0){
   m.myCenterX = 500; 
  }
  if(m.myCenterY > 500){
   m.myCenterY = 0; 
  }
  if(m.myCenterY < 0){
   m.myCenterY = 500; 
  }
  for(int i = 0; i < asteroids.size(); i++){
   Asteroid a = asteroids.get(i); 
   a.show();
   a.move();
   if(dist((float)a.getCenterX(), (float)a.getCenterY(), (float)m.myCenterX, (float)m.myCenterY) < 20){
     asteroids.remove(i);
   }
  }
}
public void keyPressed(){
  if(key == 'a'){
   m.myPointDirection = m.myPointDirection - 15; 
  }
  if(key == 'd'){
   m.myPointDirection = m.myPointDirection + 15; 
  }
  if(key == 'w'){
   m.myXspeed = m.myXspeed + 0.3*Math.cos(m.myPointDirection*Math.PI/180);
   m.myYspeed = m.myYspeed + 0.3*Math.sin(m.myPointDirection*Math.PI/180);
  }
  if(key == 'f'){
   m.myXspeed = 0;
   m.myYspeed = 0;
   m.myCenterX = (Math.random()*500);
   m.myCenterY = (Math.random()*500);
  }
  
}


class Asteroid extends Floater
{
  private double rot;
  public Asteroid(){
    rot = (Math.random()*10)-5;
    myCenterX = (Math.random()*500);
    myCenterY = (Math.random()*500);
    myXspeed = (Math.random()*10)-5;
    myYspeed = (Math.random()*10)-5;
    myPointDirection = 0;
    corners = 4; 
    xCorners = new int[corners]; 
    yCorners = new int[corners]; 
    xCorners[0] = -10; 
    yCorners[0] = -10; 
    xCorners[1] = 10; 
    yCorners[1] = -10; 
    xCorners[2] = 10; 
    yCorners[2] = 10;
    xCorners[3] = -10; 
    yCorners[3] = 10;
    myColor = 180;
    
    
    
  }
  public void move(){
    myPointDirection = myPointDirection + rot;
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

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
  public double getCenterX(){
   return myCenterX; 
  }
  public double getCenterY(){
   return myCenterY; 
  }
  
}


class Floater //Do NOT modify the Floater class! Make changes in the Spaceship class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myXspeed, myYspeed; //holds the speed of travel in the x and y directions   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myXspeed += ((dAmount) * Math.cos(dRadians));    
    myYspeed += ((dAmount) * Math.sin(dRadians));       
  }   
  public void turn (double degreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=degreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

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
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
} 


class Spaceship extends Floater  
{   
    public Spaceship(){
     myCenterX = 250;
     myCenterY = 250;
     myXspeed = 0;
     myYspeed = 0;
     myPointDirection = 0;
     corners = 3; 
     xCorners = new int[corners]; 
     yCorners = new int[corners]; 
     xCorners[0] = -8; 
     yCorners[0] = -8; 
     xCorners[1] = 16; 
     yCorners[1] = 0; 
     xCorners[2] = -8; 
     yCorners[2] = 8;
     myColor = 255;

    }
    
}


class Star //note that this class does NOT extend Floater
{
  //your code here
}




*This assignment was selected as a "Nifty CS Assignment" in 2008 by Nick Parlante @ Stanford*
