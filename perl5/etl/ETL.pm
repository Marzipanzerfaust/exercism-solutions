package ETL;

use strict;

sub transform {
    my ($input) = @_;

    my $output = {};

    for my $score (keys %$input) {
        my $letters = $input->{$score};

        for my $letter (@$letters) {
            $output->{lc $letter} = $score;
        }
    }

    return $output;
}

1;
