## Create worksheets from the files in this directory.

SEQS:=$(wildcard *.seq)
PDFFILES=$(patsubst %.seq,../output/%.pdf,$(SEQS))
IPDFFILES=$(patsubst %.seq,../output/%_instructor.pdf,$(SEQS))

../output/%.pdf: %.seq
	../scripts/pdfmake.bash $*

../output/%_instructor.pdf: %.seq
	../scripts/pdfmake.bash $* _instructor


all: $(PDFFILES) $(IPDFFILES) 

clean:
	rm -f junk* *.bak all.tex output.* *.dvi


## March 1, 2005 -- Tony R. Kuphaldt
## Eliminated the intermediate PostScript build options, 
## instead opting to directly build PDF format files from 
## source.  Of course, PostScript is still used as an
## intermediate format in the compilation process
## (.tex --> .dvi --> .ps --> .pdf), but the old 
## "psmake.bash" script was replaced by a new "pdfmake.bash"
## script that deletes the PostScript file after the PDF
## file is complete.


## June 16, 2004 -- Tony R. Kuphaldt
## I commented out the "short" file generation option.  This was
## where the scripts created worksheets without a "Notes" section.
## It turned out to be needless, because the "Notes" section was
## always the last to be printed, and you could simply eliminate
## that section if desired by choosing not to print the final
## pages of the worksheet, using whatever printing program you
## happened to choose (Ghostview, Adobe Acrobat, etc.).

## If you wish to re-institute the "short" worksheet generation 
## function, just uncomment the lines in this Makefile, and add
## the necessary dependencies $(SPDFFILES) and $(SPSFILES) to 
## the "all" line near the bottom.


