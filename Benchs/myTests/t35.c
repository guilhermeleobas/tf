#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv) {
  int *v = (int*)malloc(argc * sizeof(int));
  int *w = (int*)malloc(argc * sizeof(int));
  int *x = (int*)malloc(argc * sizeof(int));

  for (int i = 0; i < argc; i++) {
    v[i] = 0;
    w[i] = 0;
    x[i] = 0;
  }

  for (int i = 0; i < argc; i++) {
    v[i] += w[i]*x[i];
    v[i] *= w[i]+x[i];
    w[i] += argc;
    x[i] = -w[i];
  }

  for (int i = 0; i < argc; i++) {
    v[i]++;
    w[i] = 1 + v[i];
    w[i] = !w[i];
    x[i] = i + 1;
    x[i] = ~x[i];
  }
}
