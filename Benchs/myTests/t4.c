#include <stdlib.h>

int main(int argc, char** argv) {
  char* a = (char*)malloc(argc * sizeof(char));
  for (int i = 0; i < argc; i++) {
    a[i] = 0;
  }
  for (int i = 0; i < argc; i++) {
    char *c = argv[i];
    while (*c >= 0) {
      a[i]++;
      *c = *c - 1;
    }
  }
}
