#!/bin/bash
### YOU SHOULD NOT HAVE TO ALTER THIS SCRIPT ###

## texwrap_exam: Create a structurally correct TeX file called
## output.tex consisting only of Questions, no Answers or Notes.
## This output.tex file will also contain no file name references.

OUTPUT=output.tex

# Start output with the fixed preamble file
cp preamble_exam.tex $OUTPUT


# Add the introductory page to the output file
cat $1.tex >> $OUTPUT


# Extract and organize questions from "all.tex" 
echo "\vskip 20pt" >> $OUTPUT
sed -f ../scripts/exam_q.sed all.tex >> $OUTPUT


# Extract and organize answers from "all.tex" 
echo "\vfil \eject" >> $OUTPUT
echo "\centerline{\bf Answers}" >> $OUTPUT
echo "\vskip 20pt" >> $OUTPUT
sed -f ../scripts/answer.sed all.tex >> $OUTPUT


# Add final \bye statement to output file
echo "\bye" >> $OUTPUT



