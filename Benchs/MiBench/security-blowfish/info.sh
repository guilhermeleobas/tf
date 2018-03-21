bnc_name="security-blowfish" ;
lnk_name="$bnc_name.rbc" ;
prf_name="$bnc_name.ibc" ;
obj_name="$bnc_name.o" ;
exe_name="$bnc_name.exe" ;

source_files=($(ls *.c)) ;
CXXFLAGS=" -lm " ;
RUN_OPTIONS=" d output_large.enc output_large.asc 1234567890abcdeffedcba0987654321 " ;
