#!/usr/bin/perl

use strict;
use warnings;

use Benchmark qw(:all) ;

sub get_c_prog_kv
{
    my $prog = shift;
    my $cmd = "./$prog > /dev/null";

    return ($prog => sub { system($cmd); });
}

sub get_perl_prog_kv
{
    my $prog = shift;
    my $cmd = "perl $prog.pl > /dev/null";

    return ("perl-$prog" => sub { system($cmd); });
}

timethese(
    500,
    {
        (
            map { get_c_prog_kv($_) } 
            (qw(
                c_mine c_mine_micro_opt c_mine_half 
            ))
        ),
    }
);

timethese(
    20,
    {
        (
            map { get_c_prog_kv($_) } 
            qw(haskell_mine haskell_zeroth)
        ),
        (
            map { get_perl_prog_kv($_) }
            (qw(10 10_half))
        ),
    },
);
