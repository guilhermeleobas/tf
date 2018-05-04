#include <stdlib.h>

struct S {
  int i;
  double d;
};

typedef struct S SS;

int main(int argc, char** argv) {
  SS *v = (SS*)malloc(argc * sizeof(SS));
  SS **w = (SS**)malloc(argc * sizeof(SS*));
  SS aux = {1, 3.1415};
  for (int i = 0; i < argc; i++) {
    v[i] = aux;
    w[i] = &aux;
  }
  for (int i = 0; i < argc; i++) {
    v[i].i = i;
  }
}
