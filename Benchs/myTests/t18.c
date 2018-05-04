#include <stdlib.h>

int* a;
int b;

void update(int* p, int i, int v) {
  p[i] = v;
}

int main(int argc, char** argv) {
  int *p0 = (int*)malloc(10 * sizeof(int));

  a = (int*)malloc(10 * sizeof(int));

  update(p0, 2, argc);
  update(a, 2, argc);

  a[1] = 13;
  b = argc;
  p0[1] = 17;
}
