#include <stdlib.h>

#define M 17
#define N 42

int main() {
  int m[M][N];
  int i, j;
  // The entire matrix:
  for (i = 0; i < M; i++) {
    for (j = 0; j < N; j++) {
      m[i][j] = 0;
    }
  }
  // The diagonal:
  for (i = 0; i < M; i++) {
    m[i][i] = 1;
  }
  // The upper triangle:
  for (i = 0; i < M; i++) {
    for (j = i+1; j < N; j++) {
      m[i][j] = 2;
    }
  }
  // One row:
  for (j = 0; j < N; j++) {
    m[2][i] = 3;
  }
  // One column:
  for (i = 0; i < M; i++) {
    m[i][4] = 5;
  }
  // multiply by constant:
  for (i = 1; 2*i < M; i *= 2) {
    m[i][6] = 7;
  }
}
