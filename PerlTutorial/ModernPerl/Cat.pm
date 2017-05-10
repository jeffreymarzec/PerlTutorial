package CalculateAge::From::BirthYear {
  use Moose::Role;

  has 'birth_year',
    is      => 'ro',
    isa     => 'Int',
    default => sub { (localtime)[5] + 1900 };

  sub age {
    my $self = shift;
    my $year = (localtime)[5] + 1900;

    return $year - $self->birth_year;
  }
}

package Cat;
# Cat.pm

use 5.18.2;
use Moose;

has 'name',        is => 'ro', isa => 'Str';
has 'diet',        is => 'rw', isa => 'Str';
has 'birth_year',
  is      => 'ro',
  isa     => 'Int',
  default => sub { (localtime)[5] + 1900 };

with 'LivingBeing', 'CalculateAge::From::BirthYear';

sub meow {
  my $self = shift;
  say 'Meow!';
}

# sub age {
#   my $self = shift;
#   my $year = (localtime)[5] + 1900;
#
#   return $year - $self->birth_year;
# }

sub show_vital_stats {
  my $object = shift;

  say 'My name is ', $object->name;
  say 'I am ',       $object->age;
  say 'I eat ',      $object->diet;
}

1