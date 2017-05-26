# ADmiRE- Annotative Database of miRNA Elements

ADmiRE annotations can be added to a tab separated variant file using a stand-alone Perl script. Only for the anntoation of a VCF file, prior installation of VEP annotation tool is required.

## For VCF files: 
Annotation of a VCF file requires use of one of the exisiting annotation tools, Ensembl's variant effect predictor (VEP). By using the custom annotation flag in Variant Effect Predictor (VEP) pass the ADmiRE datbase file in the BED format.  

#### Download the ADmiRE.bed.gz and ADmiRE.bed.gz.tbi

`variant_effect_predictor.pl -i $input.vcf -o $input.admire.vcf --custom /path-to-file/ADmiRE.bed.gz,ADmiRE,bed,exact`

#### At the end of the INFO field, ADmiRE annotations are added as:

`ADmiRE=pre_miRNA_name|pre_miRNA_ID|miRNA_Domain|miRNA_Family_Name|miRNA_Family_ID|Mature_Position|mature_miRNA_Name|mature_miRNA_ID|High_Confidence_miRNA|gnomAD_Constrained_miRNA|Conserved_100vert_miRNA|PhyloP_100way_Score|PhastCons_100way_Score|HMDD_Disease|HMDD_Targets|miRTarBase_TargetCount|miRTarBase_TargetGene|miRTarBase_Reference`

#### For more information on VEP custom flag:http://www.ensembl.org/info/docs/tools/vep/script/vep_custom.html
