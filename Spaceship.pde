class Spaceship extends SpaceFloater
{
  //Better color field
  color myColor;

  public Spaceship(int[] x, int[] y){
		super(x, y);
    myColor = color(
			(int) (Math.random()*203+53),
			(int) (Math.random()*202+53),
			(int) (Math.random()*202+53)
    );
	}
}
