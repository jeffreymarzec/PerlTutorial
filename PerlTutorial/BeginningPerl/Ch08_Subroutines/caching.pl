#!/usr/bin/perl
# caching.pl

use warnings;
use strict;

# Results can be cached for quicker access.

my %cache;

while (1) {
  print "Enter a file, or nothing to quit.\n";
  my $input = <STDIN>;
  chomp $input;
  last unless $input;
  print "The first line of $input is:\n", first_line($input);
}

sub first_line {
  my $filename = shift;
  # If the file has already been searched for, get the line from the cache.
  return $cache{$filename} if exists $cache{$filename};
  open FILE, $filename or return "File could not be read: $!";
  my $line = <FILE>;
  $cache{filename} = $line; # Store the line to the cache.
  return $line;
}
