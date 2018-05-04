#include <time.h>
#include <stdio.h>
#include <stdlib.h>

#include "utils.h"
#include "matMul.h"

int main(int argc, char** argv) {
  if (argc != 7) {
    fprintf(stderr, "Sintaxe: %s M N O s dummy(=0)\n", argv[0]);
    return 1;
  } else {
    const int M = atoi(argv[1]);
    const int N = atoi(argv[2]);
    const int O = atoi(argv[3]);
    const int s = atoi(argv[4]);
    if (s < 1) {
      fprintf(stderr, "Sparsity must be greater than or equal 1\n");
      return 1;
    } else {
      alloc_mats(M, N, O);
      const int version = atoi(argv[5]);
      const int dummy = atoi(argv[6]);
      int** m1 = get_mat(dummy);
      int** m2 = get_mat(dummy + 1);
      int** mm = get_mat(dummy + 2);
      init_mat(m1, M, N, s);
      init_mat(m2, N, O, s);

      F mul_mat = choose_fun(version);
      run(mul_mat, m1, m2, mm, M, N, O, s);
    }
  }
}
