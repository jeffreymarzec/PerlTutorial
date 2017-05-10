#!/usr/bin/perl
# lists.pl

use warnings;
use strict;

# Lists are declared inside parentheses.

print (123, 456, 789, "\n");

# Lists can have a mix of data types.

my $test = 30;
print ("String ", 12345, " ", $test, "\n");

# Access a specific item in a list.

print(('salt', 'vinegar', 'mustard', 'pepper')[2]);
print "\n";

# Using qw() converts a words into a list.

my $month = 3;
print qw(
  January  February  March
  April    May       June
  July     August    September
  October  November  December
)[$month];
print "\n";

# Multiple elements of a list can be selected at once.

my $mone; my $mtwo;
($mone, $mtwo) = (1, 3);
print (("heads ", "shoulders ", "knees ", "toes ")[$mone, $mtwo]);
print "\n";

# Swapping two variables.

print ($mone, " ", $mtwo, "\n");
($mone, $mtwo) = ($mtwo, $mone);
print ($mone, " ", $mtwo, "\n");

# Ranges can be used to create lists.

print "Counting up: ", (1 .. 6), "\n";
print "Counting down: ", (6 .. 1), "\n"; # This doesn't work, the left side must
                                         # be smaller.
print "Counting down correctly: ", reverse(1 .. 6), "\n";
print "Half the alphabet: ", ('a' .. 'm'), "\n";
print "The other half backwards: ", reverse('n' .. 'z'), "\n";
print "Going from 3 to z: ", (3 .. 'z'), "\n"; # This doesn't work, z gets
                                               # converted to 0.
print "going from z to 3: ", ('z' .. 3), "\n";

# Ranges can select elements from lists.

print (qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)[2..8]);
print "\n";
print (qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)[-2..1]);
print "\n";
print (qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)[0,3,7..11]);
print "\n";

# Arrays are assigned with the @ symbol.

my @days = qw(Monday Tuesday Wednesday Thursday Friday Saturday Sunday);
print @days, "\n";

# An array assigned to a scalar returns the length of the array.

my $numOfDays = @days;
print $numOfDays, "\n";

# An array in double quotes is interpolated into a string.

print "@days\n";

# Array operations.

my @array = (10, 20, 30);
print scalar @array, "\n"; # Converting the array to a scalar gets the length.
my $element = $array[0]; # Get an element from the list and store it.
@array[0,1] = @array[1,0]; # Swaps two elements of an array.
print "@array\n";
@array[0,1] = @array[1,0];

for $element (@array) {
  print $element, "\n";
} # For loops can be used to print each element in the array.

for (0..$#array) {
  print $array[$_], "\n"; # The $_ gets the current value.
} # Using a range with $#array that gets the index of the highest element.

$element = pop @array; # Pop removes the last element of the list.
print "@array\n";
push @array, $element; # Push adds an element or list of elements to the end of
                       # the list.
print "@array\n";
$element = shift @array; # Shift removes the first element of the list.
print "@array\n";
unshift @array, $element; # Unshift adds an element or list of elements to the
                          #beginning of the list.
print "@array\n";

# Sorting arrays alphabetically.

my @unsorted = qw(Cohen Clapton Costello Cream Cocteau);
print "Unsorted: @unsorted\n";
my @sorted = sort @unsorted; # Sort sorts the list alphabetically.
print "Sorted: @sorted\n";

# Sorting arrays numerically.

@unsorted = (1, 7, 3, 11, 2, 88, 43, 75, 17, 21);
print "Unsorted: @unsorted\n";
@sorted = sort { $a <=> $b } @unsorted;
print "Sorted: @sorted\n";
