#!/usr/bin/perl -s
# commandLine.pl

use warnings;
use strict;

# The -s flag on the first line lets us create our own command line switches.

my $lineNo;
my $current = "";
our ($v, $h); # These are the flags being created.

# The -v flag will print a message about the version.

if (defined $v) {
  print "$0 - line numberer, version 3\n";
  exit;
}

# The -h flag displays help.

if (defined $h) {
  print <<EOF;
$0 - Number of lines in a file

Usage : $0 [-h|-v] [filename filename...]

This utility prints out each line in a file to standard output,
with line numbers added.
EOF
  exit;
}

while (<>) {
  if ($current ne $ARGV) {
    $current = $ARGV;
    print "\n\t\tFile: $ARGV\n\n";
    $lineNo = 1;
  }
  print $lineNo++;
  print ": $_";
}
