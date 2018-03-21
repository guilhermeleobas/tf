bnc_name="$(basename $(pwd))" ;
lnk_name="$bnc_name.rbc" ;
prf_name="$bnc_name.ibc" ;
obj_name="$bnc_name.o" ;
exe_name="$bnc_name.exe" ;

source_files=($(ls *.c)) ;
CXXFLAGS=" -std=gnu89 -DNOMEMOPT " ;

PROJ_SRC_DIR=$(pwd) ;
RUN_OPTIONS="-t $PROJ_SRC_DIR/INPUT/largest.espresso" ;
