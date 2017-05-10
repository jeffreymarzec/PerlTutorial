#!/usr/bin/perl
# fileWriting3.pl

use warnings;
use strict;

# The location that print uses can be changed with the select keyword.

# my $logging = "screen"; # Write to STDOUT.
my $logging = "file"; # Write to a file.

if ($logging eq "file") {
  open LOG, "> output.log" or die $!;
  select LOG; # Changes the default print location to LOG.
}

# The keyword localtime returns a list of time information. Making it a scalar
# prints the time as a scalar.

print "Program started: ", scalar localtime, "\n";
sleep 30;
print "Program finished: ", scalar localtime, "\n";

select STDOUT; # Changes the default print location to STDOUT.
