
The sources for the MathML specification
the file  run in this directory is a bash shell script
which details the commands required to generate the MathML
specificaton. It does not use any advanced bash features and
could be easily modified to other environments such as the
windows command line.

It requires:

An XML validator
rxp is used in the script
this is not used for production but just to check the input
and generated output is valid.

An SGML Parser
nsgmls is used in the script.
Again this is not used for production, but just to check that all
generated HTML is valid.


The unicode.xml and its dtd, charlist.dtd, available from
http://www.w3.org/Math/characters
These are used as the source for the character tables in chapter 6.
In addition, to generate the diff-marked version of byalpha.html
showing differences from the MathML 2.0 rec, you will need the version
of unicode.xml distributed in the XML source zip file linked from that
recommendation.


An XSLT system.
The free java implementation saxon is used in the script.

pdflatex to generate the PDF versions of the specification.
The documents use the rapport3 LaTeX class file which should be part
of most TeX distributions but is available from TeX archives as part of
the ntgclass distribution. It also uses several commonly available
package files, hyperref, url,ae,pslatex.


