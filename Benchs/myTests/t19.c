#include <stdlib.h>

int* a;
int b;

int* get_mem() {
  return &b;
}

void update(int* p, int i, int v) {
  p[i] = v;
}

int main(int argc, char** argv) {
  int *p0 = (int*)malloc(10 * sizeof(int));
  int *p1 = get_mem();

  a = (int*)malloc(10 * sizeof(int));

  int* p2 = a;
  int* p3 = p0;

  update(p0, 2, argc);
  update(a, 2, argc);

  a[1] = 13;
  b = argc;
  p0[1] = 17;
  p1[0] = 19;
  p2[0] = 23;
  p3[0] = 29;
  *p2 = 31;
}
