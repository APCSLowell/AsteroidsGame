class Star //note that this class does NOT extend Floater
{
	private int centerX, centerY, size;
	public Star()
	{
		centerX = (int)(Math.random()*600);
		centerY = (int)(Math.random()*600);
		size = (int)(Math.random()*3)+1;
	}
	public void show()
	{
		fill(255);
		ellipse(centerX,centerY,size,size);
	}
}