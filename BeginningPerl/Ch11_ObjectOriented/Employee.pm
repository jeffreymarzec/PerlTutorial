package Employee;
#Employee.pm
use warnings;
use strict;
use Person;
use Carp;

our @ISA = qw(Person);

sub _init {
  my $self = shift;
  my $employer = $self->employer || "unknown";
  unless (ref $employer) {
    my $new_o = Person->new( surname => $employer );
    $self->employer($new_o);
  }
  $self->SUPER::_init();
}

sub employer {
  my $self = shift;
  unless (ref $self) {
    croak "Should call employer() with an object, not a class";
  }

  # Receive more data
  my $data = shift;
  # Set the employer if there's any data there.
  $self->{employer} = $data if defined $data;

  return $self->{employer};
}

sub position {
  my $self = shift;
  unless (ref $self) {
    croak "Should call position() with an object, not a class";
  }

  # Receive more data
  my $data = shift;
  # Set the employer if there's any data there.
  $self->{position} = $data if defined $data;

  return $self->{position};
}

sub salary {
  my $self = shift;
  unless (ref $self) {
    croak "Should call salary() with an object, not a class";
  }

  # Receive more data
  my $data = shift;
  # Set the employer if there's any data there.
  $self->{salary} = $data if defined $data;

  return $self->{salary};
}

sub raise {
  my $self = shift;
  my $newSalary = $self->salary + 2000;
  $self->salary($newSalary);
  return $self;
}
