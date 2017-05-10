#!/usr/bin/perl
# subroutines2.pl

use warnings;
use strict;

# Arguments can be passed to subroutines in parentheses.

total(111, 107, 105, 114, 70);
total(1...100);

sub total {
  my $total = 0;
  $total += $_ for @_; # The array @_ refers to the arguments.
  print "The total is $total\n";
}
