#include <stdlib.h>

int a;    // global var
int *b;   // global pointer
int g[2]; // global var with offset

int main(int argc, char** argv) {
  static int h = 0;
  int c[1];
  int d;
  int *e = &d;
  int *f = (int*)malloc(sizeof(int));

  // Assignments;
  a = 3;
  c[0] = 5;
  d = 7;
  *e = 11;
  b = e;
  *b = 13;
  *f = 17;
  *c = 19;
  g[0] = 23;
  g[argc] = 29;
  h = 31;
}
