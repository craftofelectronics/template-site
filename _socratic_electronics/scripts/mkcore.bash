#!/bin/bash

echo "Creating 'core' tarball..."
DIRNAME=core_`date +%Y%m%d`
mkdir -p $DIRNAME/scripts
mkdir -p $DIRNAME/src
mkdir -p $DIRNAME/output

cp src/00000.tex src/preamble.tex src/core.seq src/core.tex src/*.sed \
	src/GNUmakefile $DIRNAME/src
cp output/Makefile $DIRNAME/output
cp coreMakefile $DIRNAME/Makefile
cp scripts/*.bash $DIRNAME/scripts
cp buildws $DIRNAME

tar czf $DIRNAME.tar.gz $DIRNAME
rm -rf $DIRNAME
cp -v $DIRNAME.tar.gz core.tar.gz

