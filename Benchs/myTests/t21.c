#include <stdlib.h>

int main(int argc, char** argv) {
  int *p0 = (int*)malloc(10 * sizeof(int));
  int a = argc + 1;
  int b = argc + 2;
  int c = a & b;
  *p0 = c;
}
