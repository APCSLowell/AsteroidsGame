//your variable declarations here
private final int NUM_STARS = 80;
Star[] stars = new Star[NUM_STARS];
Spaceship main;
int hyperspaceCooldown = 0;

public void setup()
{
  size(640, 480);
  background(30);

  //Initialize stars
  for (int i = 0; i < NUM_STARS; i++) {
  	int[] col = {
  				(int) (Math.random()*203+53),
  				(int) (Math.random()*202+53),
  				(int) (Math.random()*202+53)
  			};
  	stars[i] = new Star(
  			(int) (Math.random()*647-6),
  			(int) (Math.random()*485-4),
  			col
  		);
  }

  //Initialize main spaceship
  int[] mainX = {10, -10, -5, -10};
  int[] mainY = {0, -10, -0, 10};
  main = new Spaceship(mainX, mainY);
}
public void draw()
{
  //Run keyCheck
  keyCheck();

	//Clear
	fill(30);
	rect(0, 0, 640, 480);

  //Show stars
  for (int i = 0; i < NUM_STARS; i++) {
  	stars[i].show();
  }

  //Draw + move spaceship
  main.move();
  main.show();
}

void keyCheck(){
  if (hyperspaceCooldown > 0)
    hyperspaceCooldown--;
  else if (hyperspaceCooldown != 0)
    //Bug protection
    hyperspaceCooldown = 0;

  if (keyPressed == true){
    if (key == 'w' || key == 'W') {
      main.accelerate(.03);
    }
    if (key == 'a' || key == 'A'){
      int d = (int) main.getPointDirection() -5;
      main.setPointDirection(d);
    }
    //TODO fix backwards acceleration
    /*if (key == 's' || key == 'S'){
      main.backAccelerate(.03);
    }*/
    if (key == 'd' || key == 'D'){
      int d = (int) main.getPointDirection() + 5;
      main.setPointDirection(d);
    }
    if (key == 'b' || key == 'B'){
      //Hyperspace
      if (hyperspaceCooldown == 0){
        main.setX( (int) (Math.random()*647-6) );
        main.setY( (int) (Math.random()*485-4) );
        main.setDirectionX(0);
        main.setDirectionY(0);
        hyperspaceCooldown = 100;
      }
    }
  }
}
