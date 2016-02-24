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



my $spice_file1 = shift ;
my $outFolder ;
my $outFile = "plotData.csv";
my $outLPhase = "plotDataLPashe.csv";
my $outLamPhase = "plotDataLamPhase.csv";
my $outNeffPhase = "plotDataNeffPhase.csv";
my $date_snap ;

my ($file1_handle, $out_handle) ;
my $outIndi;
my $outIndiHandle;
my $phaseShift = 0 ;
my $lineCnt = 0 ;
my $PhaseFlag = 0 ;
my $dataSetCnt = 0 ;
my $totalDataSetNum = 0 ;
my $fixedPhase ;

my (@l_elements, @out_elements) ;
my @dataFiles;
my @hashDataSetKeys ;
my ($length, $lam, $neff) ;
my (%hashLength, %hashLambda, %hashNeff, %hashDataSet) ;
my %hashPhaseShift;

my (@lengthArrayTemp, @lamArrayTemp, @neffArrayTemp);
my (@lengthArray, @lamArray, @neffArray);
my (@lengthArraySorted, @lamArraySorted, @neffArraySorted);

## get the file names

#print (`ls \*.log`) ;
my @dataFilesTotal = `ls \*.log` ;

chomp($date_snap = `date +%d%b%Y_%H%M_%S`);
print "\n$date_snap\n";
$outFolder=join('_','outDir', "$date_snap");
print "\n$outFolder\n";

`mkdir $outFolder`;


# refine list of data files
foreach my $fTotal (<@dataFilesTotal>){
	if ($fTotal =~ m/^wave/i){
		push(@dataFiles,$fTotal);
	}
}
#print ("\nS6 $dataFiles[0] \n") ;

#__END__

# extract structure params from data file names
# Built plot data file names
# Built hash tables for data
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

# Get values from simulation data	
	open $file1_handle, "$f" or die ("\nERROR: Could not open file $f.\n");
	#print ("\n===>S2 File <<$f>> under read \n"); 
		foreach my $l(<$file1_handle>){ # each l at file1_handle
		
# This is parsing section for 2d-dat fromat for Spice .trans data		

# 			if ($lineCnt == 1){ #line count 
# 				@l_elements = split('\s+', $l);
# 				#print("\n    ****S3 $length $lam $neff $l_elements[4]\n");
# 				$hashPhaseShift{$dataSetCnt} = $l_elements[4];
# 			} #line count
			
# This is parsing section for log fromat for Spice .op data 
			if ($PhaseFlag == 0){ #Find Phase
				if ($l =~ m/Layer\s+\(1\)\s+Phi=( -*\d+\.*\d*)/i){
					$PhaseFlag = 1;
					#print("\n    ****S3 $1\n");
					$hashPhaseShift{$dataSetCnt} = $1;
				}
			} #Find Phase
			
			$lineCnt = $lineCnt + 1 ;
		}  # each l at file1_handle
		$lineCnt = 0;
		$PhaseFlag = 0;
		$dataSetCnt = $dataSetCnt + 1 ;
	close($file1_handle);	
}# each file


# # Write full data in plotData file
open  $out_handle, ">$outFolder/$outFile" or die ("ERROR can not open file $outFile\n");
	print $out_handle "dataSetName,dataSetNumber,Lenght,Lambda,Neff,phaseShift\n";
	@hashDataSetKeys = (keys %hashDataSet); 
	
	
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



@lengthArraySorted = sort {$a <=> $b} @lengthArray;
@lamArraySorted = sort {$a <=> $b} @lamArray;
@neffArraySorted = sort {$a <=> $b} @neffArray;

print "\nSet of lengths used for simulation.:\n@lengthArraySorted\n";
print "\nSet of lambdas used for simulation.:\n@lamArraySorted\n";
print "\nSet of neffs used for simulation.:\n@neffArraySorted\n";

close($out_handle);

# START Generate the individual files 

## START Files for Phase shift vs Neff for sets of fixed length and lambda

foreach my $i (<@lengthArraySorted>){ #i
	foreach my $k (<@lamArraySorted>){#k
		open  $out_handle, "$outFolder/$outFile" or die ("ERROR can not open file $outFile\n");
		$outIndi = join('_','out', "L$i", "LAM$k", 'NEFF', 'Phase') ;
		$outIndi = join('.',"$outIndi",'log' ) ;
		open  $outIndiHandle, ">$outFolder/$outIndi" or die ("ERROR can not open file $outIndi\n");
		foreach my $j (<@neffArraySorted>){ #j
			open  $out_handle, "$outFolder/$outFile" or die ("ERROR can not open file $outFile\n");
			foreach my $l(<$out_handle>){ # each l at $out_handle
				chomp($l);
				@out_elements = split(',', $l);
				if (($out_elements[2] eq $i) && ($out_elements[3] eq $k) && ($out_elements[4] eq $j)){ # l and lam
					#print ("\n $l \n");
					$fixedPhase = &fixPhase($out_elements[5]);
					print $outIndiHandle "$out_elements[0] $out_elements[4] $out_elements[5] $fixedPhase\n";
				} # l and lam
			}# each l at $out_handle
		} #j
	}#k
} #i
close($outIndiHandle);	
close($out_handle);

## END Files for Phase shift vs Neff for sets of fixed length and lambda

## START Files for Phase shift vs Lambda for sets of fixed length and neff

foreach my $i (<@lengthArraySorted>){ #i
	foreach my $k (<@neffArraySorted>){#k
		open  $out_handle, "$outFolder/$outFile" or die ("ERROR can not open file $outFile\n");
		$outIndi = join('_','out', "L$i", "NEFF$k", 'LAM', 'Phase') ;
		$outIndi = join('.',"$outIndi",'log' ) ;
		open  $outIndiHandle, ">$outFolder/$outIndi" or die ("ERROR can not open file $outIndi\n");
		foreach my $j (<@lamArraySorted>){ #j
			#print "\nDataset $outIndi $i $j $k\n";
			open  $out_handle, "$outFolder/$outFile" or die ("ERROR can not open file $outFile\n");
			foreach my $l(<$out_handle>){ # each l at $out_handle
				chomp($l);
				@out_elements = split(',', $l);
				if (($out_elements[2] eq $i) && ($out_elements[3] eq $j) && ($out_elements[4] eq $k)){ # l and neff
					#print ("\n $l \n");
					$fixedPhase = &fixPhase($out_elements[5]);
					print $outIndiHandle "$out_elements[0] $out_elements[3] $out_elements[5] $fixedPhase\n";
				} # l and neff
			}# each l at $out_handle
		} #j
	}#k
} #i
close($outIndiHandle);	
close($out_handle);

## END Files for Phase shift vs Lambda for sets of fixed length and neff


foreach my $i (<@lamArraySorted>){ #i
	foreach my $k (<@neffArraySorted>){#k
		open  $out_handle, "$outFolder/$outFile" or die ("ERROR can not open file $outFile\n");
		$outIndi = join('_','out', "LAM$i", "NEFF$k", 'LENGTH', 'Phase') ;
		$outIndi = join('.',"$outIndi",'log' ) ;
		open  $outIndiHandle, ">$outFolder/$outIndi" or die ("ERROR can not open file $outIndi\n");
		foreach my $j (<@lengthArraySorted>){ #j
			open  $out_handle, "$outFolder/$outFile" or die ("ERROR can not open file $outFile\n");
			foreach my $l(<$out_handle>){ # each l at $out_handle
				chomp($l);
				@out_elements = split(',', $l);
				if (($out_elements[2] eq $j) && ($out_elements[3] eq $i) && ($out_elements[4] eq $k)){ # lam and neff
					print ("\n $l \n");
					$fixedPhase = &fixPhase($out_elements[5]);
					print $outIndiHandle "$out_elements[0] $out_elements[2] $out_elements[5] $fixedPhase\n";
				} # lam and neff
			}# each l at $out_handle
		} #j
	}#k
} #i

## END Files for Phase shift vs Lambda for sets of fixed length and neff
# END Generate the individual files

##### SUB ROUTINES #####

sub fixPhase{
    my $x = shift ;
	while ($x < 0.0) {
		$x = 6.28 + $x;
	}
	while ($out_elements[5]> 6.28){
		$x = $x - 6.28;
	}
	return($x);
}

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




