/* +++Date last modified: 05-Jul-1997 */

/*
**  BITCNTS.C - Test program for bit counting functions
**
**  public domain by Bob Stout & Auke Reitsma
*/

#include <float.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "bitops.h"
#include "conio.h"

#define FUNCS 7

// RNG implemented localy to avoid library incongruences
#ifdef RAND_MAX
#undef RAND_MAX
#endif
#define RAND_MAX 32767
static unsigned long long int next = 1;

int rand(void)
{
  next = next * 1103515245 + 12345;
  return (unsigned int)(next / 65536) % RAND_MAX + 1;
}

void srand(unsigned int seed) { next = seed; }
// End of RNG implementation

static int CDECL bit_shifter(long int x);

int main(int argc, char *argv[])
{
  clock_t start, stop;
  double ct, cmin = DBL_MAX, cmax = 0;
  int i, cminix, cmaxix;
  long j, n, seed;
  int iterations;
  static int (*CDECL pBitCntFunc[FUNCS])(long) = {
      bit_count, bitcount, ntbl_bitcnt, ntbl_bitcount,
      /*            btbl_bitcnt, DOESNT WORK*/
      BW_btbl_bitcount, AR_btbl_bitcount, bit_shifter};
  static char *text[FUNCS] = {
      "Optimized 1 bit/loop counter", "Ratko's mystery algorithm",
      "Recursive bit count by nybbles", "Non-recursive bit count by nybbles",
      /*            "Recursive bit count by bytes",*/
      "Non-recursive bit count by bytes (BW)",
      "Non-recursive bit count by bytes (AR)", "Shift and count bits"};
  if (argc < 2)
  {
    fprintf(stderr, "Usage: bitcnts <iterations>\n");
    exit(-1);
  }
  iterations = atoi(argv[1]);
  srand(1);

  puts("Bit counter algorithm benchmark\n");

  for (i = 0; i < FUNCS; i++)
  {
#if 0
    start = clock();
#endif

    for (j = n = 0, seed = rand(); j < iterations; j++, seed += 13)
    {
      n += pBitCntFunc[i](seed);
    }

#if 0
    stop = clock();
    ct = (stop - start) / (double)CLOCKS_PER_SEC;
    if (ct < cmin) {
	 cmin = ct;
	 cminix = i;
    }
    if (ct > cmax) {
	 cmax = ct;
	 cmaxix = i;
    }

    printf("%-38s> Time: %7.3f sec.; Bits: %ld\n", text[i], ct, n);
#endif
    printf("%-38s> Bits: %ld\n", text[i], n);
  }
#if 0
  printf("\nBest  > %s\n", text[cminix]);
  printf("Worst > %s\n", text[cmaxix]);
#endif
  return 0;
}

static int CDECL bit_shifter(long int x)
{
  int i, n;

  for (i = n = 0; x && (i < (sizeof(long) * CHAR_BIT)); ++i, x >>= 1)
  {
    n += (int)(x & 1L);
  }
  return n;
}
