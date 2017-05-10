#!/usr/bin/perl
# argv.pl

use warnings;
use strict;

# ARGV is an array of elements from the command line after the program name.

for (@ARGV) {
  print "Element: |$_|\n";
}
