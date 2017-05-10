#!/usr/bin/perl
# subroutines3.pl

use warnings;
use strict;

# Return values can be implicit or explicit.

my ($hours, $minutes, $seconds) = secs2hms(3723);
print "3723 seconds is $hours hours, $minutes minutes, and $seconds seconds.";
print "\n";

sub secs2hms {
  my ($h, $m);
  my $seconds = shift; # Get the argument.
  $h = int($seconds / 3600); # Get as many hours as possible from the seconds.
  $seconds %= 3600; # Find the remaining seconds.
  $m = int($seconds / 60); # Get as many minutes as possible from the seconds.
  $seconds %= 60; # Find the remaining seconds.
  ($h, $m, $seconds); # Implicitly return the hours, minutes, and seconds.
  # return ($h, $m, $seconds); # Identical in function explicit return.
}
