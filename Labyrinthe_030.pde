// Draw a classical seven circuit labyrinth
// by Rupert Russell
// 9 March 2020
// Thanks to:
// https://blogmymaze.wordpress.com/2020/02/23/how-to-calculate-the-classical-7-circuit-labyrinth
// https://blogmymaze.files.wordpress.com/2020/02/calculator_cretan_7_mymaze_2020_en.pdf
// https://blogmymaze.files.wordpress.com/2019/11/fingerlabyrinthe_1_1_en.pdf
// https://blogmymaze.files.wordpress.com/2019/11/fingerlabyrinthe_1_1_en.jpg
// https://blogmymaze.wordpress.com/2019/12/01/how-to-draw-a-classical-finger-labyrinth/

// How to calculate points on a circle
// Based on code from http://www.mathopenref.com/coordcirclealgorithm...
// http://jeffreythompson.org/collision-detection/line-circle.php 

int lineCounter = 574 ;

float[] outerX; // store xPoints for the 10 points on the outer circle
float[] outerY; // store yPoints for the 10 points on the outer circle

float x;
float y;

int scale = 30;
int count = 0;

float greenR5 = 76.7; // End of Green R5 
float redR5End = 76.7 + 180; // end of Red R5

float r1 = 2 * scale;
float r2 = 4 * scale;
float r3 = 6 * scale;
float r5 = 10 * scale;
float r7 = 14 * scale;
float r9 = 18 * scale;
float r11 = 22 * scale;
float r13 = 26 * scale;
float r15 = 30 * scale;

float m1X = 0;
float m1Y = 0;

float m2X = 3 * scale;
float m2Y = 2.65 * scale;

float m3X = - 4.97 * scale;
float m3Y = 3.36 * scale;

float m4X = -3 * scale;
float m4Y = (3.36 * scale) + (7.75 * scale); 

float m5X = 4.97 * scale; 
float m5Y = (2.65 * scale) + (7.75 * scale); 

float deltaX, deltaY; 
float r3Start = 145.9;
float r5Start = 145.9;
float r7Start = 145.9;
float r9Start = 145.9;

float r3End = 401.3;
float r5End = 401.3;
float r7End = 401.3;
float r9End = 401.3;

float m2r1Start = 41;
float m2r3Start = 41;
float m2r1End = 221;
float m2r3End = 221;

float m3r1Start = -34;
float m3r3Start = -34;
float m3r1End = 145.9;
float m3r3End = 145.9;

float closestX = 0;
float closestY = 0;

float x1 = 0;    
float y1 = 0;
float x2 = 0;
float y2 = 0;

float cx = 0;      // circle to intersect with line x
float cy = 0;      // circle to intersect with line y
float r =  0;      // circle to intersect with line radius 

void setup() {
  strokeCap(SQUARE);
  size(900, 900);
  background(255);
  noLoop();

  outerX = new float[365 * 3]; // store x Points for the 10 points on the outer circle
  outerY = new float[365 * 3]; // store y Points for the 10 points on the outer circle

  calculateNPoints(365 * 2, 15);
}

void draw() {
  boolean guideLines = false;
  println("m2X = " + m2X / scale);

  background(255);
  translate(width/2, height/2);
  noFill();
  stroke(255, 0, 0); // red
  strokeWeight(1);
  line(m2X, m2Y, outerX[lineCounter], outerY[lineCounter]);

  // outer circle
  if (guideLines) {
    circle(0, 0, 33 * scale);  // outer circle
    circle(0, 0, 4); // center marker

    strokeWeight(0.5);
    // Circles around center (0,0)
    circle(0, 0, r3);   // R3 
    circle(0, 0, r5);  // R5
    circle(0, 0, r7);  // R7
    circle(0, 0, r9);  // R9
    circle(0, 0, r11);  // R11
    circle(0, 0, r13);  // R13
    circle(0, 0, r15);  // R15

    // end verticle line
  }
  stroke(255, 0, 0);
  strokeWeight(6);
  line(0, 0, 0, 2.65 * scale);


  arc(0, 0, 6  * scale, r3, radians(r3Start), radians(r3End)); // r3
  arc(0, 0, 10 * scale, r5, radians(r5Start), radians(r5End)); // r5
  arc(0, 0, 14 * scale, r7, radians(r7Start), radians(r7End)); // r7
  arc(0, 0, 18 * scale, r9, radians(r9Start), radians(r9End)); // r9
  arc(0, 0, 11 * r1, 11 * r1, radians(r9Start), radians(r9End)); // M1_R9 around Center
  arc(0, 0, 13 * r1, 13 * r1, radians(r9Start), radians(r9End)); // M1_R9 around Center
  arc(0, 0, 15 * r1, 15 * r1, radians(r9Start), radians(r9End)); // M1_R9 around Center

  stroke(0, 255, 0); // green
  arc(m2X, m2Y, r1, r1, radians(m2r1Start), radians(m2r1End)); // M2_R1
  arc(m2X, m2Y, r3, r3, radians(m2r3Start), radians(180) ); // M2_R3

  // m2r5
  stroke(0, 255, 0); // green
  arc(m2X, m2Y, r5, r5, radians(m2r3Start), radians(greenR5) ); // M2_R3

  // m2r11
  arc(m2X, m2Y, r11, r11, radians(m2r3Start), radians(greenR5) ); // M2_R3


  // m5r1 arc
  stroke(255, 0, 0);  // Red
  strokeWeight(6);
  arc(m5X, m5Y, r1, r1, radians(greenR5), radians(greenR5 + 180 ) ); // M5_R3

  // m5r3 arc
  stroke(255, 0, 0);  // Red
  arc(m5X, m5Y, r3, r3, radians(greenR5), radians(greenR5 + 180 ) ); // M3_R1 (Left)

  stroke(0, 250, 0);  // bright green
  //  arc(3 * scale, 2.65 * scale, 15 * scale, 15 * scale, radians(greenR5 -34), radians(greenR5) ); // M2_R3
  arc(m2X, m2Y, r7, r7, radians(greenR5 -35.5), radians(greenR5) ); // M2_R3
  arc(m2X, m2Y, r9, r9, radians(greenR5 -35.5), radians(greenR5) ); // M2_R3

  // arcs around m3
  stroke(0, 255, 0);  // Green
  arc(m3X, m3Y, r1, r1, radians(m3r1Start), radians(m3r1End) ); // M3_R1 (Left)
  arc(m3X, m3Y, r3, r3, radians(m3r3Start), radians(m3r3End) ); // M3_R3 (Left)
  strokeWeight(1);


  // M2 Circle
  stroke(255, 0, 0); // red
  fill(255, 0, 0);
  circle(m2X, m2Y, 6); // center marker for M2 (Right)
  noFill();
  circle(m2X, m2Y, r1); // R1 Circle around M2

  // M3 Circle
  stroke(0, 0, 255); // blue
  fill(0, 0, 255); // blue
  circle(m3X, m3Y, 6); // center marker for M3 (Left)
  noFill();
  circle(m3X, m3Y, r1); // R1 Circle around M3

  int m3r5Start = -105 + 180;
  float m3r5End =  m3r3End;

  // M3 arcs
  stroke(0, 255, 0); //  green
  strokeWeight(6);
  arc(m3X, m3Y, r5, r5, radians(m3r5Start), radians(m3r5End) ); // M4_R1
  arc(m3X, m3Y, r7, r7, radians(m3r5Start), radians(m3r5End) ); // M4_R1
  arc(m3X, m3Y, r9, r9, radians(m3r5Start), radians(m3r5End) ); // M4_R1

  // Final entry line 
  line(m1X, m4Y, m1X, m4Y + r2);

  // M5 Circle
  stroke(0, 255, 0); // green
  circle( m5X * scale, m5Y * scale, 6); // center marker for M5 (Right)
  noFill();
  circle(m5X * scale, m5Y * scale, r1); // R1 Circle around M5 7.75

  // M4 Circle
  if (guideLines) {
    stroke(0, 255, 255); // green
    strokeWeight(0.5);
    circle(m4X, m4Y, r1); // R1 Circle around M4
    circle(m4X, m4Y, 6); // Center of m4
  }

  // Line from center of M3 to center of M4
  line(m3X, m3Y, m4X, m4Y);

  // Extend Line from center of M3 to center of M4
  deltaX = m4X - m3X;
  deltaY = m4Y - m3Y;

  line(m3X, m3Y, m4X + deltaX, m4Y + deltaY);

  int m4r1Start = -102;
  int m4r1End = 75;

  int m4r3Start = -105;
  int m4r3End = 0;

  strokeWeight(6);
  stroke(255, 0, 0); // Red
  // R1 arc around M4
  arc(m4X, m4Y, r1, r1, radians(m4r1Start), radians(m4r1End) ); // M4_R1

  // R3 arc around M4
  arc(m4X, m4Y, r3, r3, radians(m4r3Start), radians(m4r3End) ); // M4_R1

  strokeWeight(1);


  noFill();
  // circle(0, 0, 8 * scale);  // test for M2 circle
  // circle(0, 0, 1r1);  // test for M3 circle

  // grid lines
  line(-width, 0, width, 0); // horizontal line through center
  line(0, -height, 0, height); // verticl line through center

  // center lines for M3
  line((-3.0 - 1.97) * scale, -height, (-3.0 - 1.97) * scale, height); // verticle line through center
  line(-width, m3Y, width, m3Y); // horizontal line through center

  // center lines for M2
  stroke(255, 0, 0); // red
  line(3 * scale, -height, 3 * scale, height); // verticle line through center
  line(-width, 2.65 * scale, width, 2.65 * scale); // horizontal line through center

  // line from M1 through M2 to Edge (right)
  stroke(255, 0, 0); // red
  line(0, 0, 3.0 * scale, 2.65 * scale);
  float deltaM2X = 3.0 * scale;
  float deltaM2Y = 2.65 * scale;
  line(0, 0, 3.0 * scale + deltaM2X * 3.5, 2.65 * scale + deltaM2Y * 3.5);  // Extend line

  float x1 = 0;    // coordinates of line from M1 through M2 to Edge (right)
  float y1 = 0;
  float x2 = 3.0 * scale + deltaM2X * 3.5;
  float y2 = 2.65 * scale + deltaM2Y * 3.5;

  // line from M1 through M3 to edge (left)
  stroke(255, 0, 0); // red
  strokeWeight(1);
  line(0, 0, (-3.0 - 1.97) * scale, m3Y);
  deltaX = (-3.0 - 1.97) * scale;
  deltaY = m3Y;
  line(0, 0, (-3.0 - 1.97) * scale + deltaX * 2, m3Y + deltaY * 2);  // Extend line line from M3

  // center lines for M5
  line(m5X * scale, -height, m5X* scale, height); // verticle line through center
  line(-width, m5Y * scale, width, m5Y * scale); // horizontal line through center
  strokeWeight(1);

  save("labyrinth_030.png");
  println("saved");
  // exit();
}

void calculateNPoints(float numPoints, float scaleFactor) {
  // calculate and store n points around the outer circle
  int counter = 0;
  double step = radians(360 /numPoints); 
  float h = m2X; 
  float k = m2Y;
  float r =  scale * scaleFactor ;
  for (float theta=0; theta < 2 * PI; theta += step) {
    float x = h + r * cos(theta);
    float y = k - r * sin(theta); 

    // store the calculated coordinates
    outerX[counter] = x;
    outerY[counter] = y;

    circle(x, y, 10);

    counter ++;
  }
} // end  calculateNPoints

void keyReleased() {
  println("lineCounter = " + lineCounter);
  if (key == CODED) {
    if (keyCode == UP) {
      lineCounter = lineCounter  + 1;
    } else if (keyCode == DOWN) {
      lineCounter = lineCounter - 1;
    }
  } else {
    println("");
    println("");
    println("lineCounter = " + lineCounter);
  }
  stroke(255, 0, 0); // red
  strokeWeight(1);
  line(m2X, m2Y, outerX[lineCounter], outerY[lineCounter]);
}
