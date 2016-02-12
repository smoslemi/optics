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
#my $spice_file1 ;

my $file1_handle ;
my $phase_shift = 0 ;
my $line_cnt = 0 ;

my @l_elements ;
my @dataFiles;
my ($length, $lam, $neff) ;


# get the file names
print (`ls \*.2d_dat`) ;
@dataFiles = `ls \*.2d_dat` ;
#print ("\nS6 $dataFiles[1] \n") ;


#read each file

# extract structure params
foreach my $f (<@dataFiles>) {# each file
     print ("\n S8 <<$f>>\n"); 
     if ($f =~ m/\w+_L(.*)_LAM(.*)_NEFF(.*)_end/i){ # struc param
        ($length, $lam, $neff) = ($1,$2,$3);
        print("S7 $length $lam $neff \n");
     } # struc param
     open $file1_handle, "$f" or die ("\nERROR: Could not open file $f.\n");
     foreach my $l(<$file1_handle>){ # each l at file1_handle
        if ($line_cnt == 1){ #line count
            @l_elements = split('\s+', $l);
            print("S3 $length $lam $neff $l_elements[4]\n");
        } #line count
        $line_cnt = $line_cnt + 1 ;
     }  # each l at file1_handle
	 

}# each file



__END__
    open $file1_handle, "$spice_file1" or die ("\nERROR: Could not open file $spice_file1.\n");
    foreach my $l(<$file1_handle>){ # each l at file1_handle
        if ($line_cnt == 1){ 
            @l_elements = split('\s+', $l);
            print("S3 $length $lam $neff $l_elements[4]\n");
        }
        $line_cnt = $line_cnt + 1 ;
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

