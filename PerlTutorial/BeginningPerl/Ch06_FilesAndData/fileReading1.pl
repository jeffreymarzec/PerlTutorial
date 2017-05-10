#!/usr/bin/perl
# fileReading1.pl

use warnings;
use strict;

# A file can be opened with open FILE. The die keyword exits the program.
# The $! displays an error message.

open FILE, "lyrics.txt" or die $!;

# Read the file and add line numbers.

my $lineNo = 1;
while (<FILE>) {
  print $lineNo++, ": $_";
}
