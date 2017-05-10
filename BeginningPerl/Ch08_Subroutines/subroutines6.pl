#!/usr/bin/perl
# subroutines6.pl

use warnings;
use strict;

# Parameters can be assigned default values with the || operator.

sub log_warning {
  my $message = shift || "No warning."; # If there's no parameter, "No warning."
                                        # is the default.
  my $time    = shift || localtime;  # If there's no second parameter, the
                                     # current time is the default.
  print "[$time] $message\n";
}

log_warning("Klingons on the starboard bow.", "Stardate 60030.2");
log_warning("Low on snacks.");
log_warning();
