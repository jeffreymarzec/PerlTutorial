#!/usr/bin/perl
# benchmark.pl

use warnings;
use strict;

# The benchmark library can test how long code takes to run a number of times.

use Benchmark;

my $howMany = 500_000;
my $what    = q/my $j=1; for (1..100) {$j*=$_}/;

timethis($howMany, $what);
