#!/usr/bin/perl
# subroutines7.pl

use warnings;
use strict;
sub nextFibonacci(\@);

# Calculates the Fibonacci sequence.

my @fibonacci = (1, 1);

for (1..10) {
  nextFibonacci(@fibonacci);
}

print "@fibonacci\n";

sub nextFibonacci(\@) {
  my $fibonacciRef = shift;
  my $length = $#$fibonacciRef;
  push @$fibonacciRef, $fibonacciRef->[$length - 1] + $fibonacciRef->[$length];
}
