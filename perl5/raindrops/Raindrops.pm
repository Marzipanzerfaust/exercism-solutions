package Raindrops;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(raindrop);

sub raindrop {
  my ($number) = @_;

  my @output = ();

  push(@output, "Pling") if $number % 3 == 0;
  push(@output, "Plang") if $number % 5 == 0;
  push(@output, "Plong") if $number % 7 == 0;

  push(@output, $number) if @output == 0;

  return join("", @output);
}

1;
