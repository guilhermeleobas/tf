bnc_name="smg2000" ;
lnk_name="$bnc_name.rbc" ;
prf_name="$bnc_name.ibc" ;
obj_name="$bnc_name.o" ;
exe_name="$bnc_name.exe" ;

source_files=($(ls *.c)) ;
CXXFLAGS=" -I. -lm -D_POSIX_SOURCE -DHYPRE_TIMING -DHYPRE_SEQUENTIAL" ;

if [[ -n $LARGE_PROBLEM_SIZE ]]; then
  RUN_OPTIONS=" -n 100 40 100 -c 0.1 1.0 10.0 " ;
else
  RUN_OPTIONS=" -n 30 15 30 -c 0.1 1.0 10.0 " ;
fi
