# ADmiRE- Annotative Database of miRNA Elements

ADmiRE annotations can be added to a tab separated variant file using a stand-alone Perl script. Only for the annotation of a VCF file, prior installation of VEP annotation tool is required.

  
## For Tab delimited files: 
To annotate a tab separated variant file, you can use the attached Perl script that uses ADmiRE.tab to add miRNA annotation columns to the end of each line. For variants that do not lie within miRNA regions, 'NA' values are added.
### To test your command is working:
Test files are provided for this Perl script. Please run,

perl annotate_admire.pl --input test.tab --output test.admire.tab  

### To run the sample files using the script:
perl annotate_admire.pl [--input INPUT_FILE] [--output OUTPUT_FILE] [--admire_path=PATH] [--chr=NUMBER] [--pos=NUMBER]

--input: INPUT_FILE

--output: OUTPUT_FILE (Default: INPUT_FILE.ADmiRE.tab)

--admire_path: Path to ADmiRE.tab database. (Default: same directory with annotate_admire.pl)

--chr: Column number in the INPUT_FILE with chromosome information. (Default: 1 -1st column)

--pos: Column number in the INPUT_FILE with base position information. (Default: 2 -2nd column)

