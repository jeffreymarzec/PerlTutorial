#!/usr/bin/perl
# fileTests.pl

use warnings;
use strict;

# There are file test flags that can check various properties of a file.

my $target;
while (1) {
  print "What file should I write on? ";
  $target = <STDIN>;
  chomp $target;
  # -d returns true if the file is a directory.
  if (-d $target) {
    print "No, $target is a directory.\n";
    next;
  }
  # -e returns true if the file exists.
  if (-e $target) {
    print "File already exists. What should I do?\n";
    print "(Enter 'r' to write to a different name, ";
    print "'o' to overwrite or\n";
    print "'b' to back up to $target.old)\n";
    my $choice = <STDIN>;
    chomp $choice;
    if ($choice eq "r") {
      next;
    }
    elsif ($choice eq "o") {
      # -o returns true if the file is owned by the user.
      unless (-o $target) {
        print "Can't overwrite $target, it's not yours.\n";
        next;
      }
      # -w returns true if the file is writable by the user.
      unless (-w $target) {
        print "Can't overwrite $target: $!\n";
        next;
      }
    }
    elsif ($choice eq "b") {
      if (-e $target.".old")
      {
        print "$target.old already exists.\n";
        print "Enter 'o' to overwrite the backup or anything else to cancel.\n";
        $choice = <STDIN>;
        chomp $choice;
        next unless $choice eq "o";
      }
      if (rename($target,$target.".old")) {
        print "OK, moved $target to $target.old\n";
      }
      else {
        print "Couldn't rename file: $!\n";
        next;
      }
    }
    else {
      print "I didn't understand that answer.\n";
      next;
    }
  }
  last if open OUTPUT, "> $target";
  print "I couldn't write on $target: $!\n";
}
print OUTPUT "Congratulations.\n";
print "Wrote to file $target\n";
