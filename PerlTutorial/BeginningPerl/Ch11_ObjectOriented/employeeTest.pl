#/usr/bin/perl
# employeeTest.pl

use warnings;
use strict;
use Employee;

# Testing the Employee class.

my $employee1 = Employee->new (
  surname    => "Galilei",
  forename   => "Galileo",
  address    => "9.81 Pisa Apts.",
  occupation => "Bombadier"
);

$employee1->salary("12000");
print "Initial salary: ", $employee1->salary, "\n";
print "Salary after raise: ", $employee1->raise->salary, "\n";
