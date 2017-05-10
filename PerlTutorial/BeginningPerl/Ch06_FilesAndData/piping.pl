#!/usr/bin/perl
# fileWriting5.pl

use warnings;
use strict;

# Output from one program can be piped to another.

my %inventory;
print "Enter individual items, followed by a new line.\n";
print "Enter a blank line to finish.\n";
while (1) {
  my $item = <STDIN>;
  chomp $item;
  last unless $item;
  $inventory{lc $item}++;
}

open (SORT, "| perl fileWriting2.pl") or *SORT = *STDOUT;
select *SORT;
while (my ($item, $quantity) = each %inventory) {
  if ($quantity > 1) {
    $item =~ s/^(\w+)\b/$1s/ unless $item =~ /^\w+s\b/;
  }
  print "$item: $quantity\n";
}
