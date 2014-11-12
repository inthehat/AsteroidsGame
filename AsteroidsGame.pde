SpaceShip s = new SpaceShip();//your variable declarations here
Star[] ss = new Star[100];
boolean w = false;
boolean a = false;
boolean d = false;
public void setup() 
{
  size(700,700);
  for(int i=0;i<ss.length;i++)
  {
    ss[i] = new Star();
  }
}
public void draw() 
{
  background(0);
  s.show();
  s.move();
  for(int i=0;i<ss.length;i++)
  {
    ss[i].show();
  }
  if(w == true && a == true)
  {
    s.accelerate(.1);
    s.rotate(-5);
  }
  else if(w==true&&d==true)
  {
    s.accelerate(.1);
    s.rotate(5);
  }
  else if(w == true)
  {
    s.accelerate(.1);
  }
  else if(a == true)
  {
    s.rotate(-5);
  }
  else if(d == true)
  {
    s.rotate(5);
  }
}
class SpaceShip extends Floater  
{   
  public void setX(int x){myCenterX = x;}//your code here
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
    SpaceShip()
    { 
    myColor = 255;
    corners = 3;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -10;
    yCorners[0] = -10;
    xCorners[1] = 20;
    yCorners[1] = 0;
    xCorners[2] = -10;
    yCorners[2] = 10;
    myCenterX = 350;
    myCenterY = 350;
    }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

public void keyPressed()
{
  if(key=='f')//hyperspace
  {
    s.setX((int)(Math.random()*700));
    s.setY((int)(Math.random()*700));
    s.setPointDirection((int)(Math.random()*360));
    s.setDirectionX(0);
    s.setDirectionY(0);
  }
  else if(key =='a')
  {
    a = true;
  }
  else if(key =='d')
  {
    d = true; 
  } 
  else if(key =='w')
  {
    w = true;
  }
}
public void keyReleased()
{
  if(key=='a')
  {
    a = false;
  }
  else if(key=='d')
  {
    d = false;
  }
  else if(key=='w')
  {
    w = false;
  }
}
class Star
{
  int myX, myY;
  Star()
  {
    myX = (int)(Math.random()*700);
    myY = (int)(Math.random()*700);
  }
  void show()
  {
    fill(255);
    ellipse(myX,myY,5,5);
  }
}
