#!/bin/bash

# this is left as an example 
function compile() {
  
  # generate llvm ir for the instrumented code
  # $LLVM_PATH/clang -Xclang -disable-O0-optnone $PHOENIX_PATH/Collect/collect.c -S -c -emit-llvm -o $PHOENIX_PATH/Collect/collect.bc
  
  pass_path=( $(find $PHOENIX_PATH/build -name $PASS.$suffix) )
  
  if [[ -n $CPU2006 && $CPU2006 -eq 1 ]]; then
    # Convert the program to SSA form:
    $LLVM_PATH/opt -O2 -disable-loop-vectorization -disable-slp-vectorization \
      -mem2reg -early-cse -sink -simplifycfg \
      -load $pass_path -$PASS -S $rbc_name -o $prf_name ;
    
    #Generate all the bcs into a big bc:
    # $LLVM_PATH/llvm-link -S $prf_name $PHOENIX_PATH/Collect/collect.bc -o $prf_name ;
    
    # optimize prf ll
    # $LLVM_PATH/opt -O3 -S $prf_name -o $prf_name
    
    # Compile our file, in IR format, to x86:
    $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name ;
    # Compile everything now, producing a final executable file:
    $LLVM_PATH/$COMPILER -lm $obj_name -o INS_$exe_name ;
    
    return
  fi
  
  # source_files is the variable with all the files we're gonna compile
  parallel --tty --jobs=${JOBS} $LLVM_PATH/$COMPILER $COMPILE_FLAGS \
    -Xclang -disable-O0-optnone \
    -fno-vectorize -fno-slp-vectorize -fno-tree-vectorize \
    -S -g -c -emit-llvm {} -o {.}.bc ::: "${source_files[@]}" 
  
  parallel --tty --jobs=${JOBS} $LLVM_PATH/opt -S -mem2reg {.}.bc -o {.}.rbc ::: "${source_files[@]}"
  
  #Generate all the bcs into a big bc:
  $LLVM_PATH/llvm-link -S *.rbc -o $lnk_name

  $LLVM_PATH/opt -S -disable-loop-vectorization -disable-slp-vectorization -O2 \
   -mem2reg -instcombine -early-cse $lnk_name -o $lnk_name

  # Optmize 
  $LLVM_PATH/opt -S \
    -load $pass_path -debug-only=Optimize -$PASS -verify $lnk_name -o $prf_name

  # merge the previous bc with instrumentation lib
  # $LLVM_PATH/llvm-link -S $prf_name $PHOENIX_PATH/Collect/collect.bc -o $prf_name
  
  # Optimize
  # $LLVM_PATH/opt -O3 -S $prf_name -o $prf_name
    
  # Compile our instrumented file, in IR format, to x86:
  $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name ;
  # Compile everything now, producing a final executable file:
  $LLVM_PATH/$COMPILER -lm $obj_name -o INS_$exe_name ;
}
