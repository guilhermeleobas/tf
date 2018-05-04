int a;

int main(int argc, char** argv) {
  int x = 13;
  int y = 42;
  while (x < argc * argc) {
    x = (x * 17) % 31;
  }
  int z0 = argc % 2 ? x : y;
  a = z0;
  return z0;
}
