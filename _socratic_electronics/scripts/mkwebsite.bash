#!/bin/bash

echo "Creating 'website' tarball..."
DIRNAME=website_`date +%Y%m%d`

mkdir -p $DIRNAME/scripts
mkdir -p $DIRNAME/src
mkdir -p $DIRNAME/output
mkdir -p $DIRNAME/doc
mkdir -p $DIRNAME/doc/CC_files
mkdir -p $DIRNAME/doc/cc_deed_files

cp scripts/* $DIRNAME/scripts
cp src/* $DIRNAME/src
cp output/* $DIRNAME/output
cp doc/* $DIRNAME/doc
cp doc/CC_files/* $DIRNAME/doc/CC_files
cp doc/cc_deed_files/* $DIRNAME/doc/cc_deed_files
cp buildws $DIRNAME
cp index.html $DIRNAME
cp Makefile $DIRNAME
cp coreMakefile $DIRNAME

# Creating gzipped tarball
tar czf $DIRNAME.tar.gz $DIRNAME

# Making a "dateless" copy of the tarball
cp -v $DIRNAME.tar.gz website.tar.gz

# Deleting tarball directory
rm -rf $DIRNAME

