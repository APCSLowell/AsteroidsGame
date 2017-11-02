class Asteroid extends SpaceFloater {

  //Variables for size and rotation speed
  private int mySize, myRotationSpeed;

  //Default point array
  private final int[] coordsX = {0,1,-1};
  private final int[] coordsY = {1,-1,-1};

  //Constructor with size
  public Asteroid(int size){
    super(false);
    this.myColor = color(255);
    this.mySize = size;
    for (int i = 0; i<coordsX.length; i++){
      xCorners = new int[coordsX.length];
      yCorners = new int[coordsX.length];
      xCorners[i] = coordsX[i]*size*20;
      yCorners[i] = coordsY[i]*size*20;
    }
    myDirectionX = 2;//Math.random()*9-4;
    myDirectionY = 2;//Math.random()*9-4;
    myPointDirection = 0;
    myRotationSpeed = 5;
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
    System.out.println("Moving asteroid at myDirectionX = "+myDirectionX+", myDirectionY = "+myDirectionY);
  }
  public void show(){
    super.show();
    System.out.println("Showing asteroid! IS_SPRITE_FLOATER is "+IS_SPRITE_FLOATER+", colorRed is "+red(myColor));
  }
}
