#!/bin/bash
### YOU SHOULD NOT HAVE TO ALTER THIS SCRIPT ###

## mkindex: Create a text index of question files
## according to commonly searched terms.
##
## WARNING: This script is very much in its "alpha"
## stage of development!  Any complaints about it
## will be directed to /dev/null . . .

TEMP1=junk.txt

TEMP2=junk2.txt

OUTPUT=doc/q_index.txt

# Use "grep" to search for index terms, commented
# inside question files in the following format:
#
# %INDEX% (word or phrase here)
#
grep "%INDEX%" src/*.tex > $TEMP1


# Strip away all unnecessary characters
sed -f scripts/q_index.sed $TEMP1 > $TEMP2

# Sort this file in alphabetical order of
# the searched terms.
#
# Sort options used:
# -f = Ignore case
# +1 = Sort according to second field (+1 field past the first)
sort -f +1 $TEMP2 > $OUTPUT

rm $TEMP1 $TEMP2


