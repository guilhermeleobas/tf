int main(int argc, char** argv) {
  int v[7];
  int i = argc < 1;
  int j = 0;
  if (i < 10) {
    j++;
    v[0] = i;
    v[1] = i + 2;
    v[3] = argv[0][0];
    v[4] = (short)argc;
    v[5] = argc;
  }
  v[6] = j;
}
