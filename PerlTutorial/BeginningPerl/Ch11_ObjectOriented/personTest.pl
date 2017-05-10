#/usr/bin/perl
# personTest.pl

use warnings;
use strict;
use Person;

# Testing the Person class.

print "Population: ", Person->headCount, "\n";

my $person1 = Person->new (
  surname    => "Galilei",
  forename   => "Galileo",
  address    => "9.81 Pisa Apts.",
  occupation => "Bombadier"
);

print "Population: ", Person->headCount, "\n";

my $person2 = Person->new (
  surname    => "Einstein",
  forename   => "Albert",
  address    => "9E16, Relativity Drive",
  occupation => "Plumber"
);

print "Population: ", Person->headCount, "\n";

print "This person's surname: ", $person1->surname, "\n";

print "Old address: ", $person1->address(), "\n";
$person1->address("Campus Mirabilis, Pisa, Italy");
print "New address: ", $person1->address(), "\n";

print "\nPeople we know:\n";
for my $person1(Person->everyone) {
  print $person1->forename, " ", $person1->surname, "\n";
}

$person1->printLetter("You owe me money. Please pay it.");
