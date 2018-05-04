#include <stdlib.h>

int a = 0;

int *b;

int main(int argc, char** argv) {
  b = (int*)malloc(sizeof(int) * argc);
  for (int i = 0; i < argc; i++) {
    a += a + i;
    b[i] = a;
  }
}
