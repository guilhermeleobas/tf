#include <stdlib.h>

int* a;

void foo(int i) {
  a[0] = i;
  a[1] = i * i;
  a[2] = i ^ i;
  a[3] = i - a[2];
}

int main(int argc, char** argv) {
  a = (int*)malloc(10 * sizeof(int));
  foo(argc);
  foo(argc);
}
