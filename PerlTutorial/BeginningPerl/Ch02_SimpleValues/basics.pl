#!/usr/bin/perl
# basics.pl

use warnings;
use strict;

print "Hello, world.\n"; # This is a print statement.
print ("Con", "cat", "e", "nate.", "\n"); # Use parentheses and commas for concatenation.

print 25_000_000, "\n"; # Underscores will be ignored.
print 3.141592653589793238462643383279, "\n"; # This is truncated to 32 bits.

print 0b0111, "\n"; # Start a number with 0b to read it as binary.
print 01101, "\n"; # Start a number with 0 to read it as octal.
print 0xBEEF, "\n"; # Start a number with 0x to read it as hex.

print '\tThis is a single quoted string.\n'; # Single quotes are not interpolated.
print "\n\tThis is a double quoted string.\n"; # Double quates are interpolated.
print "\"Hi,\" they said.", "\n"; # Use backslashes to backwhack characters.

print 2**5; # The ** operator finds the power.

print "51 ANDed with 85 gives us ", 51 & 85, "\n"; # Bitwise AND: &
print "204 ORed with 85 gives us ", 204 | 85, "\n"; # Bitwise OR: |
print "204 XORed with 170 gives us ", 204 ^ 170, "\n"; # Bitwise XOR: ^
print "NOT 85 is ", ~85, "\n"; # Bitwise NOT including leading zeroes: ~

print "Compare 7 and 9? ", 7 <=> 9, "\n"; # The comparison operator <=> returns -1.
print "Compare 7 and 7? ", 7 <=> 7, "\n"; # Returns 0.
print "Compare 8 and 5? ", 8 <=> 4, "\n"; # Returns 1.

print "Con"."cat"."e"."nate."."\n"; # The concatenation operator is a period.
print "loop " x3, "\n"; # The repitition operator is x#.

print "An ! has ASCII value ", ord("!"), "\n"; # The ASCII value can be found with ord().

print "Compare chicken and egg. ", "chicken" cmp "egg", "\n"; # Compare strings with cmp.
print "Is dog greater than cat? ", "dog" gt "cat", "\n"; # String greater than: gt
print "Is dog less than cat? ", "dog" lt "cat", "\n"; # String less than: lt
print "Is one equal to two? ", "one" eq "two", "\n"; # String equal: eq

our $name = "Jon"; # Declare scalar varaibles with $. Using our creates a global variable.
print "My name is ", $name, ".\n"; # Print a scalar variable.
$name = "John"; # Change it by assigning a new value.
print "It's spelled ", $name, ".\n";

our $num = 1;
print "The number is currently ", $num, "\n";
{
  my $num = 2; # Using my creates a lexical variable, only used in the block.
  print "The number is now ", $num, "\n";
}
print "Now the number is back to ", $num, "\n"; # The scope ends, so the old num is used.
