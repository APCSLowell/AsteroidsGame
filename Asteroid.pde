class Asteroid extends SpaceFloater {
  //Variables for size and rotation speed
  private int mySize, myRotationSpeed;

  //Default point arrays for different sizes
  private final int[][] coordsSmall = {{},{}};
  private final int[][] coordsMed = {{},{}};
  private final int[][] coordsLarge = {{-6, -3, -4, -1, 5, 6, 7, 5, 3, -1, -2},{}};

  //Default constructor
  public Asteroid(){
    super(false);
	}

  //Constructor with size
  public Asteroid(int size){
    super(false);
    this.size = size;
    switch(size){
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
    }
  }
  private Asteroid breakApart(){
    this.size = size - 1;
    return new Asteroid(size);
  }

}
