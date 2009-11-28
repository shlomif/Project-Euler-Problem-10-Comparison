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
int8_t bitmask[(limit+1)/8];

int main(int argc, char * argv[])
{
    int p, i;
    int mark_limit, half_limit;
    long long sum = 0;

    memset(bitmask, '\0', sizeof(bitmask));
    mark_limit = (int)sqrt(limit);
    
    for (p=2 ; p <= mark_limit ; p++)
    {
        if (! ( bitmask[p>>3]&(1 << (p&(8-1))) ) )
        {
            /* It is a prime. */
            sum += p;
            for (i=p*p;i<=limit;i+=p)
            {
                bitmask[i>>3] |= (1 << (i&(8-1)));
            }
        }
    }

    /* Bump to the next odd number */
    p = p+((p&0x1)^0x1);

    p >>= 1;

    half_limit = (limit >> 1);

    for (; p < half_limit; p++)
    {
        if (! ( bitmask[p>>2]&(1 << (( (p << 1) & (8-1) )+1)) ) )
        {
            sum += (p<<1)+1;
        }
    }

    printf("%lli\n", sum);

    return 0;
}
