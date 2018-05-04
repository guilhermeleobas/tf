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
  export PROFPATH="/Users/fernando/Programs/C/faun/src/ProfLib"
  export LLVMPATH="/Users/fernando/Programs/llvm38/build/bin"
  # Convert the target program to LLVM IR:
  $LLVMPATH/clang -c -emit-llvm $file_name -o $btc_name ;
  # Convert the target IR program to SSA form:
  echo "Converting program to SSA form:"
  # $LLVMPATH/opt -O1 $btc_name -o $rbc_name ;
  $LLVMPATH/opt -mem2reg -instnamer $btc_name -o $rbc_name ;
  # Run modifier analysis in the program:
  echo "Extracting features:"
  $LLVMPATH/opt -debug-only=CFGPropAnalysis -load DCC888.dylib \
    -cfgPropAnalysis $rbc_name -stats -disable-output --debug-pass=Structure ;
  # Remove intermediates
  rm -rf $btc_name ;
  # rm -rf $rbc_name ;
  # Show the file that we have processed:
  echo "This is the file just processed: =====================================";
  cat $file_name;
fi
