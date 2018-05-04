int inc(const int x) {
  return x + 1;
}

int g = 314;

int main(int argc, char** argv) {
  int N = argc;
  int a0[N];
  int a1[N];
  int a2[N];
  int a3[N];
  int a4[N];
  int a5[N];
  int a6[N];
  int a7[N];
  int a8[N];
  int a9[N];
  for (int i = 1; i < N; i++) {
    a0[i] = inc(i) ^ 3;
    a1[i] = inc(i) * i;
    a2[i] = inc(i) - argc;
    a3[i] = inc(i) * inc(i);
    a4[i] = inc(i) * inc(i);
    a5[i] = inc(i) + a2[i - 1];
    a6[i] = inc(i) + g;
    a7[i] = g + argc & 0xFF;
    a8[i] = g;
    a9[i] = a8[i];
    a8[i] = inc(a8[i]);
  }
}
