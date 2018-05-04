#include <stdlib.h>

int main(int argc, char** argv) {
  int* p = (int*)malloc(argc * sizeof(int));
  int i = 0;
  while (i < argc) {
    p[i] = 0;
    i++;
  }
  i = 0;
  while (i < argc) {
    p[i] = i;
    if (i + i == i * i) {
      break;
    } else {
      i++;
    }
  }
  return i;
}
