#!/usr/bin/perl
# regex.pl

use warnings;
use strict;

my $text = "The quick brown fox jumps over the lazy dog.";

# Regular expressions can be used to search for a string within a string.

if ($text =~ /fox/) {
  print "Found \"fox\".\n";
}

# They can also check to see if something doesn't appear.

if ($text !~ /cat/) {
  print "Didn't find \"cat\".\n";
}

# Regex is case sensitive unless the modifier i is added.

if ($text =~ /the quick/) {
  print "Found \"the quick\".\n";
}
if ($text =~ /the quick/i) {
  print "Found \"the quick\".\n";
}

# The symbols ^ and $ indicate the pattern should be at the start or end of the
# string, respectively.

if ($text =~ /^brown/) {
  print "Found \"brown\" at the start of the string.\n";
}
else {
  print "Did not find \"brown\" at the start of the string.\n";
}

if ($text =~ /dog.$/) {
  print "Found \"dog.\" at the end of the string.\n";
}
else {
  print "Did not find \"dog.\" at the end of the string.\n";
}

# Multiple characters can be looked for with square brackets.

if ($text =~ /f[aio]x/) {
  print "Found a match.\n";
}

# Using ^ in square brackets means any character besides these.

if ($text =~ /f[^o]x/) {
  print "Found a match.\n";
}
else {
  print "Could not find a match.\n";
}

# Using - specifies a range of characters.

if ($text =~ /[0-9]/) {
  print "Found a match.\n";
}
else {
  print "Could not find a match.\n";
}
if ($text =~ /[A-Za-z]/) {
  print "Found a match.\n";
}
else {
  print "Could not find a match.\n";
}

# Shortcuts for character classes.
# \d   [0-9]
# \w   [0-9A-Za-z_]
# \s   [ \t\n\r]
# \D   [^0-9]
# \W   [^0-9A-Za-z_]
# \S   [^ \t\n\r]

# Using \b finds a boundary, either \W or the end of the string.

# Does not match because dog has a period after it, not white space.
if ($text =~ /\sdog\s/) {
  print "Found a match.\n";
}
else {
  print "Could not find a match.\n";
}
# Matches because the period counts as a boundary.
if ($text =~ /\bdog\b/) {
  print "Found a match.\n";
}
else {
  print "Could not find a match.\n";
}

# Using | means either of two options.

if ($text =~ /fix|fox/) {
  print "Found a match.\n";
}
else {
  print "Could not find a match.\n";
}

# Using parentheses groups parts of the expression.

if ($text =~ /f(i|o)x/) {
  print "Found a match.\n";
}
else {
  print "Could not find a match.\n";
}

# Here are some other modifiers.

# ?     Indicates that the preceding may or may not appear.
# +     Indicates that the preceding may appear one or more times.
# *     Indicates that the preceding may not appear or appear one or many times.
# {#}   Indicates that the preceding must appear # times.
# {#,}  Indicates that the preceding appears at least # times.
# {,#}  Indicates that the preceding appears at most # times.
# {#,#} Indicates that the preceding may appear between # and # times.

# Found matches can be backreferenced with $# where # is the match number.

if ($text =~ /(\b\w+\b)(.*)(\b\w+\b)/) {
  print "\$1 is '$1'\n" if defined $1;
  print "\$2 is '$2'\n" if defined $2;
  print "\$3 is '$3'\n" if defined $3;
}

# Regular expressions can be used to replace parts of strings.

$_ = $text;
s/dog/cat/;
print $_, "\n";

# Adding /g will replace all instances of the string.

s/a/ahh/g;
print $_, "\n";

# Any non word character can be used as a delimiter.

s#ahh#a#g;
s{cat}{dog};
print $_, "\n";

# Other modifiers.

# /m   Treats the string as multiple lines based on new line characters.
# /s   Treats the string as a single line, so . will match new line characters.
# /g   Replaces globally and allows for multiple matches.
# \G   When at the start of a regex with /g, anchors to end of last match.
# /x   Allow whitespace and comments in an expression.

# Split creates an array from a string using a delimiter.

my @array = split, $_; # By default the delimiter is white space.
print "@array\n";
@array = split /[aeiou]+/, $_;
print "@array\n";

# An array can be joined into a string with the join keyword.

my $joined = join "_", @array;
print $joined, "\n";

# Transliteration lets characters be matched to other characters.

my $code = "2011064";
$code =~ tr/0123456789/abcdefghij/;
print $code, "\n";

# Or count the number of matches.

my $numVowels = $_ =~ tr/aeiou//;
print $numVowels, "\n";

# The /d modifier deletes characters on the left with no character on the right.

tr/aeiou//d;
print $_, "\n";

# Lookaheads allow for substitutions only if the ?= is a match too.

$_ = "The quick brown fox jumps over the lazy dog.";
s/o(?=x)/a/;
print $_, "\n";

# This can look for a nonmatch with ?! instead.

$_ = "The quick brown fox jumps over the lazy dog.";
s/o(?!x)/a/;
print $_, "\n";

# Lookbehinds do this with ?<= or ?<! but for the preceding part of the string.

$_ = "The quick brown fox jumps over the lazy dog.";
s/(?<=f)o/a/;
print $_, "\n";

$_ = "The quick brown fox jumps over the lazy dog.";
s/(?<!f)o/a/;
print $_, "\n";

# Backreferences can be used to look for repeated words, but $# changes to \#.

$_ = "The quick brown fox fox jumps over the lazy dog.";
if (/\b(\w+) \1\b/) {
  print "Repeated word: $1\n";
}
