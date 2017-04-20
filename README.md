# ADmiRE- Annnotative Database of miRNA Elements

ADmiRE annotations can be accessed in THREE different ways:
1. For VCF files: A simple custom annotation flag in Variant Effect Predictor (VEP) that uses ADmiRE in a BED file format.  
  Download the ADmiRE.bed.gz and ADmiRE.bed.gz.tbi  
  variant_effect_predictor.pl -i $input.vcf -o $input.admire.vcf --custom /path-to-file/ADmiRE.bed.gz,ADmiRE,bed,exact    
  For more information:http://www.ensembl.org/info/docs/tools/vep/script/vep_custom.html
  
2. For Tab delimited files: Custom script to add ADmiRE columns to the end of each row.  
  Download the ADmiRE.tab file from https://github.com/nroak/ADmiRE/  and run the attached perl script,  
  perl annotate_admire.pl -i $input.tab -o $input.admire.tab -admire_path /path-to-admire/
  
3. For Calling miRNA Variants from the sequence alignment(BAM) files:   
  Suggested script for running the pipeline is in directory: ADmiRE- from BAM files
  
  
