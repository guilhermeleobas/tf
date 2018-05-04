char g0 = 'a';
char* g1 = "hi!";
#define G2 34;

int main() {
  char* a[2];
  a[0] = g1;
  a[1] = "hi!";
  char b0 = 0;
  char *b1 = &b0;
  *b1 = g0;
  b1[0] = g0;
  *b1 = G2;
}
