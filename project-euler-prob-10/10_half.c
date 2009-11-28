/*
 * =====================================================================================
 *
 *       Filename:  10.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  28/11/09 14:08:11
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *        Company:  
 *
 * =====================================================================================
 */

#include <string.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>

#define limit 2000000
int8_t bitmask[(limit+1)/8/2];

int main(int argc, char * argv[])
{
    int half, p, i;
    int half_limit;
    int loop_to;
    long long sum = 0 + 2;

    memset(bitmask, '\0', sizeof(bitmask));

    loop_to=(((int)(sqrt(limit)))>>1);
    half_limit = (limit-1)>>1;
    
    for (half=1 ; half <= loop_to ; half++)
    {
        if (! ( bitmask[half>>3]&(1 << (half&(8-1))) ) )
        {
            /* It is a prime. */
            p = (half << 1)+1;
            sum += p;
            for (i = ((p*p)>>1) ; i < half_limit ; i+=p )
            {
                bitmask[i>>3] |= (1 << (i&(8-1)));
            }
        }
    }

    for( ; half < half_limit ; half++)
    {
        if (! ( bitmask[half>>3]&(1 << (half&(8-1))) ) )
        {
            sum += (half<<1)+1;
        }
    }

    printf("%lli\n", sum);

    return 0;
}

