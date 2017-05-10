#!/usr/bin/perl
# subroutines5.pl

use warnings;
use strict;

# Arrays can be passed to a subroutine using references.

sub check_same(\@\@); # \@ indicates that this subroutine takes a reference to
                      # an array. Normal arrays will be converted to references.

my @a = (1, 2, 3, 4, 5);
my @b = (1, 2, 3, 4, 7);
my @c = (1, 2, 3, 4, 5);
print "\@a is the same as \@b" if check_same(@a, @b);
print "\@a is the same as \@c" if check_same(@a, @c);

sub check_same (\@\@) {
  my ($ref_one, $ref_two) = @_;
  return 0 unless @$ref_one == @$ref_two; # Check the size first.
  for my $elem (0..$#$ref_one) {
    return 0 unless $ref_one->[$elem] eq $ref_two->[$elem];
  }
  return 1;
}
