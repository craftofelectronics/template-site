/* -*-ePiX-*- */
#include "epix.h"
using namespace ePiX;

// the function to be plotted
double f(double x) 
{ 
  return ePiX::sin(x); 
}

// the function to be plotted
double g(double x) 
{ 
  return 2 * ePiX::sin(x); 
}


main() {
  
  // This defines domain and range of graph
  // Syntax: boundingbox(P(x_min,y_min),P(x_max,y_max));
  bounding_box(P(0,-3),P(12.57,3));
 
  unitlength("1pt");

  // Defines dimensions of picture
  // Syntax: picture(P(h_size,v_size)); 
  picture(P(200,200));

  // Defines amount of offset from center of page
  // Syntax: offset(P(h_offset,v_offset)); 
  offset(P(0,0));

  // Begin drawing image
  begin();

  grid(12,12); // fine grid

  bold();
  grid(4,4); // coarse grid

  // Syntax: h_axis_labels((x_start,y_start),(x_end,y_end),Number_of_labels,(x_offset,y_offset),centering);
  //h_axis_masklabels(P(x_min, y_min), P(x_max, y_min), 4, P(0,-10), c);
  v_axis_masklabels(P(x_min, y_min), P(x_min, y_max), 4, P(-20,0), c);

  // color of plot
  blue();

  // 2-D plot of function f, cropped to 
  // domain and range specified in boundingbox()
  // function.  The math function itself (f) is
  // defined as a real C++ function outside of main()
  // Syntax: cropplot(function_name, domain_start, domain_end, number_of_points);
  cropplot(f,x_min,x_max,h_size);

  // color of plot
  red();

  cropplot(g,x_min,x_max,h_size);
  
  // End drawing image
  end();
}



