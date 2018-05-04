#include <stdlib.h>

int main(int argc, char** argv) {
  int *a0 = (int*)malloc(sizeof(int)*argc);
  int *a1 = (int*)malloc(sizeof(int)*argc);
  int *a2 = (int*)malloc(sizeof(int)*argc);
  for (int i = 0; i < argc; i++) {
    a0[i] = i;
    a1[i] += 1;
    a2[i] *= i + i;
  }
}
