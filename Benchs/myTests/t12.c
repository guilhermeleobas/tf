int** c;

int main() {
  int a[] = {1, 2, 3};
  int *b;
  c = &b;
  *c = a;
}
