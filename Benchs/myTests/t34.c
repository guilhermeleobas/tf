int* getArray();

int main(int argc, char** argv) {
  int *v = getArray();
  for (int i = 0; i < argc; i++)
    v[i] = -v[i];
  return 0;
}
