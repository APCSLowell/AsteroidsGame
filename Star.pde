class Star //note that this class does NOT extend Floater
{
  //your code here
	private int x, y;
	private int clr;
	private int size;

	public Star(int x, int y)
	{
		this.x = x;
		this.y = y;
		this.clr = color(220, 220, 220);
		this.size = 2 + (int)(3*Math.random());
	}

	public void show()
	{
		fill(this.clr);
		ellipse(this.x, this.y, this.size, this.size);
	}


}
