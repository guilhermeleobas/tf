#include <stdlib.h>

#define SIZE 100

struct X {
  int *A;
};

int main() {
  struct X *h;
  h = (struct X*)malloc(sizeof(struct X));
  h->A = (int*)malloc(sizeof(int) * SIZE);
  for (int i = 0; i < SIZE; i++)
    h->A[i] = 0;
  return 0;
}
