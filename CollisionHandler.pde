class CollisionHandler{
  public static boolean shapesCollide(SpaceFloater f1, SpaceFloater f2){
    //TODO do something that will get the real vertices with centerX and Y, as well as rotation accounted for
    int[] x1 = f1.getXVertices();
    int[] y1 = f1.getYVertices();
    int[] x2 = f2.getXVertices();
    int[] y2 = f2.getYVertices();
    if (x1.length != y1.length || x2.length != y2.length ||
      x1.length < 3 || x2.length < 3 || y1.length < 3 || y2.length < 3){
      System.err.println("shapesCollide() was given invalid arguments")
      return false;
    }
    //TODO figure out how to project axes
  }
}
