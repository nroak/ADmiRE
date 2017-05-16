# ADmiRE- Annotative Database of miRNA Elements

## Types of Input files

Two primary ways of adding ADmiRE Annotations to exisiting list of variants and one way of calling miRNA region variants from BAM files:

1. **Tab-separated Files (*.tsv, *.mafplus, etc.):** Using Perl script in /ADmiRE/annotate_tsv_using_perl/

2. **VCF Files:** Using Ensemlbl Variant Effect Predictor (VEP) tool. Requires prior VEP installation, suitable for users with exisiting VEP workflows.

3. **BAM Files:** [COMING SOON]

## Step-by-step Usage Guide
Clone the ADmiRE repository

`git clone https://github.com/nroak/ADmiRE.git`

### To annotate a Tab separated file,
`cd ./ADmiRE/annotate_tsv_using_perl/`

`gzip -d ADmiRE.tab.gz`

`perl annoated_admire.pl --input INPUT_FILE --output OUTPUT_FILE`

### To annotate a VCF file,
`cd ./ADmiRE/annotate_VCF_using_VEP`

`variant_effect_predictor.pl -i $input.vcf -o $input.admire.vcf --custom /path-to-file/ADmiRE.bed.gz,ADmiRE,bed,exact`
