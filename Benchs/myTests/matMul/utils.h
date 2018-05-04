#ifndef UTIL_H
#define UTIL_H

void alloc_mats(const int M, const int N, const int O);

int** get_mat(int option);

int** gen_mat(const int M, const int N);

void init_mat(int** m, const int M, const int N, const int sparsity);

void print_mat(char* title, int** m, const int M, const int N);

double run(
    void (*matMul)(int**, int**, int**, const int, const int, const int),
    int** m1,
    int** m2,
    int** mm,
    const int M,
    const int N,
    const int O,
    const int s
);

#endif
