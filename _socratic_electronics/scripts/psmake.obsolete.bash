#!/bin/bash
### YOU SHOULD NOT HAVE TO ALTER THIS SCRIPT ###

## psmake: Convert sequence file to PostScript, then to Adobe PDF format

function die () {
	echo
	echo ---------------------------------------------
	echo "Failed to run '$1'. Either the input file is invalid"
	echo "or $1 is not installed on your system."
	echo
	exit 1
}

# Run sequence file to get all.tex, reorganize that into output.tex,
# convert it to DVI, and then to PostScript.
./$1.seq
../scripts/texwrap$2.bash $1
if ! tex output.tex ; then die TeX ; fi
mv -vf output.dvi $1$2.dvi
if ! dvips -Ppdf -o ../output/$1$2.ps $1$2.dvi ; then die dvips ; fi

# Remove temporary files
rm -vf all.*
rm -vf output.*

