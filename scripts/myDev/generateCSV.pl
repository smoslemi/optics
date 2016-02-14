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
my $outLPhase = "plotDataLPashe.csv";
my $outLamPhase = "plotDataLamPhase.csv";
my $outNeffPhase = "plotDataNeffPhase.csv";
#my $spice_file1 ;

my ($file1_handle, $out_handle) ;
my $phaseShift = 0 ;
my $lineCnt = 0 ;
my $dataSetCnt = 0 ;
my $totalDataSetNum = 0 ;

my (@l_elements, @out_elements) ;
my @dataFiles;
my ($length, $lam, $neff) ;
my (%hashLength, %hashLambda, %hashNeff, %hashDataSet) ;
my %hashPhaseShift;

my (@lengthArrayTemp, @lamArrayTemp, @neffArrayTemp);
my (@lengthArray, @lamArray, @neffArray);

# get the file names
#print (`ls \*.2d_dat`) ;
my @dataFilesTotal = `ls \*.2d_dat` ;
#`mkdir "outDir"`;
#print ("\nS6 $dataFiles[1] \n") ;


#read each file
foreach my $fTotal (<@dataFilesTotal>){
	if ($fTotal =~ m/^wave/i){
		push(@dataFiles,$fTotal);
	}
}


# extract structure params
foreach my $f (<@dataFiles>) {# each file
	#print ("\nS1 Extract params from name of File <<$f>>  \n"); 
	if ($f =~ m/\w+_L(.*)_LAM(.*)_NEFF(.*)_end/i){ # struc param
		($length, $lam, $neff) = ($1,$2,$3);
		#print("S2 $length $lam $neff \n");
		$hashLength{$dataSetCnt} = $length;
		$hashLambda{$dataSetCnt} = $lam;
		$hashNeff{$dataSetCnt} = $neff;
		$hashDataSet{$dataSetCnt} = $f;
	} # struc param
	open $file1_handle, "$f" or die ("\nERROR: Could not open file $f.\n");
	    #print ("\n===>S2 File <<$f>> under read \n"); 
		foreach my $l(<$file1_handle>){ # each l at file1_handle
			if ($lineCnt == 1){ #line count
				@l_elements = split('\s+', $l);
				#print("\n    ****S3 $length $lam $neff $l_elements[4]\n");
				$hashPhaseShift{$dataSetCnt} = $l_elements[4];
			} #line count
			$lineCnt = $lineCnt + 1 ;
		}  # each l at file1_handle
		$lineCnt = 0;
		$dataSetCnt = $dataSetCnt + 1 ;
	close($file1_handle);	
}# each file

open  $out_handle, ">outDir/$outFile" or die ("ERROR can not open file $outFile\n");
	print $out_handle "dataSetName,dataSetNumber,Lenght,Lambda,Neff,phaseShift\n";
	my @hashDataSetKeys = (keys %hashDataSet); 
	
	
	$totalDataSetNum = @hashDataSetKeys;
	#print("\nS9 Total Data set number = $totalDataSetNum or $dataSetCnt \n");
	my $tempI = 0;
	while ($tempI <$dataSetCnt){
		print $out_handle "$tempI,$hashDataSet{$tempI},$hashLength{$tempI},$hashLambda{$tempI},$hashNeff{$tempI},$hashPhaseShift{$tempI}\n";
		$tempI = $tempI + 1 ;
	}

close($out_handle);

#printHash(\%hashDataSet);


@lengthArrayTemp = (values %hashLength) ;
@lamArrayTemp = (values %hashLambda);
@neffArrayTemp = (values %hashNeff);


## Get distinct params of the whole dataset
@lengthArray =&getDistinctParams(@lengthArrayTemp);
@lamArray =&getDistinctParams(@lamArrayTemp);
@neffArray =&getDistinctParams(@neffArrayTemp);

#print "\n@lengthArrayTemp\n";
print "\n@lengthArray\n";

print "\n@lamArray\n";
print "\n@neffArray\n";

#=begin
my $outIndi;
my $outIndiHandle;
open  $out_handle, "outDir/$outFile" or die ("ERROR can not open file $outFile\n");
	foreach my $i (<@lengthArray>){ #i
		foreach my $j (<@lamArray>){#j
			open  $out_handle, "outDir/$outFile" or die ("ERROR can not open file $outFile\n");
			$outIndi = join('_','out', "L$i", "LAM$j", 'NEFF', 'Phase') ;
			$outIndi = join('.',"$outIndi",'log' ) ;
			open  $outIndiHandle, ">outDir/$outIndi" or die ("ERROR can not open file $outIndi\n");
			print $outIndiHandle "hello1\n";
			#print "\n>>>>$outIndi<<<<\n";
			print ("\n $i ,,,  $j\n");
			foreach my $l(<$out_handle>){ # each l at $out_handle
				@out_elements = split(',', $l);
				#print ("\n $l $out_elements[2] => $i ,,, $out_elements[3] => $j\n");
				if (($out_elements[2] eq $i) && ($out_elements[3] eq $j)){ # l and lam
				    print "><><><><> $out_elements[0] $out_elements[2] $out_elements[3] $out_elements[4] $out_elements[5]\n";
					print $outIndiHandle "$out_elements[0] $out_elements[4] $out_elements[5]\n";
					print $outIndiHandle "hello2\n";
				} # l and lam
			}# each l at $out_handle
         
		}#j
	} #i
print $outIndiHandle "hello3\n";	
close($outIndiHandle);	
close($out_handle);	
#=end


##### SUB ROUTINES #####

sub getDistinctParams{
    my @fullArray = @_ ;
    #print "\n <inside the sub routine> @fullArray\n";
	my @distinctArray;
	foreach my $X (@fullArray){
		#print("\n10 Total Data set number = $totalDataSetNum or $dataSetCnt \n");
		if (!grep{/^$X$/}@distinctArray) {
			push(@distinctArray,$X);
		}
	}
	return(@distinctArray);
}

sub printHash {
   my $hashRef = shift ;
   while ( my ($key, $value) =  each(%{$hashRef}) ) {
         print "$key => $value\n";
   }
}

# sub generateEachPlotData(@var1, @var2, @var3, $nameVar1, $nameVar2, $nameVar3){
# 	my ($i,$j,$k) ;
# 	my $outFile ;
# 	foreach my $i (<@var1>){ #i
# 		foreach my $j (<@var1>){#j
# 			$outFile = join('_','out', "$nameVar1$i", "$nameVar2$j", "$nameVar3" ) ;
# 			foreach my $k (<@var1>){#k
# 			print "\n>>>>$outFile<<<<\n";
# 			}#k
# 		}#j
# 	} #i
# }

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

