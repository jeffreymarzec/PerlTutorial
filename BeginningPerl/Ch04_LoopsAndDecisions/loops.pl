#!usr/bin/perl
# loops.pl

use warnings;
use strict;

# The opposite of a while loop is an until loop.

my $countdown = 5;

until ($countdown-- == 0) {
  print "Counting down: $countdown\n";
}

# The keyword last leaves a loop.

my @flowers = qw(Daffodil Rose Tulip);

for (@flowers) {
  print "$_\n";
  last if $_ eq "Rose";
}

# The keyword next skips the current iteration.

for (@flowers) {
  next if $_ eq "Rose";
  print "$_\n";
}

# Loops can be labeled to specify which one is being referenced.

$countdown = 5;
OUTER: while (1) {
  INNER: until ($countdown-- == 0) {
    print "Counting down: $countdown\n";
    last OUTER if $countdown == 2;
  }
}

# The keyword redo returns to the start of the current loop.

$countdown = 2;
my $flag = 1;
until ($countdown-- == 0) {
  print "Counting down: $countdown\n";
  if ($flag) {
    $flag = 0;
    redo;
  }
}
