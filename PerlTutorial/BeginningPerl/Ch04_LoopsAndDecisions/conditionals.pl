#!/usr/bin/perl
# conditionals.pl

use warnings;
use strict;

# Using defined tests if a variable is defined.

my ($a, $b);
$b = 10;
if (defined $a) {
  print "a has a value.\n";
}
if (defined $b) {
  print "b has a value.\n";
}

# Logical operators.

$a = 5;
if ($a and $b) {
  print "a and b are true.\n";
}
if ($a or $b) {
  print "At least one of a and b is true.\n";
}
if (not $a) {
  print "a is not true.\n";
}
else {
  print "a is true.\n";
}

# Another way to write a not statement is unless.

unless ($a) {
  print "a is not true.\n";
}
else {
  print "a is true.\n";
}

# There is elsif too.

if ($a) {
  print "a is true.\n";
}
elsif ($b) {
  print "b is true.\n";
}
else {
  print "Neither a nor b are true.\n";
}

# The condition can be written after the statement.

print "a is greater than 5.\n"
  if $a > 5;
print "a is greater than 0.\n"
  if $a > 0;
