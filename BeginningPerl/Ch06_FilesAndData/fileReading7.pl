#!/usr/bin/perl
# fileReading7.pl

use warnings;
use strict;

# The record separator can be set to undef to read the entire file.

$/ = undef;
my $file = <>;
print $file, "\n";
