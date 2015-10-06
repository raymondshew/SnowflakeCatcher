Snowflake [] snowing;
int fallD;
int totalSnowFlakes = 50;
void setup()
{
  background(0); 
  size(300,300);
  snowing = new Snowflake[500];
  for(int i = 0; i < totalSnowFlakes; i++) {
    snowing[i] = new Snowflake(false);
  }
  //your code here
}
void draw()
{  
  fallD = 0;
  for (int i = 0; i < totalSnowFlakes; i++){
    snowing[i].erase();
    snowing[i].lookDown();
    snowing[i].move();
    snowing[i].wrap();
    snowing[i].show();
    snowing[i].checkMoving();
  }
  if (fallD < 50) {
    totalSnowFlakes += 1;
    snowing[totalSnowFlakes-1] = new Snowflake(true);
  }
  //your code here
}
void mouseDragged()
{
  stroke(0,255,0);
  strokeWeight(5);
  line(pmouseX,pmouseY,mouseX,mouseY);
  strokeWeight(1);
  stroke(0);
  //your code here
}

class Snowflake
{
  int x;
  int y;
  boolean falling;
  boolean startTop;
  //class member variable declarations
  Snowflake(boolean inputstartTop)
  {
    x = (int)(Math.random()*301);
    if (inputstartTop == true) {
      y = 0;
    }
    else {
      y = (int)(Math.random()*296);
    }
    falling = true;
    //class member variable initializations
  }
  void show()
  {
    fill(255);
    ellipse(x,y,5,5);
    //your code here
  }
  void lookDown()
  {
    if (y > 0 && y < 300) {
      if(get(x,y+4) != color(0)) {
        falling = false;
      }
      else {
        falling = true;
      }
    }
    //your code here
  }
  void erase()
  {
    fill(0);
    ellipse(x,y,7,7);
    //your code here
  }
  void move()
  {
    if(falling == true){
      y += 1;
    }
    //your code here
  }
  void wrap()
  {
    if(y == 296) { 
      y = 0;
      x = (int)(Math.random()*301);
    }
    //your code here
  }

  void checkMoving()
  {
    if(falling == true) {
      fallD+= 1;
    }
  }
}