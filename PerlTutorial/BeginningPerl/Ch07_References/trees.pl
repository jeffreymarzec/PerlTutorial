#!/usr/bin/perl
# trees.pl

use warnings;
use strict;

# An address book can be built as a tree using hashes and arrays.

my %addressBook;

$addressBook{"Paddy Malone"} = {
  address => "23, Blue Jay Way",
  phone => "404-6599",
  friends => ["Baba O'Reilly", "Mick Flaherty"]
};

$addressBook{"Baba O'Reilly"} = {
  address => "24, Blue Jay Way",
  phone => "404-6800",
  friends => ["Bob McDowell", "Mick Flaherty", "Andy Donahue"]
};

$addressBook{"Mick Flaherty"} = {
  address => "25, Blue Jay Way",
  phone => "404-3599",
  friends => ["Paddy Malone", "Timothy O'Leary"]
};

$addressBook{"Bob McDowell"} = {
  address => "26, Blue Jay Way",
  phone => "404-3457",
  friends => ["Andy Donahue", "Baba O'Reilly"]
};

$addressBook{"Andy Donahue"} = {
  address => "27, Blue Jay Way",
  phone => "404-0234",
  friends => ["Jimmy Callahan", "Mick Flaherty"]
};

$addressBook{"Timothy O'Leary"} = {
  address => "28, Blue Jay Way",
  phone => "404-3845",
  friends => ["Bob McDowell", "Mick Flaherty", "Paddy Malone"]
};

$addressBook{"Jimmy Callahan"} = {
  address => "29, Blue Jay Way",
  phone => "404-1277",
  friends => ["Andy Donahue", "Baba O'Reilly", "Mick Flaherty"]
};

# Then a person can be printed out from the address book.

my $who = "Paddy Malone";

if (exists $addressBook{$who}) {
  print "$who\n";
  print "Address:  ", $addressBook{$who}->{address}, "\n";
  print "Phone no: ", $addressBook{$who}->{phone}, "\n";
  my @friends = @{$addressBook{$who}->{friends}};
  print "Friends:\n";
  for (@friends) {
    print "\t$_\n";
  }
}

# A loop can print out everyone in the address book.

for $who (keys %addressBook) {
  print "$who\n";
  print "Address:  ", $addressBook{$who}->{address}, "\n";
  print "Phone no: ", $addressBook{$who}->{phone}, "\n";
  my @friends = @{$addressBook{$who}->{friends}};
  print "Friends:\n";
  for (@friends) {
    print "\t$_\n";
  }
}

# A list of each person's friends can be created by traversing the tree.

$, = "\t"; # Set output field separator for tabulated display.
my @todo = ("Paddy Malone"); # Start point.
my %seen; # Keep track of who has been visited.
while (@todo) {
  my $who = shift @todo; # Get person from the end of the array.
  $seen{$who}++; # Mark the current person as visited.
  my @friends = @{$addressBook{$who}->{friends}};
  print "$who has friends: ", @friends, "\n";
  for (@friends) {
    # Add unvisited friends.
    push @todo, $_ unless exists $seen{$_};
  }
}
