#!/usr/bin/perl
# fileReading5.pl

use warnings;
use strict;

# The record seperator is \n by default, but can be changed with $/.

$/ = "\n%\n"; # Changes the record seperator to \n%\n.

open QUOTES, "quotes.txt" or die $!;
my @file = <QUOTES>;

my $random = rand(@file); # rand() generates a random number between 0 and the
                          # argument, in this case the number of records.
my $fortune = $file[$random]; # Gets a random record using the number.
# The above two lines could be written as my $fortune = $file[rand @file].
chomp $fortune; # Chomp will remove the record seperator.

print $fortune, "\n";
