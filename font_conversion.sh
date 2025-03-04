#!/bin/bash
scriptname=./`basename $0`
# Function to display script usage/help information
function display_usage() {
  # hint: you will have multiple echo statements here
  echo "Usage: $scriptname -n <filename> -o <output> -f <fontname> -s <fontsize>"
  echo "Options:"
  echo "  -n <filename>: Specify the input filename."
  echo "  -o <output>: Specify the output directory where the results will be stored."
  echo "  -f <fontname>: Specify the Font to be converted to."
  echo "  -s <fontsize>: Specify the font size to be scaled to."
  echo "  -h: Display this help information."
  echo "  -l: Display the list of acceptable fonts."
}
if [[ $# -eq 0 || "$1" == "-h" ]]; then
    display_usage
    exit 0
fi
if [[ "$1" == "-l" ]]; then
    echo " The Acceptable Fonts are: C059-BdIta, C059-Bold, C059-Italic, C059-Roman, D050000L, NimbusMonoPS-Bold, NimbusMonoPS-BoldItalic, NimbusMonoPS-Italic, NimbusMonoPS-Regular, NimbusRoman-Bold, NimbusRoman-BoldItalic, NimbusRoman-Italic, NimbusRoman-Regular, NimbusSans-Bold, NimbusSans-BoldItalic, NimbusSans-Italic, NimbusSansNarrow-Bold, NimbusSansNarrow-BoldOblique, NimbusSansNarrow-Oblique, NimbusSansNarrow-Regular, NimbusSans-Regular, P052-Bold, P052-BoldItalic, P052-Italic, P052-Roman, StandardSymbolsPS, URWBookman-Demi, URWBookman-DemiItalic, URWBookman-Light, URWBookman-LightItalic, URWGothic-Book, URWGothic-BookOblique, URWGothic-Demi, URWGothic-DemiOblique, Z003-MediumItalic"
    exit 0
fi
# Initialize variables
filename=""
output=""
fontname=""
fontsize=""

# Process command-line options and arguments
while getopts ":n:o:f:s:l:h" opt; do
    case $opt in
        n) # option f
            filename=$OPTARG
        ;;
        o) # option o
            output=$OPTARG
        ;;
        f) # option t
            fontname=$OPTARG
        ;;
        s) # option s
            fontsize=$OPTARG
        ;;
        l) # option l
            # display fonts and exit
            echo " The Acceptable Fonts are: C059-BdIta, C059-Bold, C059-Italic, C059-Roman, D050000L, NimbusMonoPS-Bold, NimbusMonoPS-BoldItalic, NimbusMonoPS-Italic, NimbusMonoPS-Regular, NimbusRoman-Bold, NimbusRoman-BoldItalic, NimbusRoman-Italic, NimbusRoman-Regular, NimbusSans-Bold, NimbusSans-BoldItalic, NimbusSans-Italic, NimbusSansNarrow-Bold, NimbusSansNarrow-BoldOblique, NimbusSansNarrow-Oblique, NimbusSansNarrow-Regular, NimbusSans-Regular, P052-Bold, P052-BoldItalic, P052-Italic, P052-Roman, StandardSymbolsPS, URWBookman-Demi, URWBookman-DemiItalic, URWBookman-Light, URWBookman-LightItalic, URWGothic-Book, URWGothic-BookOblique, URWGothic-Demi, URWGothic-DemiOblique, Z003-MediumItalic"
            exit 0
        ;;
        h) # option h
            # display usage and exit
            display_usage
            exit 0
        ;;
        \?) # any other option
            echo "Invalid option: -$OPTARG"
            # display usage and exit
            display_usage
            exit 1
        ;;
        :) # no argument
            echo "Option -$OPTARG requires an argument."
            # display usage and exit
            display_usage
            exit 1
        ;;
    esac
done

# Check if all required switches are provided
    if [[ -z "$filename" || -z "$output" || -z "$fontname" || -z "$fontsize" ]]; then
        echo "Error: Missing required options."
        # display usage and exit
        display_usage
        exit 1
    fi

# Check if the specified input filename exists and is a regular file
    if [[ ! -f "$filename" ]]; then
        echo "Error: Input file '$filename' does not exist or is not a regular file."
        # exit
        exit 1
    fi

# Check if input file is a PDF file
    if [[ ! "$filename" =~ \.pdf$ ]]; then
        echo "Error: Input file '$filename' is not a PDF file."
        # exit
        exit 1
    fi

# Check if the specified output directory exists and is a directory
    if [[ ! -d "$output" ]]; then
        echo "Error: Output directory '$output' does not exist."
        # exit
        exit 1
    fi

# Check if the specified fontsize is an integer
    if [[ ! "$fontsize" =~ ^[0-9]+$ ]]; then
        echo "Error: Font size must be a number."
        # exit
        exit 1
    fi

    pdftotext "$filename" temp.txt

    pandoc --pdf-engine=xelatex --variable=mainfont=$fontname temp.txt -o $output/output.pdf

    rm temp.txt

    exit 0