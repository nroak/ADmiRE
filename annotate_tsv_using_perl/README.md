# ADmiRE- Annotative Database of miRNA Elements: Annotating Tab-separated variants (eg. *.tsv, *.mafplus, etc.)

To annotate a tab separated variant file, you can use the attached Perl script that uses ADmiRE.tab to add miRNA annotation columns to the end of each line. For variants that do not lie within miRNA regions, 'NA' values are added.

## Step-by-step Guide:
(1) Download the github repository nroak/ADmiRE/annotate_tsv_using_perl/

(2) cd /annotate_tsv_using_perl

(4) gzip -d ADmiRE.tab.gz

(6) perl annotate_admire.pl [--input INPUT_FILE] [--output OUTPUT_FILE] [--admire_path=PATH] [--chr=NUMBER] [--pos=NUMBER]



### Detailed desription of the input options:
perl annotate_admire.pl [--input INPUT_FILE] [--output OUTPUT_FILE] [--admire_path=PATH] [--chr=NUMBER] [--pos=NUMBER]

--input: INPUT_FILE

--output: OUTPUT_FILE (Default: INPUT_FILE.ADmiRE.tab)

--admire_path: Path to ADmiRE.tab database. (Default: same directory with annotate_admire.pl)

--chr: Column number in the INPUT_FILE with chromosome information. (Default: 1 -1st column)

--pos: Column number in the INPUT_FILE with base position information. (Default: 2 -2nd column)

### To test your command is working:
Test files are provided for this Perl script. Please run,

perl annotate_admire.pl --input test.tab --output test.admire.tab
