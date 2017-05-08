# ADmiRE- Annotative Database of miRNA Elements

ADmiRE annotations can be added to a tab separated variant file using a stand-alone Perl script. Only for the anntoation of a VCF file, prior installation of VEP annotation tool is required.

## For VCF files: 
Annotation of a VCF file requires use of one of the exisiting annotation tools, Ensembl's variant effect predictor (VEP). By using the custom annotation flag in Variant Effect Predictor (VEP) pass the ADmiRE datbase file in the BED format.  

Download the ADmiRE.bed.gz and ADmiRE.bed.gz.tbi  

variant_effect_predictor.pl -i $input.vcf -o $input.admire.vcf --custom /path-to-file/ADmiRE.bed.gz,ADmiRE,bed,exact    

For more information:http://www.ensembl.org/info/docs/tools/vep/script/vep_custom.html
