int a[4];
int *b;

void foo(int i) {
  a[0] = b[0];
  a[1] = b[0] + b[0];
  a[2] = b[0] + 1;
  a[3] = i * i;
}

int main(int argc, char** argv) {
  int x = 0;
  b = &x;
  foo(argc);
}
