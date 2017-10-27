//your variable declarations here
private final int NUM_STARS = 80;
Star[] stars = new Star[NUM_STARS];
Spaceship main;

public void setup() 
{
  //your code here
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
  int[] mainX = {2, -2, -1, -2};
  int[] mainY = {0, -2, -0, 2};
  main = new Spaceship(mainX, mainY);
}
public void draw() 
{
	//Clear
	fill(30);
	rect(0, 0, 640, 480);

  //Show stars
  for (int i = 0; i < NUM_STARS; i++) {
  	stars[i].show();
  }

  //Draw spaceship
  main.show();
}

class Star{
	private int x, y;
	private int colors[];
	public Star(int sX, int sY, int[] sRGB){
		colors = sRGB;
		x = sX;
		y = sY;
	}
	public void show(){
		fill(colors[0], colors[1], colors[2]);
		noStroke();
		translate(x, y);
		rotate(PI/4);
		rect(0,0,2,2);
		rotate(PI/-4);
		translate(-x, -y);		
		stroke(1);
	}
}