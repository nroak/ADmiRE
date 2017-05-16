=head1 LICENSE
Copyright [2017] [Ninad Oak]										
													
Licensed under the Apache License, Version 2.0 (the "License");						
you may not use this file except in compliance with the License.					
You may obtain a copy of the License at									
													
    http://www.apache.org/licenses/LICENSE-2.0								
													
Unless required by applicable law or agreed to in writing, software					
distributed under the License is distributed on an "AS IS" BASIS,					
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.				
See the License for the specific language governing permissions and					
limitations under the License.										

=cut

=head2 USAGE

## Step-by-step Guide:
(1) Download the github repository nroak/ADmiRE/annotate_tsv_using_perl/

(2) cd /annotate_tsv_using_perl

(3) gzip -d ADmiRE.tab.gz

(4) perl annotate_admire.pl [--input INPUT_FILE] [--output OUTPUT_FILE] [--admire_path=PATH] [--chr=NUMBER] [--pos=NUMBER]

# Detailed desription of the input options:

--input: INPUT_FILE

--output: OUTPUT_FILE (Default: INPUT_FILE.ADmiRE.tab)

--admire_path: Path to ADmiRE.tab database. (Default: same directory with annotate_admire.pl)

--chr: Column number in the INPUT_FILE with chromosome information. (Default: 1 -1st column)

--pos: Column number in the INPUT_FILE with base position information. (Default: 2 -2nd column)

=cut

=head1 HEADERS
ADmiRE Headers												
   1  Chromosome											
   2  Start												
   3  Stop												
   4  MIRNA												
   5  PRE_ID												
   6  MIRNA_Feature											
   7  Family_Name											
   8  Family_ID												
   9  Mature_Pos											
  10  Mature_Name											
  11  Mature_ID												
  12  Mature_Type											
  13  High_Confidence											
  14  gnomAD_Constrained_MIRNA										
  15  Conserved_ADmiRE											
  16  HMDD_Disease (PMID)										
  17  "HMDD_Targets (Disease, PMID)"									
  18  miRTarBase_#Validated Targets									
  19  miRTarBase_TargetGene(Validation type)								
  20  miRTarBase_Reference(PMID)									

=cut

#!/usr/bin/perl
use warnings;
use strict;
use Getopt::Long qw(GetOptions);
use Pod::Usage;
use File::Basename;
my $dirname = dirname(__FILE__);

$"="\t";
my $input;
my $output;
my $admire_path= $dirname."/";
my $chr = "1";
my $pos = "2";
my $help;

GetOptions ("input|i=s" => \$input,    # string
            "output|o:s"   => \$output,      # string
            "admire_path|p:s"  => \$admire_path, # string
            "chr|c:i" => \$chr,    # numeric
            "pos|c:i" => \$pos,    # numeric
            'help|h' => \$help)  # flag
or die("Usage: perl annotate_admire.pl [--input FILE] [--output FILE] [--admire_path=PATH] [--chr=NUMBER] [--pos=NUMBER]\n");

if (defined $input) {
    } else {
    	print "Option input requires an argument
	Usage: perl annotate_admire.pl [--input FILE] [--output FILE] [--admire_path=PATH] [--chr=NUMBER] [--pos=NUMBER]\n";
	exit 1
}
if (defined $output) {
	} else {
    	$output=$input.".admire.tab";
}

##### READ ADMIRE INTO HASH	
my $input_db= $admire_path."ADmiRE.tab";
my %mirbase;
open FD, "<$input_db" or die "No Database";
foreach my $line_db (<FD>){
	$line_db =~ s/[\r\n]//g;
	my @entry_db = split (/\t/,$line_db);
	my $hash_key1=$entry_db[0]."_".$entry_db[1];
	my $hash_key2=$entry_db[3];
	my @hash_value= @entry_db[0..$#entry_db];	
	if ($entry_db[0] ne "MIRNA" ){push (@{$mirbase{$hash_key1}{$hash_key2}}, @hash_value);}
	}
close FD;

## READ VARIANT FILE AND ANNOTATE 
open FP, "<$input" or die "No Variant File";
open FO, ">$output" or die "No Output File";

my @empty;
push @empty, "NA" foreach(1..17);
$chr -= 1;
$pos -= 1;
ALLMUT: while (my $line_maf = <FP>){
	$line_maf =~ s/\r+\n$//g;
	#print $line_maf."\n";
	my @entry_maf = split ("\t",$line_maf);
	chomp @entry_maf;
	if ($line_maf =~ /^\#/ || $line_maf =~ /^CHROM/ || $line_maf =~ /^Hugo_Symbol/) { print FO "@entry_maf\tMIRNA\tPRE_ID\tMIRNA_Feature\tFamily_Name\tFamily_ID\tMature_Pos\tMature_Name\tMature_ID\tMature_Type\tHigh_Confidence\tgnomAD_Constrained_MIRNA\tConserved_100vert_ADmiRE\tHMDD_Disease (PMID)\tHMDD_Targets (Disease, PMID)\tmiRTarBase_#Validated Targets\tmiRTarBase_TargetGene(Validation type)\tmiRTarBase_Reference(PMID)\n";}
	elsif ($line_maf !~ /^\#/ && $line_maf !~ /^CHROM/ && $line_maf !~ /^Hugo_Symbol/) {
		my $db_key=$entry_maf[$chr]."_".$entry_maf[$pos];
		if ( keys %{$mirbase{$db_key}}){}
		else {print FO "@entry_maf\t@empty\n";next ALLMUT;}
		foreach my $db_key2 ( keys %{$mirbase{$db_key}}) {
			print FO "@entry_maf\t@{$mirbase{$db_key}{$db_key2}}[3..19]\n";
		   	}
		next ALLMUT;
		}
	}
