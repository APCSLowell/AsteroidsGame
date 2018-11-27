class Star //note that this class does NOT extend Floater
{
	int stxr=(int)(Math.random()*990+5);
	int styr=(int)(Math.random()*990+5);
	public void show()
	{
		fill(255, 255, 255);
		ellipse(stxr, styr, 5, 5);
	}

}
