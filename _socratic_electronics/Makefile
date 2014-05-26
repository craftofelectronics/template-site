all:
	( cd src ; $(MAKE) )


# Removes all intermediate files in the src/ subdirectory
clean:
	( cd src ; $(MAKE) clean )
	rm -f *.tar.gz


# Removes all PDF files in the output/ subdirectory
realclean: clean
	( cd output ; $(MAKE) clean )


# Generates gzipped tarballs of all PDF files
worksheets: all
	@scripts/mkws.bash


# Generates a gzipped tarball of all source files, including scripts
source:
	@scripts/mksource.bash


# Generates a gzipped tarball of "core" source files necessary
# for beginning a new socratic worksheet project
core:
	@scripts/mkcore.bash


# Generates an incremental backup tarball in the new/ subdirectory
today:
	@scripts/mktoday.bash


# Updates the subject index for any question files containing index references
index:
	@scripts/mkindex.bash


# Updates the subject index for any question files containing index references
#website:
#	@scripts/mkwebsite.bash


# Backs up all files
archive:
	$(MAKE) worksheets
	$(MAKE) index
	$(MAKE) source
	$(MAKE) core
#	$(MAKE) website
#	$(MAKE) today



