int gi0 = 0;

int *gpi0;

int gpi1[4];

struct X {
  int a;
  double b;
};

struct X gst0;

struct X *gps0;

struct X gps1[4];

int main(int argc, char** argv) { // At -1, do argc.addr = argc
  struct X lst0;
  int lpi0[4] = {0, 1, 2, 3};
  int *lpi1 = &argc;

  // Store in local structure:
  lst0.a = argc;     // 24
  lst0.b = 3.0;      // 25

  // Store in local array of integers:
  lpi0[0] = 5;       // 28

  // Store in local pointer to integer:
  *lpi1 = 7;         // 31

  // Store in global integer:
  gi0 = 11;          // 34

  // Store in global pointer to integer:
  gpi0 = &argc;      // 37
  *gpi0 = 13;        // 38

  // Store in global array of integers:
  gpi1[argc] = 17;   // 41

  // Store in global struct:
  gst0.a = 19;       // 44

  // Store in global pointer to struct:
  gps0 = &lst0;      // 47
  gps0->a = 23;      // 48

  // Store in global array of struct:
  gps1[argc].a = 29; // 51

  return 0;
}

/**
 * Pointer origin:
 * STATIC = 0    UNK_ARGM = 3
 * STACK  = 1    UNK_LOAD = 4
 * HEAP   = 2    UNK_FUNC = 5
 *               UNK_PHIN = 6
 */
