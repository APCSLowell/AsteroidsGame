import java.util.Date;
import java.util.Scanner;

//your variable declarations here
Spaceship spaceship;
ArrayList<Star> starList;
ArrayList<Asteroid> asteroidList;
boolean accelerating;
boolean rightDown;
boolean leftDown;
boolean hyperspace;

Scanner scanner;

//temporary
int[] asteroidVertexesX = {15, 8, 0, -7, -14, -8, -6, 0, 8};
int[] asteroidVertexesY = {3, 6, 8, 4, -2, -8, -10, -12, -4};
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
  int[] asteroidVertexesX = {15, 8, 0, -7, -14, -8, -6, 0, 8};
  int[] asteroidVertexesY = {3, 6, 8, 4, -2, -8, -10, -12, -4};
  for (int i = 0; i < 15; i++)
  {
    //asteroidList.add(new Asteroid(asteroidVertexesX.length, asteroidVertexesX, asteroidVertexesY, color(240), Math.random()*width, Math.random()*height, Math.random()*5-2, Math.random()*5-2,Math.random()*360, Math.random()*5-2));
  }
  asteroidList.add(new Asteroid(asteroidVertexesX.length, asteroidVertexesX, asteroidVertexesY, color(240), Math.random()*width, Math.random()*height, 0, 0, 0, 0));
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
   
   scanner = new Scanner(System.in);
}
public void draw() 
{
  background(0);
  spaceship.setX(mouseX);
  spaceship.setY(mouseY);
  spaceship.show(accelerating);
  //spaceship.move();

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
        //System.out.println("Going");
        for (int j = 0; j < asteroidVertexesX.length; j++)
        {
          //calculate left normal of each side
          //System.out.println("Iteration" + j);
          double normalX;
          double normalY;

          double shipMaxX, shipMaxY, shipMinX, shipMinY;
          shipMaxX = shipMaxY = 0;
          shipMinX = shipMinY = 9999999999L;
          double asteroidMaxX, asteroidMaxY, asteroidMinX, asteroidMinY;
          asteroidMaxX = asteroidMaxY = 0;
          asteroidMinX = asteroidMinY = 9999999999L;

          //if on last vertex of the side, go back to first
          if (j == asteroidVertexesX.length - 1)
          {
            normalX = -(asteroidVertexesY[0] - asteroidVertexesY[j]);
            normalY = asteroidVertexesX[0] - asteroidVertexesX[j];
          } else
          {
            normalX = -(asteroidVertexesY[j+1] - asteroidVertexesY[j]);
            normalY = asteroidVertexesX[j+1] - asteroidVertexesX[j];
          }

          ellipse((float)(asteroidVertexesX[j] + asteroid.getX()), (float)(asteroidVertexesY[j] + asteroid.getY()), 10, 10);

          //for each vertex, project onto normal
          for (int k = 0; k < asteroidVertexesX.length; k++)
          {
            double projectX = asteroidVertexesX[k] * normalX;
            double projectY = asteroidVertexesY[k] * normalY;

            if (asteroidMaxX < projectX)
            {
              asteroidMaxX = projectX;
            } else if (asteroidMinX > projectX)
            {
              asteroidMinX = projectX;
            }

            if (asteroidMaxY < projectY)
            {
              asteroidMaxY = projectY;
            } else if (asteroidMinY > projectY)
            {
              asteroidMinY = projectY;
            }
          }

          for (int k = 0; k < shipVertexesX.length; k++)
          {
            double projectX = shipVertexesX[k] * normalX;
            double projectY = shipVertexesY[k] * normalY;

            if (shipMaxX < projectX)
            {
              shipMaxX = projectX;
            } else if (shipMinX > projectX)
            {
              shipMinX = projectX;
            }

            if (shipMaxY < projectY)
            {
              shipMaxY = projectY;
            } else if (shipMinY > projectY)
            {
              shipMinY = projectY;
            }
          }
          //System.out.println("Calculated Normals");
          if (asteroidMaxX > shipMinX || shipMaxX > asteroidMinY)
          {
            System.out.println("collision");            
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

private int[] calcProjection() {
  return new int[]{};
}
