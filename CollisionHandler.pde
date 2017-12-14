class CollisionHandler{
  public boolean shapesCollide(Collidable f1, Collidable f2){
    double[] x1 = f1.getXVertices();
    double[] y1 = f1.getYVertices();
    double[] x2 = f2.getXVertices();
    double[] y2 = f2.getYVertices();

    for(int i = 0; i < x1.length; i++){
      double m = (i!=0) ? (y1[i] - y1[i-1])/(x1[i] - x1[i-1])
        : (y1[i] - y1[y1.length-1])/(x1[i] - x1[x1.length-1]);
      m = -1/m;
      double[] proj1 = this.getProjection(m, x1, y1);
      double[] proj2 = this.getProjection(m, x2, y2);

      //debug
      if(i == 0) System.out.println(Arrays.toString(proj1));

      //Check if projections don't overlap - if they don't, they aren't colliding
      if(proj1[0] < proj2[1] || proj2[0] < proj1[1]) return false;
    }
    return true;
  }
  private double[] getProjection(double m, double[] x, double[] y){
    //Variables for the biggest and smallest X values when projected onto axis
    double top = (x[0]/m+y[0])/(m+1/m);
    double bottom = (x[0]/m+y[0])/(m+1/m);

    //Loop through points given and project onto axis y=mx
    for(int i = 0; i < x.length; i++){
      double point = (x[i]/m+y[i])/(m+1/m);
      //Find the largest + smallest points
      if(point < bottom) bottom = point;
      else if(point > top) top = point;
    }

    double[] ret = {top, bottom};
    return ret;
  }
}

interface Collidable{
  public double[] getXVertices();
  public double[] getYVertices();
}
