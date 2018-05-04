#include <stdlib.h>

int* height ; 
int* moves ; 
int plycnt ; 

void test() {
/* 11 */  int h, n, side;
  side = plycnt & 1;
  plycnt--;
  n = moves[plycnt];
  h = --height[n];
}

int main(int argc, char** argv) {
  height = (int*)malloc(sizeof(int) * argc);
  moves = (int*)malloc(sizeof(int) * argc);
/* 28 */  test();
}
