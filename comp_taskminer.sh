#!/bin/bash

# function compile() {
#
#   # source_files is the variable with all the files we're gonna compile
#
#   files=$(ls -d *_AI.c)
#   cmd="gcc-6 -lm -fopenmp  $files  -o $exe_name" ;
#   eval $cmd ;
#
#   if [[ $? -ne 0 ]]; then
#     report="Benchmark $(pwd) broke during compilation phrase. Jumping to next benchmarks"
#     echo $report
#     echo $report >> report.txt
#     return 1 ;
#   else
#     echo "Benchmark $(pwd) compiled."
#     echo "Benchmark $(pwd) compiled." >> report.txt
#     return 0 ;
#   fi
#
# }

function compile() {

  # source_files is the variable with all the files we're gonna compile

  source_files=($(ls -d *_AI.c))
  for file_name in "${source_files[@]}"; do
    base_name=$(basename $file_name .c) ;
    btc_name="$base_name.bc" ;
    rbc_name="$base_name.rbc" ;
    # Convert the target program to LLVM IR:
    $LLVM_PATH/$COMPILER $CXXFLAGS -I $HOME/Programs/llvm38/build-omp/projects/openmp/runtime/src/ -lm -fopenmp -g -c -emit-llvm $file_name -o $btc_name ;
    # Convert the target IR program to SSA form:
    $LLVM_PATH/opt $btc_name -o $rbc_name ;
  done

  #Generate all the bcs into a big bc:
  $LLVM_PATH/llvm-link *.rbc -o $lnk_name ;

  $LLVM_PATH/opt $lnk_name -o $prf_name ;
  
  # Compile our instrumented file, in IR format, to x86:
  $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name ;
  $LLVM_PATH/$COMPILER -fopenmp -lm $obj_name -o AI_$exe_name ;

}
