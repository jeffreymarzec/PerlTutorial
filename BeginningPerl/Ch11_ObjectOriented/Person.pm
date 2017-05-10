package Person;
# Class for storing data about a person
# person.pm
use warnings;
use strict;
use Carp;

my @Everyone;

# Constructor and initialization

sub new {
  my $class = shift; # The first argument is the class being called.
  my $self = {@_}; # Create the hash reference.
  bless ($self, $class); # Bless the reference as the correct class.
  $self->_init;
  return $self;
}

sub _init {
  my $self = shift;
  push @Everyone, $self;
  carp "New object created";
}

# Object get and set methods

sub surname {
  my $self = shift;
  unless (ref $self) {
    croak "Should call surname() with an object, not a class";
  }

  # Receive more data
  my $data = shift;
  # Set the surname if there's any data there.
  $self->{surname} = $data if defined $data;

  return $self->{surname};
}

sub forename {
  my $self = shift;
  unless (ref $self) {
    croak "Should call forename() with an object, not a class";
  }

  # Receive more data
  my $data = shift;
  # Set the forename if there's any data there.
  $self->{forename} = $data if defined $data;

  return $self->{forename};
}

sub address {
  my $self = shift;
  unless (ref $self) {
    croak "Should call address() with an object, not a class";
  }

  # Receive more data
  my $data = shift;
  # Set the address if there's any data there.
  $self->{address} = $data if defined $data;

  return $self->{address};
}

sub occupation {
  my $self = shift;
  unless (ref $self) {
    croak "Should call occupation() with an object, not a class";
  }

  # Receive more data
  my $data = shift;
  # Set the occupation if there's any data there.
  $self->{occupation} = $data if defined $data;

  return $self->{occupation};
}

# Class accessor methods

sub headCount { scalar @Everyone }
sub everyone  { @Everyone        }

# Utility methods

sub fullName {
  my $self = shift;
  return $self->forename." ".$self->surname;
}

sub printLetter {
  my $self     = shift;
  my $name     = $self->fullName;
  my $address  = $self->address;
  my $forename = $self->forename;
  my $body     = shift;
  my @date     = (localtime) [3, 4, 5];
  $date[1]++;     # Months start at 0.
  $date[2]+=1900; # Add 1900 to get current year.
  my $date    = join "/", @date;

  print <<EOF;
$name
$address

$date

Dear $forename,

$body

Yours faithfully,
EOF
  return $self;
}

1;
