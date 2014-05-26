/^%(BEGIN_NOTES)/,/^%(END_NOTES)/!d
s/%(BEGIN_NOTES)/\\notes{} /g
s/%(END_NOTES)/\\vskip 10pt \\filbreak /g
