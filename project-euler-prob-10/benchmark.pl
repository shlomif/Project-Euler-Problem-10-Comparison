#!/usr/bin/perl

use strict;
use warnings;

use Benchmark qw(:all) ;

use File::Copy qw(copy);

sub get_perl_prog_kv
{
    my $prog = shift;
    my $cmd = "perl $prog.pl > /dev/null";

    return ("perl-$prog" => sub { system($cmd); });
}

my @c_s = qw(c_mine c_mine_micro_opt c_mine_half);

sub run_c
{
    system("./c > /dev/null");
}

foreach my $c_prog (
    @c_s,
    (map { my $s = $_; $s =~ s{\Ac_}{c_opti_}; $s } @c_s)
)
{
    # C is for Cookie! In our case it's a short name for the program to
    # get rid of timing problems
    copy($c_prog, "c");
    chmod(0755, "c");
    timethese (500, { $c_prog => \&run_c },);
    unlink("c");
}

foreach my $p_prog (
    qw(haskell_mine haskell_zeroth),
    qw(10.pl 10_half.pl),
)
{
    # C is for Cookie! In our case it's a short name for the program to
    # get rid of timing problems
    copy($p_prog, "c");
    chmod(0755, "c");
    timethese (20, { $p_prog => \&run_c },);
    unlink("c");
}
