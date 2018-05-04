int a;

int main(int argc, char** argv) {
  int i = 0;
  while (i < argc) {
    a += i;
    i++;
    a *= i;
  }
  return a;
}
