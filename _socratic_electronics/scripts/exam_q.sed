/^%(BEGIN_ANSWER)/,/^%(END_ANSWER)/d
/^%(BEGIN_NOTES)/,/^%(END_NOTES)/d
s/%(END_QUESTION)/\\vskip 10pt \\filbreak /g

# Delete all five-character filename reference lines.
s/\\underbar{file [0-9a-zA-Z][0-9a-zA-Z][0-9a-zA-Z][0-9a-zA-Z][0-9a-zA-Z]}/\\vskip 50pt/g



