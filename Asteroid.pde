class Asteroid extends SpaceFloater {

  //Variables for size and rotation speed
  private int mySize, myRotationSpeed;

  //Default point array
  private final int[] coordsX = {-6, -3, -4, -1, 5, 2, 6, 7, 5, 3, -1, -2};
  private final int[] coordsY = {-4, 0, 4, 8, 4, 0, 0, -3, -8, -4, -8, -4};

  //Constructor with size
  public Asteroid(int size){
    super(false);
    this.mySize = size;
    for (int i = 0; i<coordsX.length; i++){
      xCorners = new int[coordsX.length];
      yCorners = new int[coordsX.length];
      xCorners[i] = coordsX[i]*size*3;
      yCorners[i] = coordsY[i]*size*3;
    }
    myDirectionX = Math.random()*9-4;
    myDirectionY = Math.random()*9-4;
    myPointDirection = 0;
    myRotationSpeed = 5/size;
  }
  private Asteroid breakApart(){
    this.mySize = mySize - 1;
    myRotationSpeed = 5/mySize;
    return new Asteroid(mySize);
  }

  //Override move()
  public void move(){
    super.move();
    myPointDirection+=myRotationSpeed;
  }
}
