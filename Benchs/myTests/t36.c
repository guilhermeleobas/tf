int main(int argc, char** argv) {
  int v[7];
  v[0] = argc < 1;
  v[1] = 2;
  v[3] = argv[0][0];
  v[4] = (short)argc;
  v[5] = argc;
  v[6] = (long)argc;
}
