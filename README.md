# ADmiRE- Annotative Database of miRNA Elements

ADmiRE annotations can be accessed in THREE different ways:

## For VCF files: 
Annotation of a VCF file requires use of one of the exisiting annotation tools, Ensembl's variant effect predictor (VEP).
  A simple custom annotation flag in Variant Effect Predictor (VEP) that uses ADmiRE in a BED file format.  
  Download the ADmiRE.bed.gz and ADmiRE.bed.gz.tbi  
  variant_effect_predictor.pl -i $input.vcf -o $input.admire.vcf --custom /path-to-file/ADmiRE.bed.gz,ADmiRE,bed,exact    
  For more information:http://www.ensembl.org/info/docs/tools/vep/script/vep_custom.html
  
## For Tab delimited files: 
To annotate a tab separated variant file, you can use the attached perl script that uses ADmiRE.tab to add miRNA annotation columns to the end of each line. For variants that do not lie within miRNA regions, 'NA' values are added.

### Download the ADmiRE.tab file from https://figshare.com/s/7b3bea2aa33470396f50 and run the attached perl script,  

### Test files are provided for this perl script. To test your command is working, please run, 
perl annotate_admire.pl --input test.tab --output test.admire.tab  

### To run the sample files using the scipt:
perl annotate_admire.pl [--input FILE] [--output FILE] [--admire_path=PATH] [--chr=NUMBER] [--pos=NUMBER]

--input: Input file path and name

--output: Output file path and name (defaulth is input_file_name.ADmiRE.tab

--admire_path: Path to ADmiRE.tab database. Default is the same directory with annotate_admire.pl

--chr: Column number in the input tab separated file where chormosome information is present. Default is 1.

--pos: Column number in the input tab separated file where base position information is present. Default is 2.



## For Calling miRNA Variants from the sequence alignment(BAM) files: [COMING SOON...]
  Suggested script for running the pipeline is in directory: ADmiRE- from BAM files
  
  
