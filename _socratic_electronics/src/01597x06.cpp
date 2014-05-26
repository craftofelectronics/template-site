
/* -*-ePiX-*- */

/* "Compile" this C++ file by running the ePiX utility, "elaps" like this:

    elaps filename.cpp

The result will be an Encapsulated PostScript file of the same name (with different extension, of course):

    filename.eps

*/


#include "epix.h"
using namespace ePiX;

// the function to be plotted
double f(double x) 
{ 
  return ePiX::sin(x); 
}

double g(double x) 
{ 
  return (ePiX::sin(3*x))/3; 
}

double h(double x) 
{ 
  return (ePiX::sin(5*x))/5; 
}

double i(double x) 
{ 
  return (ePiX::sin(7*x))/7; 
}

double j(double x) 
{ 
  return (ePiX::sin(9*x))/9; 
}

double k(double x) 
{ 
  return (ePiX::sin(11*x))/11; 
}

double m(double x) 
{ 
  return (ePiX::sin(13*x))/13; 
}

double n(double x) 
{ 
  return (ePiX::sin(15*x))/15; 
}

double p(double x) 
{ 
  return (ePiX::sin(17*x))/17; 
}

double q(double x) 
{ 
  return (ePiX::sin(19*x))/19; 
}

double q2(double x) 
{ 
  return (ePiX::sin(21*x))/21; 
}

double q3(double x) 
{ 
  return (ePiX::sin(23*x))/23; 
}

double q4(double x) 
{ 
  return (ePiX::sin(25*x))/25; 
}

double q5(double x) 
{ 
  return (ePiX::sin(27*x))/27; 
}

double q6(double x) 
{ 
  return (ePiX::sin(29*x))/29; 
}

double q7(double x) 
{ 
  return (ePiX::sin(31*x))/31; 
}

double q8(double x) 
{ 
  return (ePiX::sin(33*x))/33; 
}

double q9(double x) 
{ 
  return (ePiX::sin(35*x))/35; 
}

// Sum of harmonics
double y(double x) 
{ 
  return f(x) + g(x) + h(x) + i(x) + j(x) + k(x) + m(x) + n(x) + p(x) + q(x) + q2(x) + q3(x) + q4(x) + q5(x) + q6(x) + q7(x) + q8(x) + q9(x); 
}


main() {
  
  // This defines domain and range of graph
  // Syntax: boundingbox(P(x_min,y_min),P(x_max,y_max));
  bounding_box(P(0,-1),P(6.3,1));
 
  unitlength("1pt");

  // Defines dimensions of picture
  // Syntax: picture(P(h_size,v_size)); 
  picture(P(200,200));

  // Defines amount of offset from center of page
  // Syntax: offset(P(h_offset,v_offset)); 
  offset(P(0,0));

  // Begin drawing image
  begin();

//  grid(32,32); // fine grid

  bold();
  grid(4,4); // coarse grid

  // Syntax: h_axis_labels((x_start,y_start),(x_end,y_end),Number_of_labels,(x_offset,y_offset),centering);
 // h_axis_masklabels(P(x_min, y_min), P(x_max, y_min), 4, P(0,-10), c);
 // v_axis_masklabels(P(x_min, y_min), P(x_min, y_max), 4, P(-10,0), c);

  // color of plot
  red();

  // 2-D plot of function f, cropped to 
  // domain and range specified in boundingbox()
  // function.  The math function itself (f) is
  // defined as a real C++ function outside of main()
 
  blue();

  cropplot(y,x_min,x_max,400);

  black();
  label(P(3.14,1.1),"$\\hbox{All odd-numbered harmonics up to the 35th}$");
  
  // End drawing image
  end();
}


