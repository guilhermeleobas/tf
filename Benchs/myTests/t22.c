int sum(int x, int y) {
  while (x > 0) {
    x--;
    y++;
  }
  return y;
}

int (*fptr)(int,int);

int main(int argc, char ** argv) {
  fptr = &sum;
  return fptr(argc - 17, argc + 13);
}
