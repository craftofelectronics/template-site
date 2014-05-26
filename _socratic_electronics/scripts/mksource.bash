#!/bin/bash

echo "Creating Socratic Electronics source tarball..."
DIRNAME=selec
#DIRNAME=selec_`date +%Y%m%d`

# Creating temporary tarball directory
mkdir -p $DIRNAME/output

# Copying the desired source files into temporary tarball directory
cp -R src scripts doc $DIRNAME
cp *Makefile $DIRNAME
cp output/Makefile $DIRNAME/output
cp buildws $DIRNAME
cp index.html $DIRNAME

# Deleting DVI files from tarball directory
rm -f $DIRNAME/src/*.dvi

# Creating gzipped tarball
tar czf $DIRNAME.tar.gz $DIRNAME

# Making a "dateless" copy of the tarball
# This line is necessary only if DIRNAME
# contains the date.
#cp -v $DIRNAME.tar.gz selec.tar.gz

# Deleting tarball directory
rm -rf $DIRNAME

