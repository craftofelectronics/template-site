/^%(BEGIN_FRONTMATTER)/,/^%(END_FRONTMATTER)/!d
s/%(BEGIN_FRONTMATTER)/ /g
s/\\underbar{file/\\vfil \\underbar{file/g
s/%(END_FRONTMATTER)/\\eject /g
