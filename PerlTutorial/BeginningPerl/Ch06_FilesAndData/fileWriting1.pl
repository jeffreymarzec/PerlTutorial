#!/usr/bin/perl
# fileWriting1.pl

use warnings;
use strict;

my $source = shift @ARGV;
my $destination = shift @ARGV;

# Files can be opened for writing with > and >>.

# Using > will create a new file or overwrite the file. Using >> will append
# to the end of the file.

# The permissions for a created file can be adjusted with umask.
# umask(0777);

open IN, $source or die "Can't read source file $source: $!\n";
open OUT, ">$destination" or die "Can't write on file $destination: $!\n";

print "Copying $source to $destination\n";

while (<IN>) {
  print OUT $_;
}
