#!/usr/bin/perl
# subroutines1.pl

use warnings;
use strict;

# The keyword sub is used to declare a subroutine.

sub version {
  print "Beginning Perl's \"Hello, world.\" version 2.0\n"
}

my $option = shift;
version if $option eq "-v" or $option eq "--version";
print "Hello, world.\n";

# Note that version doesn't need parentheses because version was declared first.
# If version is declared after it's used, it would need to be version() instead.
# The subroutine could also be listed at the top of the file.

# sub version;

# Or in a list of subroutines.

# use subs qw(version, ...);
