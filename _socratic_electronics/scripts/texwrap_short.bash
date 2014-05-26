#!/bin/bash
### YOU SHOULD NOT HAVE TO ALTER THIS SCRIPT ###

## texwrap_short: Create a structurally correct TeX file called
## output.tex organized into "Question" and "Answer" chapters.

OUTPUT=output.tex

# Start output file with the fixed preamble file
cp preamble.tex $OUTPUT


# Add the introductory header to the output file
cat $1.tex >> $OUTPUT


# Extract and organize frontmatter from "all.tex" 
echo "\vfil \eject" >> $OUTPUT
sed -f ../scripts/frontmatter.sed all.tex >> $OUTPUT


# Extract and organize questions from "all.tex" 
echo "\vfil \eject" >> $OUTPUT
echo "\centerline{\bf Questions}" >> $OUTPUT
echo "\vskip 5pt" >> $OUTPUT
sed -f ../scripts/question.sed all.tex >> $OUTPUT


# Extract and organize answers from "all.tex" 
echo "\vfil \eject" >> $OUTPUT
echo "\centerline{\bf Answers}" >> $OUTPUT
echo "\vskip 5pt" >> $OUTPUT
sed -f ../scripts/answer.sed all.tex >> $OUTPUT


# Add final \bye statement to output file
echo "\bye" >> $OUTPUT

