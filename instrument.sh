#!/bin/bash

# this is left as an example 
function compile() {
  
  # generate llvm ir for the instrumented code
  $LLVM_PATH/clang -Xclang -disable-O0-optnone $PHOENIX_PATH/Collect/collect.c -S -c -emit-llvm -o $PHOENIX_PATH/Collect/collect.bc
  
  pass_path=( $(find $PHOENIX_PATH/build -name $PASS.$suffix) )
  
  if [[ -n $CPU2006 && $CPU2006 -eq 1 ]]; then
    # rbc -> lnk
    $LLVM_PATH/opt -S $rbc_name -o $lnk_name
  else
    # source_files is the variable with all the files we're gonna compile
    parallel --tty --jobs=${JOBS} $LLVM_PATH/$COMPILER $COMPILE_FLAGS \
      -Xclang -disable-O0-optnone \
      -S -c -emit-llvm {} -o {.}.bc ::: "${source_files[@]}" 
    # -fno-vectorize -fno-slp-vectorize -fno-tree-vectorize \
    
    parallel --tty --jobs=${JOBS} $LLVM_PATH/opt -S {.}.bc -o {.}.rbc ::: "${source_files[@]}"
  
    #Generate all the bcs into a big bc:
    $LLVM_PATH/llvm-link -S *.rbc -o $lnk_name
  fi
  
  # common optimizations
  $LLVM_PATH/opt -S -mem2reg -instcombine -early-cse -instnamer $lnk_name -o $prf_name.opt.1
  # Opt
  $LLVM_PATH/opt -S ${OPT} $prf_name.opt.1 -o $prf_name.opt.2
  # my optimization
  $LLVM_PATH/opt -S -load $pass_path -$PASS -O3 $prf_name.opt.2 -o $prf_name.opt.3
  
  if [[ $PASS = "CountArith" ]]; then
    # Compile our instrumented file, in IR format, to x86:
    $LLVM_PATH/llvm-link -S $prf_name.opt.3 $PHOENIX_PATH/Collect/collect.bc -o $obj_name.opt ;
    $LLVM_PATH/llc -filetype=obj $obj_name.opt -o $obj_name.opt ;
  else
    $LLVM_PATH/llc -filetype=obj $prf_name.opt.3 -o $obj_name.opt ;
  fi
  
  # Compile everything now, producing a final executable file:
  $LLVM_PATH/$COMPILER -lm $obj_name.opt -o INS_$exe_name ;
}
