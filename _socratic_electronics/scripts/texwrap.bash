#!/bin/bash
### YOU SHOULD NOT HAVE TO ALTER THIS SCRIPT ###

## texwrap: Create a structurally correct TeX file called output.tex
## organized into "Question", "Answer", and "Notes" chapters.

OUTPUT=output.tex

# Start output with the fixed preamble file
cp preamble.tex $OUTPUT


# Add the introductory page to the output file
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


# Extract and organize notes from "all.tex" 
echo "\vfil \eject" >> $OUTPUT
echo "\centerline{\bf Notes}" >> $OUTPUT
echo "\vskip 5pt" >> $OUTPUT
sed -f ../scripts/notes.sed all.tex >> $OUTPUT


# Add final \bye statement to $OUTPUT.tex
echo "\bye" >> $OUTPUT

