bnc_name="smg2000" ;
lnk_name="$bnc_name.rbc" ;
prf_name="$bnc_name.ibc" ;
obj_name="$bnc_name.o" ;
exe_name="$bnc_name.exe" ;

source_files=($(ls *.c)) ;
if [[ -n $LARGE_PROBLEM_SIZE ]]; then
  RUN_OPTIONS=" 6000 100000 " ;
else
  RUN_OPTIONS=" 1500 100000 " ;
fi
