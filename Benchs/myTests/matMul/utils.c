#include <time.h>
#include <stdio.h>
#include <stdlib.h>

#include "utils.h"

int** M1;
int** M2;
int** M3;

int** gen_mat(const int M, const int N) {
  int** m = (int**)malloc(M * sizeof(int*));
  for (int i = 0; i < M; i++) {
    m[i] = (int*)malloc(N * sizeof(int));
  }
  return m;
}

void alloc_mats(const int M, const int N, const int O) {
  M1 = gen_mat(M, N);
  M2 = gen_mat(N, O);
  M3 = gen_mat(M, O);
}

int** get_mat(int option) {
  switch (option) {
    case 0: return M1;
    case 1: return M2;
    case 2: return M3;
    default: return 0;
  }
}

void init_mat(int** m, const int M, const int N, const int sparsity) {
  for (int i = 0; i < M; i++) {
    for (int j = 0; j < N; j++) {
      m[i][j] = rand() % sparsity ? 0 : 1;
    }
  }
}

void print_mat(char* title, int** m, const int M, const int N) {
  printf("%s\n", title);
  for (int i = 0; i < M; i++) {
    for (int j = 0; j < N; j++) {
      printf("%4d", m[i][j]);
    }
    printf("\n");
  }
}

double run(
    void (*matMul)(int**, int**, int**, const int, const int, const int),
    int** m1,
    int** m2,
    int** mm,
    const int M,
    const int N,
    const int O,
    const int s
) {
  clock_t start, end;
  double time;
  start = clock();
  (*matMul)(m1, m2, mm, M, N, O);
  end = clock();
  time = ((double) (end - start)) / CLOCKS_PER_SEC;
  printf("%8.4lf,", time);
  return time;
}
