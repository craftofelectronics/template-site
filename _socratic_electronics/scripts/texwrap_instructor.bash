#!/bin/bash
### YOU SHOULD NOT HAVE TO ALTER THIS SCRIPT ###

## texwrap_instructor: Create a structurally correct TeX file 
## called output.tex organized such that Answers and Notes 
## immediately follow all Questions.  This is so the instructor
## may have all text available on one page when directing the 
## student discussion session.

OUTPUT=output.tex

# Start output file with the fixed preamble file
cp preamble.tex $OUTPUT


# Add the introductory header to the output file
# uncommenting %INSTRUCTOR lines
sed -f ../scripts/instructor.sed $1.tex >> $OUTPUT


# Insert page breaks between questions 
echo "\vfil \eject" >> $OUTPUT
sed -f ../scripts/sequential.sed all.tex >> $OUTPUT


# Add final \bye statement to output file
echo "\bye" >> $OUTPUT

