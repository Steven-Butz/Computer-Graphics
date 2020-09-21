// Class: CS 3451
// Semester: Fall 2020
// Project number: 1
// Project title: Playing with Points and Vectors
// Student(s): Steven Butz

//======================= My global variables
PImage PictureOfMyFace; // picture of author's face, should be: data/pic.jpg in sketch folder
PImage PictureOfBanner; // picture of banner, should be: data/pic.jpg in sketch folder

boolean lerp=true, spiral=true; // toggles to display vector interpoations
float b=0, c=0.5, d=1; // initial knots
int partShown = 0;
//String [] PartTitle = new String[10];
String [] PartTitle = {"?","?","?","?","?","?","?","?","?","?"};


int numberOfParts = PartTitle.length;
PNTS DrawnPoints = new PNTS(); // class containing array of points, used to standardize GUI
PNTS SmoothenedPoints = new PNTS(); // class containing array of points, used to standardize GUI
DUCKS DucksRow = new DUCKS(20);

//**************************** My text  ****************************
String title ="Class: 3451, Year: 2020, Project 01",            
       name ="Student: Steven BUTZ";
String subtitle = "Playing with Points and Vectors";    
String guide="MyProject keys: '0' through '9' to select project parts, 'a' to start/stop animation "; // help info

//======================= my setup, executed once at the beginning 
void mySetup()
  {
  DrawnPoints.declare(); // declares all ControlPoints. MUST BE DONE BEFORE ADDING POINTS 
  SmoothenedPoints.declare(); // declares all ControlPoints. MUST BE DONE BEFORE ADDING POINTS 
  DrawnPoints.empty(); // reset pont list P
  SmoothenedPoints.empty(); // reset pont list P
  //initDucklings(); // creates Ducling[] points
  }

//======================= called in main() and executed at each frame to redraw the canvas
void showMyProject(PNT A, PNT B, PNT C, PNT D) // four points used to define 3 vectors
  {
  if(0<=partShown && partShown<numberOfParts)
    {
    switch(partShown) 
      {
      case 0: showPart0(A,B,C,D); break;
      case 1: showPart1(A,B,C,D); break;
      case 2: showPart2(A,B,C,D); break;
      case 3: showPart3(A,B,C,D); break;
      case 4: showPart4(A,B,C,D); break;
      case 5: showPart5(A,B,C,D); break;
      case 6: showPart6(A,B,C,D); break;
      case 7: showPart7(A,B,C,D); break;
      case 8: showPart8(A,B,C,D); break;
      case 9: showPart9(A,B,C,D); break;
      }
    }
  }

//====================================================================== PART 0
void showPart0(PNT A, PNT B, PNT C, PNT D) //
  {
  PartTitle[0] = "Experimenting sandbox";
  //cwf(red,4,green); 
  //VCT V = V(A,B);
  //show(A,V,dgreen,"V");
  //VCT R = R(V);
  //show(A,R,blue,"R(V)");
  //VCT W = R(V,PI/6);
  //show(A,W,dred,"R(V,π/6)");
  
  //VCT U = V(A,B);
  //VCT V = V(A,C);
  //show(A,U,dgreen,"U");
  //float w = angle(U,V);
  //float m = n(V)/n(U);
  //show(A,V,dred,"V("+nf(m,1,2)+",R(U,"+nf(w/PI,1,2)+"*PI))");
  //VCT W = V(m,R(U,w));
  //show(A,V,blue);
 
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }

//====================================================================== PART 1
boolean showX = true, showY = false, showZ = false;
void showPart1(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[1] =   "Complete the parallelogram"; // https://en.wikipedia.org/wiki/Parallelogram
  
  cwfo(dred, 5, pink, 70);
  showLoop(A, B, C);
  if (showX) {
    VCT AB = V(A, B);
    PNT X = P(C, AB);  //C + AB
    cwfo(dgreen, 5, lime, 70);
    showLoop(B, X, C);
    //show(C, AB, green, "AB");
    X.circledLabel("X");  //X was created using the formula C + AB
  }
  if (showY) {
    VCT BC = V(B, C);
    PNT Y = P(A, BC);  //A + BC
    cwfo(dblue, 5, cyan, 70);
    showLoop(A, Y, C);
    //show(A, BC, blue, "BC");
    Y.circledLabel("Y");  //Y was created using the formula A + BC
  }
  if (showZ) {
    VCT CA = V(C, A);
    PNT Z = P(B, CA);  //B + CA
    cwfo(dmagenta, 5, magenta, 70);
    showLoop(A, Z, B);
    //show(B, CA, magenta, "CA");
    Z.circledLabel("Z");  //Z was created using the formula B + CA
  }
  
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); // D.circledLabel("D");
  }

//====================================================================== PART 2
void showPart2(PNT A, PNT B, PNT C, PNT D) //   
  {
  PartTitle[2] = "Napoleon theorem"; // https://en.wikipedia.org/wiki/Napoleon%27s_theorem
  cwf(black,3,yellow);  showLoop(A,B,C);  

  
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); // D.circledLabel("D");
  }


//====================================================================== PART 3
void showPart3(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[3] = "Fermat point"; // https://en.wikipedia.org/wiki/Fermat_point

  VCT AB = V(A, B);
  VCT BC = V(B, C);
  VCT CA = V(C, A);

  // Part 1: Create the equilateral triangles
  VCT AX, BY, CZ;
  // Rotating AB 60° away from triangle ABC gives us the third vertex of an equilateral triangle (X = A + AB°-60)
  if (angle(AB, BC) > 0) {      // if ABC is clockwise around the triangle
    AX = R(AB, -PI/3);
    BY = R(BC, -PI/3);
    CZ = R(CA, -PI/3);
  } else {                      // if ABC is counterclockwise around the triangle
    AX = R(AB, PI/3);
    BY = R(BC, PI/3);
    CZ = R(CA, PI/3);
  }
  PNT X = P(A, AX);            // Create new points from the rotated vectors
  cwfo(dred, 3, pink, 100);
  showLoop(A, X, B);              
  PNT Y = P(B, BY);
  cwfo(dblue, 3, cyan, 100);
  showLoop(B, Y, C);
  PNT Z = P(C, CZ);
  cwfo(dgreen, 3, lime, 100);      
  showLoop(C, Z, A);
  cwfo(black, 5, yellow, 100);
  showLoop(A, B, C);
  
  // Part 2: Draw lines through ABC to find Fermat point
  cw(red, 5);
  show(X, C);  // Line from X to opposite vertex (C) overlaps ABC's Fermat point
  c(blue);
  show(Y, A);
  c(green);
  show(Z, B);  // Intersection of all 3 lines is the Fermat point
  
  X.circledLabel("X"); Y.circledLabel("Y"); Z.circledLabel("Z");
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); //D.writeLabel("D");
  }
  
//====================================================================== PART 4
void showPart4(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[4] =   "Log-spiral pattern"; // https://pin.it/7wgYDeq 
  cwF(red,3); show(A,B,C);
  cwF(blue,3);
  drawSpiral(A,B,C,60);
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); //D.writeLabel("D");
  }
void drawSpiral(PNT A, PNT B, PNT C, int recursionCount)
  {
  if(recursionCount==0) return;
  PNT D = extrapolateLogSpiral(A,B,C);

 
  }
PNT extrapolateLogSpiral(PNT A, PNT B, PNT C)
  {
  VCT AB = V(A,B);
  VCT BC = V(B,C);
  
  return P(   );
  }

//====================================================================== PART 5

int recursionCount = 0;
boolean clockwise;

void showPart5(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[5] =   "Triangle Tessellation";
  
  VCT AB = V(A, B);  VCT BC = V(B, C);  VCT CA = V(C, A);
  if (angle(AB, BC) > 0) {
    clockwise = true;
  } else {
    clockwise = false;
  }
  PNT X = P(A, V(.5, AB));  PNT Y = P(B, V(.5, BC));  PNT Z = P(C, V(.5, CA));
  VCT AY = V(A, Y); VCT BZ = V(B, Z); VCT CX = V(C, X);
  PNT center = P((A.x + B.x + C.x)/3, (A.y + B.y + C.y)/3);
  //cw(black, 3);
  //showLoop(A, B, C);
  cwfo(black, 3, yellow, 75);
  showLoop(center, X, A);  showLoop(center, Y, B);  showLoop(center, Z, C);
  cwfo(black, 3, orange, 150);
  showLoop(center, Z, A);  showLoop(center, X, B);  showLoop(center, Y, C);

  float angleA = angle(AB, AY); float angleB = angle(BC, BZ); float angleC = angle(CA, CX);   // Half of the angles of vertex A, B, and C
  
  recursionCount = 0;
  drawPattern(A, X, center, angleA, V(A, C), clockwise);

  recursionCount = 0;
  drawPattern(B, Y, center, angleB, V(B, A), clockwise);

  recursionCount = 0;
  drawPattern(C, Z, center, angleC, V(C, B), clockwise);

  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); center.circledLabel("center"); X.circledLabel("X"); //D.circledLabel("D");
  }
  
  // Recursive method to draw triangles
  // vertex is the vertex of triangle ABC
  // corner is the point on the edge of the previous triangle that will form a vertex of the new triangle
  // previous is the previous recursive call's corner
  // angle is the angle of the recursive triangle's corner adjacent to triangle ABC's vertex
  // endEdge is triangle ABC's edge that the recursive triangles will run into to end recursion
  // clockwise is true if ABC are oriented clockwise around the base triangle
  void drawPattern(PNT vertex, PNT corner, PNT previous, float angle, VCT endEdge, boolean clockwise) {     
    
    // Find the new corner of the larger recursive triangle
    float ratio = n(V(vertex, corner)) / n(V(vertex, previous));
    VCT rotatedVector = R(V(vertex, corner), -angle);
    PNT newCorner = P(vertex, V(ratio, rotatedVector));
    // Find the new corner of the smaller (outer) recursive triangle
    float outerRatio = n(V(corner, newCorner)) / n(V(vertex, newCorner));
    outerRatio *= outerRatio;
    PNT outerCorner = P(newCorner, V(outerRatio, V(vertex, newCorner)));
    
    // if the recursive triangles get too big or too small, the animation will break
    if (n(V(corner, newCorner)) < 0.0001 || n(V(corner, newCorner)) > 5000) {
      return;
    }
    // if the angle used to make recursive triangles is too small, the animation will break
    if (Math.abs(angle) < PI / 48) {
      return;
    }
    // if the ratio of edges used to make recursive triangles is too big or too small, the animation will break
    if (ratio < .25 || ratio > 4) {
      return;
    }
    
    // Get the colors and draw each triangle 
    cwfo(black, 3, getColor(recursionCount), 150);
    showLoop(vertex, corner, newCorner);
    cwfo(black, 3, getColor(recursionCount), 75);
    showLoop(corner, newCorner, outerCorner);
        
    //// Check to see if the recursion has reached the edge of the original triangle by comparing angles
    float currentAngle = Math.abs(angle(V(vertex, newCorner), endEdge));
    if (currentAngle >= Math.abs(angle)) {
      recursionCount++;
      drawPattern(vertex, newCorner, corner, angle, endEdge, clockwise);
    } else if (currentAngle >= 0) {  // If there isn't room for a new recursive triangle, draw a line to closest point on triangle ABC
      float distance = Math.abs(det(U(endEdge), V(vertex, newCorner))); 
      VCT norm;
      if (clockwise) {
        norm = U(R(endEdge, -PI/2));
      } else {
        norm = U(R(endEdge, PI/2));
      }
      PNT endPoint = P(newCorner, V(distance, norm));
      cwfo(black, 3, getColor(recursionCount + 1), 100);
      showLoop(newCorner, endPoint, vertex);
    }
  }

  int getColor(int recursionCount) {
    recursionCount = recursionCount % 10;
    switch(recursionCount) {
      case 0:
        return yellow;
      case 1:
        return orange;
      case 2:
        return red;
      case 3:
        return magenta;
      case 4:
        return dmagenta;
      case 5: 
        return dblue;
      case 6:
        return blue;
      case 7:
        return cyan;
      case 8:
        return green;
      case 9:
        return lime;
    }
    return black;

  }

  
//====================================================================== PART 6
int recursionDepth=9;  
void showPart6(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[6] =   "Recursive tree growth";
  PNT E = P(A,V(B,C));

  if(showIDs)
    {
    E.circledLabel("E");
    A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
    }
  guide="I:display IDs, ,/.:recursion depth";
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }

  
  
//====================================================================== PART 7
void showPart7(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[7] =   "Cubic interpolating motion";
  cwF(cyan,5); show(A,B,C,D);
  cwF(red,3); drawNeville(A,B,C,D);
 
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
void drawNeville(PNT A, PNT B, PNT C, PNT D)
  {
  beginShape();
  
  
  endShape();
  }

  
//====================================================================== PART 8
void showPart8(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[8] =   "Polyline smoothing";
  cwF(black,3); ControlPoints.drawPolyline(); // draws polyline joining control points
  ControlPoints.drawAllVerticesInColor(3,red); // draw dots at vertices
  //if(showIDs) {cwF(blue,1); ControlPoints.writeIDsInEmptyDisks(); }
  if(showIDs) showArrowIDs();
  cwF(red,1); ControlPoints.showPickedPoint(25);
  int n = ControlPoints.pointCount();
  if(keyPressed && key=='f' && n>4)
    {
 
    }
  guide="f:iterate smoothing, I:show/hide IDs";
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
    
//====================================================================== PART 9
void showPart9(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[9] =   "Smoothing while I draw";
  guide="Place. Press RMB to erase&start. Hold LMB & drag. Wait till all ducks arrive. Release.";
  PNT SmoothP = DucksRow.move(Mouse());
  if(mousePressed && (mouseButton == RIGHT))
    {
    DrawnPoints.empty(); 
    SmoothenedPoints.empty(); 
    DucksRow.init(Mouse());
    }
  if(mousePressed && (mouseButton == LEFT))
    {
    DrawnPoints.addPoint(Mouse()); 
    SmoothenedPoints.addPoint(SmoothP); 
    }
  cwF(orange,3); DrawnPoints.drawCurve();
  cwF(blue,5); SmoothenedPoints.drawCurve(); 
  DucksRow.showRow();
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
  
  


    
//======================= called when a key is pressed
void myKeyPressed()
  {
    if (key == 'X') { showX = !showX; }
    if (key == 'Y') { showY = !showY; }
    if (key == 'Z') { showZ = !showZ; }
    
  
    //int k = int(key); if(47<k && k<58) partShown=int(key)-48;
    if(key=='<') {DucksRow.decrementCount(); }
    if(key=='>') {DucksRow.incrementCount(); }
  }
  
//======================= called when the mouse is dragged
void myMouseDragged()
  {
  if (keyPressed) 
    {
    //if (key=='b') b+=2.*float(mouseX-pmouseX)/width;  // adjust knot value b    
    //if (key=='c') c+=2.*float(mouseX-pmouseX)/width;  // adjust knot value c    
    //if (key=='d') d+=2.*float(mouseX-pmouseX)/width;  // adjust knot value a 
    }
  }

//======================= called when the mouse is pressed 
void myMousePressed()
  {
  if (!keyPressed) 
    {
    if(partShown==2 || partShown==3)
      {
      }
    }
  }
  
