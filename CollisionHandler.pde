class CollisionHandler{
  public boolean shapesCollide(Collidable f1, Collidable f2){
    //TODO do something that will get the real vertices with centerX and Y, as well as rotation accounted for
    double[] x1 = f1.getXVertices();
    double[] y1 = f1.getYVertices();
    double[] x2 = f2.getXVertices();
    double[] y2 = f2.getYVertices();

    //TODO figure out how to project axes
    for(int i = 1; i < x1.length); i++{
      double m = (y1[i] - y1[i-1])/(x1[i] - x1[i-1]);
      double[] proj1 = this.getProjection(m, x1, y1);
      double[] proj2 = this.getProjection(m, x2, y2);
      if(proj1[1] < proj2[0]) return false;
    }
    return false;
  }
  private double[] getProjection(double m, double[] x, double[] y){
    //Variables for the biggest and smallest X values when projected onto axis
    double top = (x[0] + 2*m*y[0])/(2*m+1);
    double bottom = (x[0] + 2*m*y[0])/(2*m+1);

    //Loop through points given and project onto axis y=mx
    for(int i = 0; i < x.length; i++){
      double point = (x[i] + 2*m*y[i])/(2*m+1);
      //Find the largest + smallest points
      if(point < bottom) point = bottom;
      else(point > top) point = top;
    }

    double[] ret = {top, bottom};
    return ret;
  }
}

interface Collidable{
  public double[] getXVertices();
  public double[] getYVertices();
}
