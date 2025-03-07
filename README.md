# bash-project1-yorkco
 
<h2>Ever wanted to convert your PDF document's font to a different one in the most difficult way possible?
NOW YOU CAN!</h2>

This Script works in an Ubuntu WSL
---

<h3>Necessary Downloads:</h3>

1. Ubuntu WSL (Everything else must be installed within the Ubuntu WSL)
2. Xelatex (sudo apt-get install texlive-xetex)
3. poppler-utils (sudo apt-get install poppler-utils)
4. pandoc (sudo apt-get install pandoc)

<h2>Script Operation:</h2>

 ./font_conversion.sh -n \<filename> -o \<output> -f \<fontname> -s \<fontsize>

Options:

  -n \<filename>: Specify the input filename.

  -o \<output>: Specify the output directory where the results will be stored.

  -f \<fontname>: Specify the Font to be converted to.

  -s \<fontsize>: Specify the font size to be set written in pts. EX: 12pt

  -h: Display this help information.

  -l: Display the list of acceptable fonts.

---
<h3>Additonal file</h3>
I included a pdf of my resume as a test pdf 
