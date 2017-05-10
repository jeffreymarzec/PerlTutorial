#!usr/bin/perl
# fileReading2.pl

use warnings;
use strict;

# Files can be read from command line with ARGV. <> is shorthand for ARGV.

my $lineNo = 1;
while (<>) {
  print $lineNo++, ": $_";
}
