#!/usr/bin/perl
# input.pl

use warnings;
use strict;

print "Enter how many yen to a dollar: ";
my $yen = <STDIN>; # Take user input.
print "49518 yen is ", (49_518/$yen), " dollars.\n";
print "360 yen is ",   (   360/$yen), " dollars.\n";
print "30510 yen is ", (30_510/$yen), " dollars.\n";

# Chomp can be used to remove new line characters from input.

print "Enter a word: ";
my $word = <STDIN>;
print "The word ", $word, " has a new line character.\n";
chomp($word);
print "CHOMP!\n";
print "The word ", $word, " doesn't have a new line character anymore.";
