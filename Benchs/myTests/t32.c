#include <stdlib.h>

#define M 17
#define N 42

int main(int argc, char** argv) {
  int sum = 0;
  int *x = &sum;
  int* sums = (int*)malloc(argc * sizeof(int));
  char* chars = malloc(argc);
  for (int i = 0; i < argc; i++) {
    chars[i] = argv[i][0];
    for (int j = 0; argv[i][j] != '\0'; j++) {
      sum++;
      sums[i] = sum;
    }
    sums[i] = sum;
  }
  return sum;
}
