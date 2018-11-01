class Star //note that this class does NOT extend Floater
{
  private float myX,myY,radX,radY,myColor;
  public Star()
  {
    myColor=0;
    fill(myColor);
    myX=((float)Math.random()*380+10);
    myY=((float)Math.random()*380+10);
    radX=((float)Math.random()*20+5);
    radY=((float)Math.random()*20+5);
  }
  public void showAsteroids(){
    ellipse(myX,myY,radX,radY);
  }
}
