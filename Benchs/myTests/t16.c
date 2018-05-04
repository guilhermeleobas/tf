#include <stdlib.h>

int main(int argc, char** argv) {
  int *a0 = (int*)malloc(sizeof(int)*argc);
  int *a1 = (int*)malloc(sizeof(int)*argc);
  int *a2 = (int*)malloc(sizeof(int)*argc);
  int *a3 = (int*)malloc(sizeof(int)*argc);
  char *c0 = (char*)malloc(sizeof(char)*argc);
  for (int i = 0; i < argc; i++) {
    a0[i] = (char)i;
    a1[i] += 1;
    a2[i] *= i + i;
    a3[i] = 'a';
    c0[i] = i;
  }
}
