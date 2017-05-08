
##For Tab delimited files:

To annotate a tab separated variant file, you can use the attached perl script that uses ADmiRE.tab to add miRNA annotation columns to the end of each line. For variants that do not lie within miRNA regions, 'NA' values are added.

Download the ADmiRE.tab file from https://figshare.com/s/7b3bea2aa33470396f50 and run the attached perl script,

###To test your command is working:

Test files are provided for this perl script. Please run,

perl annotate_admire.pl --input test.tab --output test.admire.tab

###To run the sample files using the scipt:

perl annotate_admire.pl [--input FILE] [--output FILE] [--admire_path=PATH] [--chr=NUMBER] [--pos=NUMBER]

--input: Input file path and name

--output: Output file path and name (defaulth is input_file_name.ADmiRE.tab

--admire_path: Path to ADmiRE.tab database. Default is the same directory with annotate_admire.pl

--chr: Column number in the input tab separated file where chormosome information is present. Default is 1.

--pos: Column number in the input tab separated file where base position information is present. Default is 2.
