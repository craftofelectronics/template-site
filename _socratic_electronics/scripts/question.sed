/^%(BEGIN_QUESTION)/,/^%(END_QUESTION)/!d
s/%(BEGIN_QUESTION)/\\question{} /g
s/%(END_QUESTION)/\\vskip 10pt \\filbreak /g
