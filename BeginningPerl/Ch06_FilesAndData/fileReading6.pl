#!/usr/bin/perl
# fileReading6.pl

use warnings;
use strict;

# If the record separator is blank, records will be divided by blank lines.

$/ = "";
my $counter = 1;

# Files in ARGV will get the first line in each paragraph.

while (<>) {
  print $counter++, ": ";
  print ((split /\n/, $_)[0]); # Divides the paragraph into lines and gets the
                               # first one.
  print "\n";
}
