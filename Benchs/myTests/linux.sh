#!/bin/bash

# This script instruments and runs a C program. This program must contain the
# main function, otherwise the linker will not produce an executable.

if [ $# -lt 1 ]
then
  echo Syntax: comp file.c
  exit 1
else
  file_name=$1
  base_name=$(basename $file_name .c)
  btc_name="$base_name.bc"
  rbc_name="$base_name.rbc"
  prf_name="$base_name.ibc"
  obj_name="$base_name.o"
  exe_name="$base_name.exe"
  export PROFPATH="/home/guilhermel/Programs/C/faun/src/ProfLib"
  export LLVMPATH="/home/guilhermel/Programs/llvm38/build/bin"
  # Convert the target program to LLVM IR:
  $LLVMPATH/clang -c -g -emit-llvm $file_name -o $btc_name ;
  # Convert the target IR program to SSA form:
  echo "Converting program to SSA form:"
  # $LLVMPATH/opt -O1 $btc_name -o $rbc_name ;
  $LLVMPATH/opt -mem2reg -instnamer $btc_name -o $rbc_name ;
  # Insert instrumentation in the program:
  echo "Extracting features:"
  $LLVMPATH/opt -debug-only=PointerTracker -debug-only=StoreTagger -instcount \
    -load DCC888.so -ssProf $rbc_name -o $prf_name -stats \
    --debug-pass=Structure ;
  # Compile our instrumented file, in IR format, to x86:
  echo "Producing object file:"
  $LLVMPATH/llc -filetype=obj $prf_name -o $obj_name ;
  # Compile everything now, producing a final executable file:
  $LLVMPATH/clang $obj_name $PROFPATH/store_data_collector.o -o $exe_name ;
  # initialize the file that will keep the profiling information:
  $PROFPATH/init_prof_data.exe
  # Run the executable file:
  time ./$exe_name ;
  # show profiling results:
  $PROFPATH/read_prof_data.exe
  # Remove intermediates
  rm -rf $btc_name ;
  # rm -rf $rbc_name ;
  rm -rf $prf_name ;
  rm -rf $obj_name ;
  rm -rf $exe_name ;
  # Show the file that we have processed:
  echo "This is the file just processed: =====================================";
  cat $file_name;
  # Show profiling results:
  echo "This is the result of profiling: =====================================";
  cat table.csv
fi
