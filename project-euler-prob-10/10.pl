#!/usr/bin/perl

use strict;
use warnings;

use Math::BigInt lib => 'GMP';

my $limit = 2_000_000;

my $primes_bitmask = "";

my $loop_to = int(sqrt($limit));
my $sum = 0;
my $total_sum = Math::BigInt->new('0');

for my $p (2 .. $loop_to)
{
    if (vec($primes_bitmask, $p, 1) == 0)
    {
        $sum += $p;

        my $i = $p * $p;

        while ($i < $limit)
        {
            vec($primes_bitmask, $i, 1) = 1;
        }
        continue
        {
            $i += $p;
        }

    }
}

for my $p ($loop_to .. $limit)
{
    if (vec($primes_bitmask, $p, 1) == 0)
    {
        if (($sum += $p) > (1 << 30))
        {
            $total_sum += $sum;
            $sum = 0;
        }
    }
}

$total_sum += $sum;
print "$total_sum\n";

