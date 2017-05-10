#!/usr/bin/perl
# catTesting.pl

use 5.18.2;
use warnings;
use strict;
use Cat;

# Tests the Cat class.

my $package = 'Cat';

say "$package found." if eval {$package->can('can')};
say "$package installed." if module_loaded("$package");

my $princess = Cat->new( name       => 'Princess',
                         birth_year => 2006,
                         diet       => 'dry food' );

$princess->meow;

say $princess->name, ' eats ', $princess->diet;
$princess->diet('wet food');
say $princess->name, ' now eats ', $princess->diet;

say $princess->name, ' is ', $princess->age, ' years old.';

$princess->show_vital_stats;

my $metaclass = Cat->meta;
say 'Cat instances have the attributes:';
say $_->name for $metaclass->get_all_attributes;
say 'Cat instances support the methods:';
say $_->fully_qualified_name for $metaclass->get_all_methods;

sub module_loaded {
	(my $modname = shift) =~ s!::!/!g;
	return exists $INC{ $modname . '.pm' };
}