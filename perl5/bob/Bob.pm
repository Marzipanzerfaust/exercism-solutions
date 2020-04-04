# Declare package 'Bob'
package Bob;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(hey);

sub hey {
    my ($msg) = @_;

    my $is_blank = $msg !~ /[[:graph:]]/;
    my $is_question = $msg =~ /\?\s*$/;
    my $is_yell = $msg =~ /[[:upper:]]/ && $msg !~ /[[:lower:]]/;

    if ($is_blank) {
        "Fine. Be that way!";
    } elsif ($is_question && $is_yell) {
        "Calm down, I know what I'm doing!";
    } elsif ($is_question) {
        "Sure.";
    } elsif ($is_yell) {
        "Whoa, chill out!";
    } else {
        "Whatever.";
    }
}

1;
