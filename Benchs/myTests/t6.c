int *a;
int *b;
int *c;
int *d;

void foo(int i) {
  a[0] = i;
  b[0] = i + i;
  c[0] = i + 2;
  d[0] = 0;
};

int main(int argc, char** argv) {
  int x0 = 0, x1 = 0, x2 = 0, x3 = 0;
  a = &x0;
  b = &x1;
  c = &x2;
  d = &x3;
  foo(argc);
}
