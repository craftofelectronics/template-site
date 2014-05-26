/^%(BEGIN_ANSWER)/,/^%(END_ANSWER)/!d
s/%(BEGIN_ANSWER)/\\answer{} /g
s/%(END_ANSWER)/\\vskip 10pt \\filbreak /g
