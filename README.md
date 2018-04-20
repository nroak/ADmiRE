# ADmiRE- Annotative Database of miRNA Elements
Preprint: https://www.biorxiv.org/content/early/2017/08/16/177170

## Types of Input files

Two primary ways of adding ADmiRE Annotations to existing list of variants and one way of calling miRNA region variants from BAM files:

1. **Tab-separated Files (\*.tsv, \*.mafplus, etc.):** Using Perl script in /ADmiRE/annotate_tsv_using_perl/

2. **VCF Files:** Using Ensembl Variant Effect Predictor (VEP) tool. Requires prior VEP installation, suitable for users with existing VEP workflows.

## Step-by-step Usage Guide
Clone the ADmiRE repository

`git clone https://github.com/nroak/ADmiRE.git`

Alternatively, you can download the ADmiRE directory in a ZIP file format. Make sure to save this file as **"ADmiRE"** and NOT **"ADmiRE-master"**.

`unzip ADmiRE.zip`

### To annotate a Tab separated file:
For Details, refer to ADmiRE/annotate_tsv_using_perl/README.md

`cd ./ADmiRE/annotate_tsv_using_perl/`

`gzip -d ADmiRE.tab.gz`

`perl annoated_admire.pl --input INPUT_FILE --output OUTPUT_FILE`

### To annotate a VCF file:
For Details, refer to ADmiRE/annotate_VCF_using_VEP/README.md

`cd ./ADmiRE/annotate_VCF_using_VEP`

`variant_effect_predictor.pl -i $input.vcf -o $input.admire.vcf --custom /path-to-file/ADmiRE.bed.gz,ADmiRE,bed,exact`
