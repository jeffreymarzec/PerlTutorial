#!/usr/bin/perl
# directoryReading.pl

use warnings;
use strict;

# The keyword opendir opens a directory for reading.

print "Contents of the current directory:\n";
opendir DH, "." or die "Couldn't open the current directory: $!";
while ($_ = readdir(DH)) {
  next if $_ eq "." or $_ eq ".."; # Skips the current and parent directories.
  print $_, " " x (30-length($_)); # Specifies that the file name plus the
                                   # following spaces will add up to 30.
  print "d" if -d $_; # Checks if the file is a directory.
  print "r" if -r _; # Checks if the file is readable. Note that _ is used
                     # because the $_ call got all this data already, so this
                     # refers to the previous call.
  print "w" if -w _; # Checks if the file is writeable.
  print "x" if -x _; # Checks if the file is executable.
  print "o" if -o _; # Checks if the file is owned by the user.
  print "\t";
  print -s _ if -r _ and -f _; # Prints the size if the file is readable and
                               # not a directory.
  print "\n";
}
