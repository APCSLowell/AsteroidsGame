class Asteroid extends SpaceFloater implements Collidable {

  //Variables for size and rotation speed
  private int mySize, myRotationSpeed;

  //Constructor with size
  public Asteroid(int size){
    super(false);
    this.myCenterX = Math.random()*647-6;
    this.myCenterY = Math.random()*485-4;
    this.myColor = color(255);
    this.mySize = size;

    //default point array
    int[] coordsX = {0,2,2,0,-2};
    int[] coordsY = {3,2,0,-1,1};
    this.corners = coordsX.length;
    this.xCorners = new int[coordsX.length];
    this.yCorners = new int[coordsX.length];
    for (int i = 0; i<coordsX.length; i++){
      this.xCorners[i] = coordsX[i]*size*8;
      this.yCorners[i] = coordsY[i]*size*8;
    }
    myDirectionX = Math.random()*3-1.5;
    myDirectionY = Math.random()*3-1.5;
    myPointDirection = Math.random()*364-3;
    myRotationSpeed = 5/mySize;
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
