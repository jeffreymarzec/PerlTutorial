#!/usr/bin/perl
# fileReading13.pl

use warnings;
use strict;

# Read multiple files from command line and restart line numbering for each one.

my $lineNo;
my $current = "";

while(<>) {
  if ($current ne $ARGV) {
    $current = $ARGV;
    print "\n\t\tFile: $ARGV\n\n";
    $lineNo = 1;
  }

  print $lineNo++, ": $_";
}
