#!/usr/bin/perl
# references.pl

use warnings;
use strict;

# References tell the location of data. This can be scalars, arrays, or hashes.
# References are created by putting \ before a variable.

my $scalar = 7;
my $scalar_r = \$scalar;

my @array = (1, 2, 3, 4, 5);
my $array_r = \@array;

my %hash = (apple => "pomme", pear => "poire");
my $hash_r = \%hash;

# References work like scalars, so they can be put into arrays or hashes.

my $a = 3;
my $b = 4;
my $c = 5;
my @refs = (\$a, \$b, \$c);
# my @refs = \($a, $b, $c); # This is a cleaner version of the previous line.

my @english = qw(January Feburary March April May June);
my @french = qw(Janvier Fevrier Mars Avril Mai Juin);
my %months = (english => \@english, french => \@french);

my @array1 = (10, 20, 30, 40);
my @array2 = (1, 2, \@array1, 3, 4);
my @array3 = (2, 4, \@array2, 6, 8);
my @array4 = (100, 200, \@array3, 300, 400);

# The variable declaration can be skipped by using anonymous references.

my $array_a = [1, 2, 3, 4, 5]; # Use [] for arrays.
my $hash_a = {apple => "pomme", pear => "poire"}; # Use {} for hashes.
my %months_a = (
  english => ["January", "February", "March", "April", "May", "June"],
  french => ["Janvier", "Fevrier", "Mars", "Avril", "Mai", "Juin"]
);
my @array_a = (100, 200, [2, 4, [1, 2, [10, 20, 30, 40, 50], 3, 4], 6, 8],
              300, 400);

# Arrays can be dereferenced by putting the reference in curly braces.
# These curly braces are not necessary, but they can help clarity.

print "This is our dereferenced array: @{$array_r}\n";
for (@{$array_r}) {
  print "An element: $_\n";
}
print "The highest element is number $#{$array_r}\n";
print "This is what our reference looks like: $array_r\n";

my %hashMonths = (
  1 => "January",    2 => "February",  3 => "March",     4 => "April",
  5 => "May",        6 => "June",      7 => "July",      8 => "August",
  9 => "September", 10 => "October",  11 => "November", 12 => "December"
);

my $href = \%hashMonths;
for (keys %{$href}) {
  print "Key: ", $_, "\t";
  print "Hash: ", $hashMonths{$_}, "\t";
  print "Ref: ", ${$href}{$_}, "\n";
}

# Another way to write this is with arrows.

my @nums = (70, 101, 114, 111, 117);
my $ref = \@nums;
$ref->[0] = 100;
print "Array is now: @nums\n";

$ref = [1, 2, [10, 20]];
my $element = $ref->[2]->[1];
print $element, "\n";

# The arrow is optional between brackets.

$element = $ref->[2][1];
print $element, "\n";
