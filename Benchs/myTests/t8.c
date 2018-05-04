#include <stdlib.h>

int get_num(int n) {
  return n * n % 1007;
}

int a[4];

void foo(int i) {
  int* b = (int*)malloc(sizeof(int));
  a[0] = get_num(i);
  a[1] = b[0] + b[0];
  a[2] = b[0] + 1;
  a[3] = i * i;
}

int main(int argc, char** argv) {
  foo(argc);
}
