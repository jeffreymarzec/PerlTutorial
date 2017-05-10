#!/usr/bin/perl
# testing.pl

use warnings;
use strict;
use Test::More;
use Cat;

# The Test::More module helps create test cases.

# The number of tests can be declared in advance.

use Test::More tests => 11;

# Using ok checks if a test returns true.

ok    1, "the number one should be true";
ok  ! 0, "... and zero should not";
ok ! "", "the empty string should be false";
ok  "!", "... and a non-empty string should not";

# Using is checks if two values are the same using the eq operator.

is 4, 2 + 2, "addition should work";

# Using isnt checks if two values are not the same using the ne operator.

isnt "pancake", 100, "pancakes aren't numeric";

# Using cmp_ok lets the comparison method be chosen.

my $cur_balance = 1000;
my $monkey = 5;
my $ape = 5;

cmp_ok     100, "<=", $cur_balance, "I should have at least \$100";
cmp_ok $monkey, "==", $ape, "There should be the same number of animals";

# Using isa_ok checks that a class or object extends a class.

my $princess1 = Cat->new( name       => 'Princess',
                         birth_year => 2006,
                         diet       => 'dry food' );

isa_ok $princess1, "Cat";

# Using can_ok checks that a class or object can perform a method.

can_ok $princess1, "meow";

# Using is_deeply compares the contents of two references.

my $princess2 = Cat->new( name       => 'Princess',
                          birth_year => 2006,
                          diet       => 'dry food' );

is_deeply $princess1, $princess2, "Princess and Princess2 are the same cat";

done_testing();