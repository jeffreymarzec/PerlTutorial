#!/usr/bin/perl
# searchDirectory.pl

use warnings;
use strict;

# Searches the current directory for a given string.

print "Enter a phrase to search the directory for.\n";
my $phrase = <STDIN>;
chomp $phrase;
my @file;
my $current;
my $line = 1;

opendir DH, "." or die "Couldn't open the current directory: $!";
print "Searching directory for \"$phrase\".\n";
print "File Name                     Line Number\n";
while ($_ = readdir(DH)) {
  next if $_ eq "." or $_ eq "..";
  next if -d $_;
  next unless -r _;
  open FILE, $_ or die "Couldn't open file: $!";
  @file = <FILE>;
  for $current (@file) {
    if ($current =~ /\b$phrase\b/) {
      print $_, " " x (30-length($_)), "$line\n";
    }
    $line++;
  }
  $line = 1;
}
