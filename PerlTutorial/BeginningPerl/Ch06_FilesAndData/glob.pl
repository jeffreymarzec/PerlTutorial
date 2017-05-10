#!/usr/bin/perl
# glob.pl

use warnings;
use strict;

# Using globs can match file names.

# * matches everything.
# 3* would match any file that starts with 3.
# ? matches a single character.
# *l would match any file that ends with l.

my @files = glob("f*");
print "Matched f* : @files \n";
