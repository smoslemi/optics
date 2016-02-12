#!/usr/bin/perl -w
#
# Copyright 2016
#
# Author: Sanam Moslemi-Tabrizi
#
# Purpose: To parse data generated from spice
#
# Run:  
#    
# Example:
#				
# Output:
#
# Notes:
#
# Copyright 2016 Sanam Moslemi-Tabrizi.

use strict;
use warnings;
use File::Copy;
use File::Compare;
use Getopt::Std;
use XML::Simple;
#use Cwd;
use POSIX;

#print `pwd`;




#my $spice_file1 = 'waveguide_smt_ex.log' ;

my $spice_file1 = shift ;
my $outFile = "plotData.csv";
#my $spice_file1 ;

my ($file1_handle, $out_handle) ;
my $phaseShift = 0 ;
my $lineCnt = 0 ;
my $dataSetCnt = 0 ;
my $totalDataSetNum = 0 ;

my @l_elements ;
my @dataFiles;
my ($length, $lam, $neff) ;
my (%hashLength, %hashLambda, %hashNeff, %hashDataSet) ;
my %hashPhaseShift;


# get the file names
print (`ls \*.2d_dat`) ;
@dataFiles = `ls \*.2d_dat` ;
#print ("\nS6 $dataFiles[1] \n") ;


#read each file

# extract structure params
foreach my $f (<@dataFiles>) {# each file
	print ("\nS1 Extract params from name of File <<$f>>  \n"); 
	if ($f =~ m/\w+_L(.*)_LAM(.*)_NEFF(.*)_end/i){ # struc param
		($length, $lam, $neff) = ($1,$2,$3);
		print("S2 $length $lam $neff \n");
		$hashLength{$dataSetCnt} = $length;
		$hashLambda{$dataSetCnt} = $lam;
		$hashNeff{$dataSetCnt} = $neff;
		$hashDataSet{$dataSetCnt} = $f;
	} # struc param
	open $file1_handle, "$f" or die ("\nERROR: Could not open file $f.\n");
	    print ("\n===>S2 File <<$f>> under read \n"); 
		foreach my $l(<$file1_handle>){ # each l at file1_handle
			if ($lineCnt == 1){ #line count
				@l_elements = split('\s+', $l);
				print("\n    ****S3 $length $lam $neff $l_elements[4]\n");
				$hashPhaseShift{$dataSetCnt} = $l_elements[4];
			} #line count
			$lineCnt = $lineCnt + 1 ;
		}  # each l at file1_handle
		$lineCnt = 0;
		$dataSetCnt = $dataSetCnt + 1 ;
	close($file1_handle);	
}# each file

open  $out_handle, ">$outFile" or die ("ERROR can not open file $outFile\n");
	print $out_handle "dataSetName,dataSetNumber,Lenght,Lambda,Neff,phaseShift\n";
	my @hashDataSetKeys = (keys %hashDataSet); 
	$totalDataSetNum = @hashDataSetKeys;
	print("\nS9 Total Data set number = $totalDataSetNum or $dataSetCnt \n");
	my $tempI = 0;
	while ($tempI <$dataSetCnt){
		print $out_handle "$tempI,$hashDataSet{$tempI},$hashLength{$tempI},$hashLambda{$tempI},$hashNeff{$tempI},$hashPhaseShift{$tempI}\n";
		$tempI = $tempI + 1 ;
	}

close($out_handle);

printHash(\%hashDataSet);


#=begin
sub printHash {
   my $hashRef = shift ;
   while ( my ($key, $value) =  each(%{$hashRef}) ) {
         print "$key => $value\n";
   }
}
#=end


__END__
    open $file1_handle, "$spice_file1" or die ("\nERROR: Could not open file $spice_file1.\n");
    foreach my $l(<$file1_handle>){ # each l at file1_handle
        if ($lineCnt == 1){ 
            @l_elements = split('\s+', $l);
            print("S3 $length $lam $neff $l_elements[4]\n");
        }
        $lineCnt = $lineCnt + 1 ;
        #print "S1 >$l" ;
        #@param_keys = keys %hash_param ;
        #@timing_keys = keys %hash_timing ;
        #@spec_timing_keys = keys %hash_spec_timing ;
        #print "====>S1 @param_keys" ;
        
        
        #if ($l =~ m/(\d+.\d*e[+-]+\w*)\s+(\d+.\d*e[+-]+\w*\s+)/i){
        ##if ($l =~ m/(\d+.\d*e)\w*\s*/i){ 
	    ##if ($l =~ m/(\d+.\d*e)\w*/i){
	    #print ("\nFound the line\n");
	    #print "S2 $1 >> $2\n";
	    #}
    }

