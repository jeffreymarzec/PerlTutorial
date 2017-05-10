#!/usr/bin/perl
# benchmark2.pl

use warnings;
use strict;

# Use the benchmark module to test several file reading methods.

use Benchmark;

my $howMany = 50_000;

timethese($howMany, {
  line => sub {
    my $file;
    open TEST, "gettysburg.txt" or die $!;
    while (<TEST>) { $file .= $_ }
    close TEST;
  },
  slurp => sub {
    my $file;
    local undef $/;
    open TEST, "gettysburg.txt" or die $!;
    $file = <TEST>;
    close TEST;
  },
  join => sub {
    my $file;
    open TEST, "gettysburg.txt" or die $!;
    $file = join "", <TEST>;
    close TEST;
  }
});
