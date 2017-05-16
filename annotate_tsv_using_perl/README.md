# ADmiRE- Annotative Database of miRNA Elements: Annotating Tab-separated variants (eg. *.tsv, *.mafplus, etc.)

To annotate a tab separated variant file, you can use the attached Perl script that uses ADmiRE.tab to add miRNA annotation columns to the end of each line. For variants that do not lie within miRNA regions, 'NA' values are added. If a variant lies within more than one miRNAs, annotations for each miRNA are added on a separate line. Thus the resulting output may contain more lines than the input file.

## Step-by-step Guide:
1. Go to the directory /ADmiRE/annotate_tsv_using_perl/

`cd ./ADmiRE/annotate_tsv_using_perl/`

2. Unzip the ADmiRE.tab.gz file (Unzipped file size ~213 Mb)

`gzip -d ADmiRE.tab.gz`

(4) Run the script to annotate the input file in a tab separated format. Note that the script assumes header line to start with **#** or **CHROM** or **Hugo_Symbol**. If neither of these are header of the first column, the output file will not contain a header line.

`perl annotate_admire.pl [--input INPUT_FILE] [--output OUTPUT_FILE] [--admire_path=PATH] [--chr=NUMBER] [--pos=NUMBER]`

### Detailed desription of the input options:
`perl annotate_admire.pl [--input INPUT_FILE] [--output OUTPUT_FILE] [--admire_path=PATH] [--chr=NUMBER] [--pos=NUMBER]`

--input: INPUT_FILE [REQUIRED]

--output: OUTPUT_FILE (Default: INPUT_FILE.ADmiRE.tab) [OPTIONAL]

--admire_path: Path to ADmiRE.tab database. (Default: same directory with annotate_admire.pl) [OPTIONAL]

--chr: Column number in the INPUT_FILE with chromosome information. (Default: 1 -1st column) [OPTIONAL]

--pos: Column number in the INPUT_FILE with base position information. (Default: 2 -2nd column) [OPTIONAL]

### To test your command is working:
Test files are provided for this Perl script. Please run,

`perl annotate_admire.pl --input test_input.tab --output test_input.admire.tab`
