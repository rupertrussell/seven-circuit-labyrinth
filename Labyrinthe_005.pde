// Draw a classical seven circuit labyrinth
// by Rupert Russell
// 9 March 2020
// Thanks to:
// https://blogmymaze.wordpress.com/2020/02/23/how-to-calculate-the-classical-7-circuit-labyrinth
// 

int scale = 20;
float deltaX, deltaY; 

void setup() {
  size(800, 800);
  background(255);
  noLoop();
}

void draw() {
  translate(width/2, height/2);
  noFill();

  // outer circle
  circle(0, 0, 33 * scale);  // outer circle
  circle(0, 0, 4); // center marker

  strokeWeight(0.5);
  // Circles around center (0,0)
  circle(0, 0, 6 * scale);   // R3 
  circle(0, 0, 10 * scale);  // R5
  circle(0, 0, 14 * scale);  // R7
  circle(0, 0, 18 * scale);  // R9

  strokeWeight(6);
  line(0, 0, 0, 2.65 * scale);

  arc(0, 0, 6 * scale, 6 * scale, radians(146), radians(400)); // R3 around Center

  arc(3 * scale, 2.65 * scale, 6 * scale, 6 * scale, radians(40), radians(180) ); // R3 around M2
  arc(3 * scale, 2.65 * scale, 2 * scale, 2 * scale, radians(40), radians(220) ); // R1 around M2


  arc(0, 0, 14 * scale, 14 * scale, radians(146), radians(400));  // R7 around center

  arc(0, 0, 10 * scale, 10 * scale, radians(146), radians(400));  // R5


  arc(- 4.97 * scale, 3.36 * scale, 2 * scale, 2 * scale, radians(-35), radians(146) ); // R1 Radius around M3 (Left)
  
  arc(- 4.97 * scale, 3.36 * scale, 6 * scale, 6 * scale, radians(-35), radians(146) ); // R3 Radius around M3 (Left)
  
  arc(0, 0, 18 * scale, 18 * scale, radians(146), radians(400) );  // R9 around Center

  strokeWeight(1);

  // M2 Circle
  stroke(255, 0, 0); // red
  fill(255, 0, 0);
  circle(3 * scale, 2.65 * scale, 6); // center marker for M2 (Right)
  noFill();
  circle(3 * scale, 2.65 * scale, 2 * scale); // R1 Circle around M2

  // M3 Circle
  stroke(0, 0, 255); // blue
  fill(0, 0, 255); // blue
  circle(- 4.97 * scale, 3.36 * scale, 6); // center marker for M3 (Left)
  noFill();
  circle(- 4.97 * scale, 3.36 * scale, 2 * scale); // R1 Circle around M3


  noFill();
  // circle(0, 0, 8 * scale);  // test for M2 circle
  // circle(0, 0, 12 * scale);  // test for M3 circle


  // grid lines
  line(-width, 0, width, 0); // horizontal line through center
  line(0, -height, 0, height); // verticl line through center

  // center lines for M3
  line((-3.0 - 1.97) * scale, -height, (-3.0 - 1.97) * scale, height); // verticle line through center
  line(-width, 3.36 * scale, width, 3.36 * scale); // horizontal line through center

  // center lines for M2
  stroke(255, 0, 0); // red
  line(3 * scale, -height, 3 * scale, height); // verticle line through center
  line(-width, 2.65 * scale, width, 2.65 * scale); // horizontal line through center

  // line from center to cente of M2
  stroke(255, 0, 0); // red
  line(0, 0, 3.0 * scale, 2.65 * scale);
  deltaX = 3.0 * scale;
  deltaY = 2.65 * scale;
  line(0, 0, 3.0 * scale + deltaX * 3.5, 2.65 * scale + deltaY * 3.5);  // Extend line

  // line from center to cente of M3
  stroke(0, 0, 255); // blue
  line(0, 0, (-3.0 - 1.97) * scale, 3.36 * scale);
  deltaX = (-3.0 - 1.97) * scale;
  deltaY = 3.36 * scale;
  line(0, 0, (-3.0 - 1.97) * scale + deltaX * 2, 3.36 * scale + deltaY * 2);  // Extend line

  save("labyrinth_005.png");
}
