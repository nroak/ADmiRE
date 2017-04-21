# ADmiRE- Annnotative Database of miRNA Elements

ADmiRE annotations can be accessed in THREE different ways:
1. For VCF files: A simple custom annotation flag in Variant Effect Predictor (VEP) that uses ADmiRE in a BED file format.  
  Download the ADmiRE.bed.gz and ADmiRE.bed.gz.tbi  
  variant_effect_predictor.pl -i $input.vcf -o $input.admire.vcf --custom /path-to-file/ADmiRE.bed.gz,ADmiRE,bed,exact    
  For more information:http://www.ensembl.org/info/docs/tools/vep/script/vep_custom.html
  
2. For Tab delimited files: Custom script to add ADmiRE columns to the end of each row.  
  Download the ADmiRE.tab file from https://figshare.com/s/7b3bea2aa33470396f50 and run the attached perl script,  
  perl annotate_admire.pl [--input FILE] [--output FILE] [--admire_path=PATH] [--chr=NUMBER] [--pos=NUMBER]
  
3. For Calling miRNA Variants from the sequence alignment(BAM) files: [COMING SOON...]
  Suggested script for running the pipeline is in directory: ADmiRE- from BAM files
  
  
