bnc_name="lbm" ;

file_suffix="llvm"
if [ $(uname -s) == "Linux" ]; then
  file_suffix="linux" ;
fi

lnk_name="$bnc_name.${file_suffix}" ;
rbc_name="$bnc_name.rbc" ;
prf_name="$bnc_name.ibc" ;
obj_name="$bnc_name.o" ;
exe_name="$bnc_name.exe" ;

# source_files=($(ls *.c)) ;
# CXXFLAGS=" -lm " ;
RUN_OPTIONS=" 20 reference.dat 0 1 ../data/test/input/100_100_130_cf_a.of " ;
