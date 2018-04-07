#include <omp.h>
#ifndef taskminerutils
#define taskminerutils
static int taskminer_depth_cutoff = 0;
#define DEPTH_CUTOFF omp_get_num_threads()
extern char cutoff_test;
#endif
#include "types.h"

int dummy(TYPE a[LEN], TYPE b[LEN], TYPE c[LEN], TYPE d[LEN], TYPE e[LEN], TYPE aa[LEN2][LEN2], TYPE bb[LEN2][LEN2], TYPE cc[LEN2][LEN2], TYPE s){
	// --  called in each loop to make all computations appear required
	return 0;
}


