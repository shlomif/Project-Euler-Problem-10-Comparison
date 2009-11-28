#!/usr/bin/perl

use strict;
use warnings;

use Math::BigInt lib => 'GMP';

my $limit = 2_000_000;

my $primes_bitmask = "";

my $loop_to = (int(sqrt($limit)))>>1;
my $half_limit = ($limit-1)>>1;

my $sum = 0+2;
my $total_sum = Math::BigInt->new('0');

for my $half (1 .. $loop_to)
{
    if (vec($primes_bitmask, $half, 1) == 0)
    {
        my $p = (($half<<1)+1);
        $sum += $p;

        my $i = ($p * $p)>>1;

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


for my $half ($loop_to .. $half_limit)
{
    if (vec($primes_bitmask, $half, 1) == 0)
    {
        if (($sum += (($half<<1)+1)) > (1 << 30))
        {
            $total_sum += $sum;
            $sum = 0;
        }
    }
}

$total_sum += $sum;
print "$total_sum\n";

