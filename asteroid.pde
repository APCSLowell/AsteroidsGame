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

