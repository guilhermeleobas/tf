int a;

int main(int argc, char** argv) {
  int x = 1;
  int y = 42;
  while (x < argc) {
    x += 1;
  }
  int z0 = argc % 2 ? x : y;
  a = z0;
  int z1 = argc / 2 > 1 ? a : y;
  a += z1;
  return z0 + z1;
}
