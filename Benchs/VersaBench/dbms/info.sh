bnc_name="$(basename $(pwd))" ;
lnk_name="$bnc_name.rbc" ;
prf_name="$bnc_name.ibc" ;
obj_name="$bnc_name.o" ;
exe_name="$bnc_name.exe" ;

source_files=($(ls *.c)) ;
CXXFLAGS="" ;

PROJ_SRC_DIR=$(pwd) ;
if [[ -n $SMALL_PROBLEM_SIZE ]]; then
  RUN_OPTIONS="-i ${PROJ_SRC_DIR}/dbms.train.in" ;
else
  RUN_OPTIONS="-i ${PROJ_SRC_DIR}/dbms.ref.in" ;
fi
