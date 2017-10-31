class Asteroid extends SpaceFloater {
  //Variable that stores the current size of the asteroid
  private int size;

  //Default constructor
  public Asteroid(){
    super(false);
	}

  //Constructor with size
  public Asteroid(int size){
    super(false);
    this.size = size;
    switch(size){
      case 1: xCorners[0] = 0;
              xCorners[1] = 0;
              xCorners[2] = 0;
              yCorners[0] = 0;
              yCorners[1] = 0;
              yCorners[2] = 0;
              break;
      case 2: xCorners[0] = 0;
              yCorners[0] = 0;
              break;
      case 3: xCorners[0] = 0;
              yCorners[0] = 0;
              break;
    }
  }
  protected void drawSelf(){
    //TODO use sprites rather than shapes

    noFill();

    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }

    endShape(CLOSE);
  }
  private Asteroid breakApart(){ return new Asteroid(); }

}
