class Star{
  private int x, y;
  private int colors[];
  public Star(int sX, int sY, int[] sRGB){
    colors = sRGB;
    x = sX;
    y = sY;
  }
  public void show(){
    fill(colors[0], colors[1], colors[2]);
    noStroke();
    translate(x, y);
    rotate(PI/4);
    rect(0,0,2,2);
    rotate(PI/-4);
    translate(-x, -y);
    stroke(1);
  }
}