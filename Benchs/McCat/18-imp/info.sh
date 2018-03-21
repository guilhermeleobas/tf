bnc_name="$(basename $(pwd))" ;
lnk_name="$bnc_name.rbc" ;
prf_name="$bnc_name.ibc" ;
obj_name="$bnc_name.o" ;
exe_name="$bnc_name.exe" ;

source_files=("L_canny.c" "main.c" "pgm.c" "textloc.c") ;
CXXFLAGS=" -lm " ;
RUN_OPTIONS=" sg01.imp "