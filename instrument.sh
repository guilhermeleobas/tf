#!/bin/bash

# this is left as an example 
function compile() {

  pass_path=( $(find $BASILISK_PATH/build -name $PASS.$suffix) )
  $LLVM_PATH/clang -Xclang -disable-O0-optnone $BASILISK_PATH/Collect/collect.c -S -c -emit-llvm -o $BASILISK_PATH/Collect/collect.bc
  
  if [[ -n $CPU2006 && $CPU2006 -eq 1 ]]; then
    if [[ $SSA -eq 1 ]]; then
      $LLVM_PATH/opt -O1 -mem2reg -load $pass_path -$PASS -S $rbc_name -o $prf_name
    else
      $LLVM_PATH/opt -O1 -load $pass_path -$PASS -S $rbc_name -o $prf_name
    fi
  else
    # source_files is the variable with all the files we're gonna compile
    parallel --tty --jobs=${JOBS} $LLVM_PATH/$COMPILER $COMPILE_FLAGS \
      -Xclang -disable-O0-optnone \
      -S -c -emit-llvm {} -o {.}.bc ::: "${source_files[@]}" 
    
    parallel --tty --jobs=${JOBS} $LLVM_PATH/opt -S {.}.bc -o {.}.rbc ::: "${source_files[@]}"

    #Generate all the bcs into a big bc:
    $LLVM_PATH/llvm-link -S *.rbc -o $lnk_name

    # Optimize 
    if [[ $SSA -eq 1 ]]; then
      $LLVM_PATH/opt -S -O1 -mem2reg -load $pass_path -$PASS -verify $lnk_name -o $prf_name
    else
      $LLVM_PATH/opt -S -O1 -load $pass_path -$PASS -verify $lnk_name -o $prf_name
    fi
  fi

  # merge the previous bc with instrumentation lib
  $LLVM_PATH/llvm-link -S $prf_name $BASILISK_PATH/Collect/collect.bc -o $prf_name
  
  # Optimize
  $LLVM_PATH/opt -O3 -S $prf_name -o $prf_name

  # Compile our instrumented file, in IR format, to x86:
  $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name
  # Compile everything now, producing a final executable file:
  $LLVM_PATH/$COMPILER -lm $obj_name -o $exe_name
}
