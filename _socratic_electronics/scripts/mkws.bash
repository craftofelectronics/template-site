#!/bin/bash

DATE=`date +%Y%m%d`
pushd output


echo "Creating PDF tarball..."
tar czf ../worksheets_pdf_$DATE.tar.gz *.pdf

# Making a "dateless" copy of the tarball
cp -v ../worksheets_pdf_$DATE.tar.gz ../work_pdf.tar.gz


#echo "Creating PostScript tarball..."
#tar czf ../worksheets_ps_$DATE.tar.gz *.ps

# Making a "dateless" copy of the tarball
#cp -v ../worksheets_ps_$DATE.tar.gz ../work_ps.tar.gz


popd


## March 1, 2005 -- Tony Kuphaldt
## Commented out commands to create PostScript archives,
## in my effort to slim the project down and retain only
## PDF format output files.

