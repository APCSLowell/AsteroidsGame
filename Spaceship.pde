class Spaceship extends SpaceFloater
{
  public Spaceship(int[] x, int[] y){
		super(x, y);
    myColor = color(
			(int) (Math.random()*203+53),
			(int) (Math.random()*202+53),
			(int) (Math.random()*202+53)
    );
		System.out.println("red: "+red(myColor));
		System.out.println("green: "+green(myColor));
		System.out.println("blue: "+blue(myColor));
	}
	public void move(){
		super.move();
		myDirectionX = myDirectionX / 1.005;
		myDirectionY = myDirectionY / 1.005;
	}
}
