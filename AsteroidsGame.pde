// import java.util.Scanner;

//your variable declarations here
Spaceship spaceship;
ArrayList<Star> starList;
ArrayList<Asteroid> asteroidList;
boolean accelerating;
boolean rightDown;
boolean leftDown;
boolean hyperspace;


//temporary
int[] asteroidVertexesX = {5, 5, -5, -5};//{15, 8, 0, -7, -14, -8, -6, 0, 8};
int[] asteroidVertexesY = {5, -5, -5, 5};//{3, 6, 8, 4, -2, -8, -10, -12, -4};
int[] shipVertexesX = {-8, 16, -8};
int[] shipVertexesY = {-8, 0, 8};

public void setup() 
{
  //your code here
  size(500, 500);
  spaceship = new Spaceship(3, new int[]{-8, 16, -8}, new int[]{-8, 0, 8}, color(255), width/2, height/2, 0, 0, 0); 
  starList = new ArrayList<Star>();
  for (int i = 0; i < 50; i++)
  {
    starList.add(new Star((int)(width*Math.random()), (int)(height*Math.random())));
  }

  asteroidList = new ArrayList<Asteroid>();
  //int[] asteroidVertexesX = {15, 8, 0, -7, -14, -8, -6, 0, 8};
  //int[] asteroidVertexesY = {3, 6, 8, 4, -2, -8, -10, -12, -4};
  for (int i = 0; i < 15; i++)
  {
    //asteroidList.add(new Asteroid(asteroidVertexesX.length, asteroidVertexesX, asteroidVertexesY, color(240), Math.random()*width, Math.random()*height, Math.random()*5-2, Math.random()*5-2,Math.random()*360, Math.random()*5-2));
  }
  asteroidList.add(new Asteroid(asteroidVertexesX.length, asteroidVertexesX, asteroidVertexesY, color(240), 300, 300, 0, 0, 0, 0));
  accelerating = false;
  rightDown = false;
  leftDown = false;

  //console.log(javascript);

  /*try
   	{
   		console.log(javascript);
   		if (javascript)
   		{
   			size(50, 50);
   		}
   	}
   	catch(Exception e)
   	{
   
   	}*/
   
   // scanner = new Scanner(System.in);
}
public void draw() 
{
  background(0);
  spaceship.setX(mouseX);
  spaceship.setY(mouseY);
  spaceship.show(accelerating);
  // spaceship.move();

  for (Star i : starList)
  {
    i.show();
  }

  for (int i = 0; i < asteroidList.size(); ++i)
  {
    Asteroid asteroid = asteroidList.get(i);
    if (true || dist((float)asteroid.getX(), (float)asteroid.getY(), (float)spaceship.getX(), (float)spaceship.getY()) < 20)
    {
      //asteroidList.remove(i);

      //implement SAT collision detection
      //https://gamedevelopment.tutsplus.com/tutorials/collision-detection-using-the-separating-axis-theorem--gamedev-169
      //get vertexes from asteroids instead next time

      //loop through each vertex of the asteroid
      
      
      
      
      
      if (true)
      {
        int[] shiftedAsteroidVertexesX = new int[asteroidVertexesX.length];
        int[] shiftedAsteroidVertexesY = new int[asteroidVertexesY.length];
        
        for (int j = 0; j < asteroidVertexesX.length; j++)
        {
          shiftedAsteroidVertexesX[j] = (int)(asteroidVertexesX[j] + asteroid.getX());
          shiftedAsteroidVertexesY[j] = (int)(asteroidVertexesY[j] + asteroid.getY());
        }
        
        int[] shiftedShipVertexesX = new int[shipVertexesX.length];
        int[] shiftedShipVertexesY = new int[shipVertexesX.length];
        
        for (int j = 0; j < shipVertexesX.length; j++)
        {
          shiftedShipVertexesX[j] = (int)(shiftedAsteroidVertexesX[j] + spaceship.getX());
          shiftedShipVertexesY[j] = (int)(asteroidVertexesY[j] + spaceship.getY());
        }
        
        //System.out.println("Going");
        for (int j = 0; j < asteroidVertexesX.length; j++)
        {
          
          //shift coordinate
          
          //calculate left normal of each side //<>//
          //System.out.println("Iteration" + j);
          double normalX;
          double normalY;

          //if on last vertex of the side, go back to first
          if (j == shiftedAsteroidVertexesX.length - 1)
          {
            normalX = -(shiftedAsteroidVertexesY[0] - shiftedAsteroidVertexesY[j]);
            normalY = shiftedAsteroidVertexesX[0] - shiftedAsteroidVertexesX[j];
          } else
          {
            normalX = -(shiftedAsteroidVertexesY[j+1] - shiftedAsteroidVertexesY[j]);
            normalY = shiftedAsteroidVertexesX[j+1] - shiftedAsteroidVertexesX[j];
          }
          
          double shipMax, shipMin;
          double asteroidMax, asteroidMin;
          shipMax = shipMin = shiftedShipVertexesX[0] * normalX + shiftedShipVertexesY[0] * normalY;
          asteroidMax = asteroidMin = shiftedAsteroidVertexesX[0] * normalX + shiftedAsteroidVertexesY[0] * normalY;

          //for each vertex, project onto normal
          for (int k = 0; k < shiftedAsteroidVertexesX.length; k++)
          {
            double projection = shiftedAsteroidVertexesX[k] * normalX + shiftedAsteroidVertexesY[k] * normalY;

            if (projection > asteroidMax)
            {
              asteroidMax = projection;
            } else if (projection < asteroidMin)
            {
              asteroidMin = projection;
            }
          }

          for (int k = 0; k < shiftedShipVertexesX.length; k++)
          {
            double projection = shiftedShipVertexesX[k] * normalX + shiftedShipVertexesY[k] * normalY;

            if (projection > shipMax)
            {
              shipMax = projection;
            } else if (projection < shipMin)
            {
              shipMin = projection;
            }
          }
          
          boolean collision = false;
          
          //System.out.println("Calculated Normals");
          if (asteroidMax < shipMin || shipMax < asteroidMin) //<>//
          {
            //System.out.println("No collision");
          }
          else
          {
            collision = true;
          }
          
          if (collision)
          {
            System.out.println("collision");
          }
          else
          {
            System.out.println("No Collision");
          }
        }
      }
    }
    asteroid.show();
    asteroid.move();
  }

  if (!spaceship.inHyperspace())
  {
    if (accelerating)
    {
      spaceship.accelerate(0.1);
    }

    if (leftDown && rightDown == false)
    {
      spaceship.turn(-4);
    } else if (rightDown && leftDown == false)
    {
      spaceship.turn(4);
    }
  }
}

public void keyPressed()
{
  switch(key)
  {
  case 'w':
  case 'W':
    accelerating = true;
    break;
  case 's':
  case 'S':
    accelerating = false;
    break;
  case 'a':
  case 'A':
    leftDown = true;
    break;
  case 'd':
  case 'D':
    rightDown = true;
    break;
  case 'f':
  case 'F':
    spaceship.hyperspace();
    break;
  }
}

public void keyReleased()
{
  switch(key)
  {
  case 'w':
  case 'W':
    accelerating = false;
    break;
    /*case 's':
     			case 'S':
     				accelerating = false;
     				break;*/
  case 'a':
  case 'A':
    leftDown = false;
    break;
  case 'd':
  case 'D':
    rightDown = false;
    break;
  }
}
