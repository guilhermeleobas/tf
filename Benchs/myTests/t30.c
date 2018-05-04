#include <stdlib.h>

int main(int argc, char** argv) {
  int i;
  char* a = (char*)malloc(argc * sizeof(char));
  a[0] = '1';
  for (i = 0; i < argc; i++) {
    a[i] = 0;
  }
  for (i = 0; i < argc; i += 3) {
    char *c = argv[i];
    while (*c >= 0) {
      a[i]++;
      *c = *c - 1;
      if (*c == '\0') {
        break;
      } else {
        continue;
      }
    }
    if (a[i] % 2) {
      a[i] *= 2;;
    } else {
      a[i]--;
    }
  }
  i = 0;
  do {
    a[i++]++;
    if (a[i] % 2) {
      a[i] *= 2;;
    } else {
      a[i]--;
    }
  } while(i < argc);
}
