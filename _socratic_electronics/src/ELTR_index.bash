#!/bin/bash


# This special script assembles and compiles a master schedule for all the
# Core Electronics (BTC) courses, ELTR100 through ELTR145.  It is a stand-
# alone script, not using any of the Makefiles or other scripts written
# for the Socratic Electronics project.

cat ELTR_index_prologue.tex > ELTR_index.tex
echo "\vfil \eject" >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR100_sec1.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR100_sec2.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR100_sec3.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR105_sec1.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR105_sec2.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR105_sec3.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR110_sec1.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR110_sec2.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR110_sec3.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR115_sec1.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR115_sec2.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR115_sec3.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR120_sec1.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR120_sec2.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR120_sec3.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR125_sec1.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR125_sec2.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR125_sec3.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR130_sec1.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR130_sec2.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR135_sec1.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR135_sec2.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR140_sec1.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR140_sec2.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR140_sec3.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR145_sec1.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR145_sec2.tex >> ELTR_index.tex

sed -e '1,/^\\vfil \\eject/!d' ELTR145_sec3.tex >> ELTR_index.tex

echo "\bye" >> ELTR_index.tex

tex ELTR_index.tex

dvips -Ppdf -o ELTR_index.ps ELTR_index.dvi

ps2pdf ELTR_index.ps

mv -v ELTR_index.pdf ../output

rm -v ELTR_index.ps



