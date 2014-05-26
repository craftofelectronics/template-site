### SED script for generating a plain-text index file for question topics

# This command removes the example index entry found in file 00000.tex
/00000.tex/d

# These commands strip away any unnecessary text from the "grepped" lines
s/%INDEX%//g
s/\.tex//g
s/src\///g
