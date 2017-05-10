#!/usr/bin/perl
# fileWriting2.pl

use warnings;
use strict;

# The lines of a file can be sorted by ASCII or number.

my $numeric = 0;
my $input = shift;
if ($input eq "-n") { # Check for a numeric flag.
  $numeric = 1;
  $input = shift;
}
my $output = shift;

# If the input isn't defined, use * (or the glob) to make INPUT an alias for
# STDIN.

if (defined $input) {
  open INPUT, $input or die "Couldn't open file $input: $!\n";
}
else {
  *INPUT = *STDIN;
}

# If the output isn't defined, use the glob to make OUTPUT an alias for STDOUT.

if (defined $output) {
  open OUTPUT, ">$output" or die "Couldn't open file $input: $!\n";
}
else {
  *OUTPUT = *STDOUT;
}

my @file = <INPUT>;
if ($numeric) {
  @file = sort { $a <=> $b } @file;
}
else {
  @file = sort @file;
}

print OUTPUT @file;
