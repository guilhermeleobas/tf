#ifndef MAT_MUL_H
#define MAT_MUL_H

typedef void (*F)(int**, int**, int**, const int, const int, const int);

void mul_mat0(int** m1, int** m2, int** mm, int M, int N, int O);

void mul_mat1(int** m1, int** m2, int** mm, int M, int N, int O);

void mul_mat2(int** m1, int** m2, int** mm, int M, int N, int O);

void mul_mat3(int** m1, int** m2, int** mm, int M, int N, int O);

void mul_mat4(int** m1, int** m2, int** mm, int M, int N, int O);

void mul_mat5(int** m1, int** m2, int** mm, int M, int N, int O);

void mul_mat6(int** m1, int** m2, int** mm, int M, int N, int O);


F choose_fun(int option);

#endif
