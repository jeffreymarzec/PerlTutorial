#!/usr/bin/perl
# fileWriting4.pl

use warnings;
use strict;

# Buffering prevents things on the same line from being written individually.
# This can be changed by setting $| to 1.

$| = 1;
for (1...20) {
  print ".";
  sleep 1;
}
print "\n";
