bnc_name="hmmer" ;

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
RUN_OPTIONS=" --fixed 0 --mean 425 --num 85000 --sd 300 --seed 0 ../data/train/input/leng100.hmm " ;
