#!/usr/bin/perl
# fileReading4.pl

use warnings;
use strict;

open FILE, "gettysburg.txt" or die $!;

# Print the last five lines of the Gettysburg Address from a text file.

my @speech = <FILE>;
print "Last five lines:\n", @speech[-5 ... -1];

# Alternatively, a while loop could read through the file and keep track of the
# last five lines in an array.

# my @last5;
# while (<FILE>) {
#   push @last5, $_;
#   shift @last5 if @last5 > 5;
# }
# print "Last five lines:\n", @last5;
