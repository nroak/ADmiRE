# ADmiRE- Annotative Database of miRNA Elements
Preprint: https://www.biorxiv.org/content/early/2017/08/16/177170

## Types of Input files

1. **Tab-separated Files (\*.tsv, \*.mafplus, etc.):** Using Perl script in the ./ADmiRE/ directory

2. **VCF Files:** 
    - **Using Ensembl Variant Effect Predictor (VEP) tool:**
        
        Follow instructions in ./ADmiRE/annotate_VCF_using_VEP/Readme.md
        
        Requires prior VEP installation, suitable for users with existing VEP workflows.
    - **Using ANNOVAR:**
        
        ADmiRE is available as 'User-contributed-dataset' on ANNOVAR website for integration into existing pipelines.
        
        http://annovar.openbioinformatics.org/en/latest/user-guide/download/#user-contributed-datasets

## Step-by-step Usage Guide
### To annotate a Tab separated file:

1. Clone the ADmiRE repository

    `git clone https://github.com/nroak/ADmiRE.git`
    
    Alternatively, you can download the ADmiRE directory in a ZIP file format. Make sure to save this file as **"ADmiRE"** and NOT **"ADmiRE-master"**.
    `unzip ADmiRE.zip`

2. Unzip the ADmiRE.tab.gz file (Unzipped file size ~232 MB)

    `gzip -d ADmiRE.tab.gz`

3. Run the script to annotate the input file in a tab separated format.
    Note: The script assumes header line to start with **#** or **CHROM** or **Hugo_Symbol**. If one of these first column headers are present, ADmiRE column names are added to the header line at the end of original header. Otherwise, the output file will not contain a header line.
    
    `perl annotate_admire.pl [--input INPUT_FILE] [--output OUTPUT_FILE] [--admire_path PATH] [--chr NUMBER] [--pos NUMBER]`

### Detailed desription of the input options:
`perl annotate_admire.pl [--input INPUT_FILE] [--output OUTPUT_FILE] [--admire_path PATH] [--chr NUMBER] [--pos NUMBER]`

--input: INPUT_FILE [REQUIRED]

--output: OUTPUT_FILE (Default: INPUT_FILE.ADmiRE.tab) [OPTIONAL]

--admire_path: Path to ADmiRE.tab database. (Default: same directory with annotate_admire.pl) [OPTIONAL]

--chr: Column number in the INPUT_FILE with chromosome information. (Default: 1 -1st column) [OPTIONAL]

--pos: Column number in the INPUT_FILE with base position information. (Default: 2 -2nd column) [OPTIONAL]

### To test your command is working:
Test files are provided for this Perl script. Please run,

`perl annotate_admire.pl --input test_input.tab --output test_input.admire.tab`
