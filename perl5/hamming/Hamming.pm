package Hamming;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(hamming_distance);

sub hamming_distance {
  my ( $strand1, $strand2 ) = @_;

  my ($a, $b) = (length($strand1), length($strand2));

  if ($a && $b) {
      die "left and right strands must be of equal length" if $a != $b;
  } elsif ($a) {
      die "right strand must not be empty" if !$b;
  } elsif ($b) {
      die "left strand must not be empty" if !$a;
  }

  my $distance = 0;

  for my $i (0..$a) {
      if (substr($strand1, $i, 1) ne substr($strand2, $i, 1)) {
          $distance += 1;
      }
  }

  return $distance;
}

1;
