
/* -*-ePiX-*- */

/* 

    "Compile" this C++ file by running the ePiX utility, "elaps" like this:

    elaps filename.cpp

The result will be an Encapsulated PostScript file of the same name (with different extension, of course):

    filename.eps

*/


#include "epix.h"
using namespace ePiX;


// Function f(x)
double f(double x) 
{ 
  return 2 * ePiX::sin(10 * x); 
}


// Function g(x)
double g(double x) 
{ 
  return 1 + (0.6 * ePiX::sin(x)); 
}


// Function h(x)
double h(double x) 
{ 
  return f(x + g(x)); 
}



main() 
{
  
  // This defines domain and range of graph
  // Syntax: boundingbox(P(x_min,y_min),P(x_max,y_max));
  bounding_box(P(0,-3),P(12.57,3));

  // Defines the LaTeX unit used for dimensioning 
  unitlength("1pt");

  // Defines dimensions of picture, in units set by unitlength() function
  // Syntax: picture(P(h_size,v_size)); 
  picture(P(200,200));

  // Defines amount of offset from center of page
  // Syntax: offset(P(h_offset,v_offset)); 
  offset(P(0,0));


  // **** Begin drawing image ****
  begin();

  // Draws grid of lines on coordinate plane
  // Syntax: grid(horizontal_blocks,vertical_blocks);
  grid(12,12);   // fine grid

  // Sets "bold" line type
  bold();
  
  // Draws grid of lines on coordinate plane
  // Syntax: grid(horizontal_blocks,vertical_blocks);
  grid(4,4);     // coarse grid

  // X and Y axis labels
  // Syntax: h_axis_labels(P(x_start,y_start), P(x_end,y_end), Number_of_labels, 
  //         P(x_offset,y_offset), centering);
  //h_axis_masklabels(P(x_min, y_min), P(x_max, y_min), 4, P(0,-10), c);
  //v_axis_masklabels(P(x_min, y_min), P(x_min, y_max), 4, P(-20,0), c);

  // Sets color of plot
  blue();

  // 2-D plot of function h, cropped to 
  // domain and range specified in boundingbox()
  // function.  The math function itself (f) is
  // defined as a real C++ function outside of main()
  // Syntax: cropplot(function_name, domain_start, domain_end, number_of_points);
  cropplot(h,x_min,x_max,2*h_size);

  // Sets color of plot
  //red();

  //cropplot(g,x_min,x_max,h_size);
 
  // Sets color of text label(s) 
  black();

  // Text label (uses LaTeX syntax for text formatting)
  // Syntax: label(P(x_pos,y_pos) , "$\\hbox{Text to be printed}$");
  label(P(6,3.4) , "$\\hbox{Modulated signal}$");
  label(P(6,-3.4) , "$\\hbox{Time}$");
  
  // End drawing image
  end();
}



