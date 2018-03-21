bnc_name="RSBench" ;
lnk_name="$bnc_name.rbc" ;
prf_name="$bnc_name.ibc" ;
obj_name="$bnc_name.o" ;
exe_name="$bnc_name.exe" ;
source_files=($(ls *.c)) ;
CXXFLAGS=" -lm -std=gnu99 " ;
RUN_OPTIONS=" -s small -l 100000 -p 1000 -w 1000 " ;
