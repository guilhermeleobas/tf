#include "matMul.h"

void mul_mat0(
    int** m1, int** m2, int** mm, const int M, const int N, const int O
) {
  for (int i = 0; i < M; i++) {
    for (int j = 0; j < O; j++) {
      mm[i][j] = 0;
      for (int k = 0; k < N; k++) {
        mm[i][j] += m1[i][k] * m2[k][j];
      }
    }
  }
}

void mul_mat1(
    int** m1, int** m2, int** mm, const int M, const int N, const int O
) {
  for (int i = 0; i < M; i++) {
    for (int j = 0; j < O; j++) {
      mm[i][j] = 0;
      for (int k = 0; k < N; k++) {
        int x1 = m1[i][k];
        int x2 = m2[k][j];
        int xx = x1 * x2;
        if (xx) {
          mm[i][j] += xx;
        }
      }
    }
  }
}

void mul_mat2(
    int** m1, int** m2, int** mm, const int M, const int N, const int O
) {
  for (int i = 0; i < M; i++) {
    for (int j = 0; j < O; j++) {
      mm[i][j] = 0;
      for (int k = 0; k < N; k++) {
        int x1 = m1[i][k];
        int x2 = m2[k][j];
        if (x1 && x2) {
          mm[i][j] += x1 * x2;
        }
      }
    }
  }
}

void mul_mat3(
    int** m1, int** m2, int** mm, const int M, const int N, const int O
) {
  for (int i = 0; i < M; i++) {
    for (int j = 0; j < O; j++) {
      mm[i][j] = 0;
      for (int k = 0; k < N; k++) {
        int x1 = m1[i][k];
        int x2 = m2[k][j];
        if (x1 | x2) {
          mm[i][j] += x1 * x2;
        }
      }
    }
  }
}

void mul_mat4(
    int** m1, int** m2, int** mm, const int M, const int N, const int O
) {
  for (int i = 0; i < M; i++) {
    for (int j = 0; j < O; j++) {
      mm[i][j] = 0;
      for (int k = 0; k < N; k++) {
        int x1 = m1[i][k];
        if (x1) {
          mm[i][j] += x1 * m2[k][j];
        }
      }
    }
  }
}

void mul_mat5(
    int** m1, int** m2, int** mm, const int M, const int N, const int O
) {
  for (int i = 0; i < M; i++) {
    for (int j = 0; j < O; j++) {
      mm[i][j] = 0;
      for (int k = 0; k < N; k++) {
        int x1 = m1[i][k];
        int x2 = m2[k][j];
        int x3 = (x1 | x2) ? x1 * x2 : 0;
        mm[i][j] += x3;
      }
    }
  }
}

void mul_mat6(
    int** m1, int** m2, int** mm, const int M, const int N, const int O
) {
  for (int i = 0; i < M; i++) {
    for (int j = 0; j < O; j++) {
      mm[i][j] = 0;
      for (int k = 0; k < N; k++) {
        int x1 = m1[i][k];
        if (x1) {
          int x2 = m2[k][j];
          if (x2) {
            mm[i][j] += x1 * x2;
          }
        }
      }
    }
  }
}

F choose_fun(int version) {
    switch(version) {
      case 0: return &mul_mat0;
      case 1: return &mul_mat1;
      case 2: return &mul_mat2;
      case 3: return &mul_mat3;
      case 4: return &mul_mat4;
      case 5: return &mul_mat5;
      case 6: return &mul_mat6;
      default: return 0;
    }
}
