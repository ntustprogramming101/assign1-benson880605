  // Variable

  PImage soil;
  PImage bg;
  PImage life;
  PImage robot;
  PImage soldier;
  PImage groundHog;
  
  int soldierX = -80 ;
  int soldierY = 160+80*floor(random(4));
  int robotX = 80*floor(random(2,8));
  int robotY = 160+80*floor(random(4));
  int laserX = robotX+20 ;
  int laserXMax = laserX-160 ;

  int laserY = robotY+32 ;
  int laserWidth = 10 ;
  int laserWidthMax = 40 ;
  int laserSpeedX = 2 ;

void setup() {
  size( 640 , 480 , P2D );

  // Enter Your Setup Code Here

  noStroke();
  
  // Load Image

  bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");
  robot = loadImage("img/robot.png");
  soldier = loadImage("img/soldier.png");
  groundHog = loadImage("img/groundhog.png");
  
}

void draw() {
  // Enter Your Code Here

  // Put Image
  image ( bg , 0 , 0 );
  fill( 255 , 255 , 0 );
  ellipse( 590 , 50 , 130 , 130 );
  fill( 253, 184 , 19 );
  ellipse( 590 , 50 , 120 , 120 );
  fill( 124 , 204 , 25 );
  rect( 0 , 145 , 640 , 15);  
  image ( soil , 0 , 160 );
  image ( life , 10 , 10 );
  image ( life , 80 , 10 );
  image ( life , 150 , 10 );
  imageMode(CENTER);
  image ( groundHog , 320 , 120 );
  imageMode(CORNER);
  
  // Soldier
  
  image ( soldier , soldierX , soldierY );
  soldierX += 4;
  soldierX %= 640;  // Start from left
  if ( soldierX == 636 ){ soldierX = -80 ; }  // Let Soldier Out Of Window  
  
  // Robot And Laser
  
  image ( robot , robotX , robotY );
  fill( 255 , 0 , 0 );
  
  rect( laserX , laserY , laserWidth , 10 , 5 );
  laserWidth = min( laserWidth + laserSpeedX , laserWidthMax );  //  Let Width Between 5 to 40
  laserX -= laserSpeedX ;  //  Let Laser Move
  if(laserX <= robotX - 160 ){ laserX = robotX + 20; laserWidth = 10; } // Let Laser Restart
  
}
