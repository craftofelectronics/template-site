
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
  return (ePiX::sin(x)/2); 
}

double g(double x) 
{ 
  return (ePiX::sin(6*x)/2); 
}

// Sum of harmonics
double y(double x) 
{ 
  return f(x) + g(x); 
}


main() {
  
  // This defines domain and range of graph
  // Syntax: boundingbox(P(x_min,y_min),P(x_max,y_max));
  bounding_box(P(0,-1),P(6.3,1));
 
  unitlength("1pt");

  // Defines dimensions of picture
  // Syntax: picture(P(h_size,v_size)); 
  picture(P(100,100));

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
  cropplot(f,x_min,x_max,h_size);
  
  cropplot(g,x_min,x_max,h_size);
 
  blue();

  // cropplot(y,x_min,x_max,h_size);

  black();
  label(P(3.14,1.2),"$\\hbox{1st + 6th}$");
  
  // End drawing image
  end();
}


