Spaceship m = new Spaceship();
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();


public void setup() 
{
  for(int i = 0; i < 8; i++){
    asteroids.add(new Asteroid());
  }
  size(500, 500);
  background(150);
}
public void draw() 
{
  background(0);
  m.show();
  m.myCenterX = m.myCenterX + m.myXspeed;
  m.myCenterY = m.myCenterY + m.myYspeed;
  if(m.myCenterX > 500){
    m.myCenterX = 0;
  }
  if(m.myCenterX < 0){
   m.myCenterX = 500; 
  }
  if(m.myCenterY > 500){
   m.myCenterY = 0; 
  }
  if(m.myCenterY < 0){
   m.myCenterY = 500; 
  }
  for(int i = 0; i < asteroids.size(); i++){
   Asteroid a = asteroids.get(i); 
   a.show();
   a.move();
   if(dist((float)a.getCenterX(), (float)a.getCenterY(), (float)m.myCenterX, (float)m.myCenterY) < 20){
     asteroids.remove(i);
   }
  }
}
public void keyPressed(){
  if(key == 'a'){
   m.myPointDirection = m.myPointDirection - 15; 
  }
  if(key == 'd'){
   m.myPointDirection = m.myPointDirection + 15; 
  }
  if(key == 'w'){
   m.myXspeed = m.myXspeed + 0.3*Math.cos(m.myPointDirection*Math.PI/180);
   m.myYspeed = m.myYspeed + 0.3*Math.sin(m.myPointDirection*Math.PI/180);
  }
  if(key == 'f'){
   m.myXspeed = 0;
   m.myYspeed = 0;
   m.myCenterX = (Math.random()*500);
   m.myCenterY = (Math.random()*500);
  }
  
}
