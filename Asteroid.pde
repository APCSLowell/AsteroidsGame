class Asteroid extends SpaceFloater {
  //Variables for size and rotation speed
  private int mySize, myRotationSpeed;

  //Default point array
  private final int[][] coords = {{-6, -3, -4, -1, 5, 6, 7, 5, 3, -1, -2},{-4, 0, 4, 8, 4, 0, 0, -3, -8, -4, -8, -4}};

  //Default constructor
  public Asteroid(){
    super(false);
	}

  //Constructor with size
  public Asteroid(int size){
    super(false);
    this.size = size;
    for (int i = 0; i<coords[0].length; i++){
      xCorners = new int[coords.length];
      yCorners = new int[coords.length];
      xCorners[i] = coords[0][i]*size*3;
      yCorners[i] = coords[1][i]*size*3;
    }
  }
  private Asteroid breakApart(){
    this.size = size - 1;
    return new Asteroid(size);
  }

}
