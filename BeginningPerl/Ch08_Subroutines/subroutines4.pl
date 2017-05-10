#!/usr/bin/perl
# subroutines4.pl

use warnings;
use strict;

# A subroutine prototype defines what arguments a subroutine takes.

sub sum_of_two_squares ($$); # This subroutine takes two scalars.

my ($first, $second) = @ARGV;
print "The sum of the squares of $first and $second is ";
print sum_of_two_squares($first, $second), "\n";

# This line would not work because it has too many arguments.
# print sum_of_two_squares($first, $second, 0), "\n";

sub sum_of_two_squares ($$) {
  my ($a, $b) = (shift, shift);
  return $a**2 + $b**2;
}

# Using a semicolon in a prototype means that everything after that point may
# or may not used.

# sub sum_of_two_or_three_squares ($$;$);

# Using @_ means any number of parameters.

# sub sum_of_squares (@_);
