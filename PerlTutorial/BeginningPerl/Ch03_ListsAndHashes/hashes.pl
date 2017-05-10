#!/usr/bin/perl
# hashes.pl

use warnings;
use strict;

# Hashes are declared with %.

my %stateCapitals=(
  "California" , "Sacramento",
  "Nevada"     , "Carson City",
  "Arizona"    , "Phoenix"
);

# Another way to declare hashes.

my %countryCapitals=(
  UnitedStates => "Washington D.C.",
  Canada       => "Ottawa",
  Mexico       => "Mexico City"
);

# Values can be looked up by keys.

print "The capital of California is ", $stateCapitals{California}, ".\n";
print "The capital of Canada is ", $countryCapitals{Canada}, ".\n";

# Hashes can be converted to lists, but order is not guaranteed.

my @stateCapitalList = %stateCapitals;
print "@stateCapitalList\n";

# A hash can be reversed, making keys into values and values into keys. Note
# that if there is more than one instance of a value, only one will make it
# to the reversed hash, because keys must be unique.

my %capitalStates = reverse %stateCapitals;
print "Sacramento is the capital of ", $capitalStates{Sacramento}, ".\n";

# Adding entries to a hash.

$stateCapitals{Oregon} = "Salem";
print "The capital of Oregon is ", $stateCapitals{Oregon}, ".\n";

# An entry can be changed by reassigning it.

$stateCapitals{Washington} = "Seattle";
print "The capital of Washington isn't ", $stateCapitals{Washington}, ".\n";
$stateCapitals{Washington} = "Olympia";
print "The capital of Washington is ", $stateCapitals{Washington}, ".\n";

# Removing an entry from a hash.

delete $stateCapitals{Washington};
$stateCapitals{Washington} = "Olympia";

# A list of the keys can be created with keys %hashName. A list of values can
# also be made with values %hashName.

for (keys %stateCapitals) {
  print "The capital of $_ is $stateCapitals{$_}.\n";
}
