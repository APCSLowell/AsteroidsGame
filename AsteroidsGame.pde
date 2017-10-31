//your variable declarations here
private final int NUM_STARS = 80;
Star[] stars = new Star[NUM_STARS];
Spaceship main;
//@Deprecated
int hyperspaceCooldown = 0;
boolean debug = false;

public void setup()
{
  size(640, 480);
  background(15);

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
  noStroke();
	fill(15);
	rect(0, 0, 640, 480);

  //Show stars
  for (int i = 0; i < NUM_STARS; i++) {
  	stars[i].show();
  }

  //Draw + move spaceship
  main.move();
  main.show();

  //Debug
  if (debug){
    fill(255);
    textSize(20);
    String pointDirDebug = "Point direction: "+ main.getPointDirection();
    text(pointDirDebug, 10, 20);
    text("Keys pressed: " + key, 10, 40);
    text("Is key pressed? " + keyPressed, 10, 60);
  }
}

void keyCheck(){
  //Deprecated code
  /*if (hyperspaceCooldown > 0)
    hyperspaceCooldown--;
  else if (hyperspaceCooldown != 0)
    //Bug protection
    hyperspaceCooldown = 0;*/
  if(keyPressed == true){
    if (key == 'w' || key == 'W') {
      main.accelerate(.1);
    }
    if (key == 'a' || key == 'A'){
      main.turn(-5);
    }
    //TODO fix backwards acceleration
    /*if (key == 's' || key == 'S'){
      main.backAccelerate(.03);
    }*/
    if (key == 'd' || key == 'D'){
      main.turn(5);
    }
  }
}

void keyPressed(){
  if (key == 'q' || key == 'Q') debug = !debug;
  if (key == 'b' || key == 'B'){
    //Hyperspace
    main.setX( (int) (Math.random()*647-6) );
    main.setY( (int) (Math.random()*485-4) );
    main.setDirectionX(0);
    main.setDirectionY(0);
  }
}
