# Motion test

- j, k, l, h => down, up, right, left
- w, b, W, B => forward word, back word, forward \S+, back \S+
- 0, $ => To start of line, to end of line 
- #G, G => Goto line #, Goto last line

# With Operators

Synopsis: `OPERATOR COUNT MOTION`

Example - Delete next 3 chunks of non-whitespace: `d3W`
Example - Delete entire buffer contents: `1G<Enter>dG`
