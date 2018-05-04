int *a;
int *b;
int *c;

void foo(int i) {
  a[i] = 0;
  b[i+i] = 1;
  b[c[0]] = 2;
  c[0] = 0;
};

int main(int argc, char** argv) {
  int x0 = 0, x1 = 0, x2 = 0;
  a = &x0;
  b = &x1;
  c = &x2;
  foo(argc);
}
