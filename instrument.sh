#!/bin/bash

# this is left as an example 
function compile() {

  if [[ -n $CPU2006 && $CPU2006 -eq 1 ]]; then
    # Convert the program to SSA form:
    $LLVM_PATH/opt -mem2reg -load $pass_path -$PASS -S $rbc_name -o $prf_name

    # Compile our file, in IR format, to x86:
    $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name
    # Compile everything now, producing a final executable file:
    $LLVM_PATH/$COMPILER -lm $obj_name -o $exe_name
    
    return
  fi

  # source_files is the variable with all the files we're gonna compile
  parallel --tty --jobs=${JOBS} $LLVM_PATH/$COMPILER $COMPILE_FLAGS \
    -Xclang -disable-O0-optnone \
    -S -c -emit-llvm {} -o {.}.bc ::: "${source_files[@]}" 
  
  parallel --tty --jobs=${JOBS} $LLVM_PATH/opt -S {.}.bc -o {.}.rbc ::: "${source_files[@]}"

  #Generate all the bcs into a big bc:
  $LLVM_PATH/llvm-link -S *.rbc -o $lnk_name

  # Optmize 
  if [[ $SSA -eq 1 ]]; then
    $LLVM_PATH/opt -S -mem2reg -load $pass_path -$PASS -verify $lnk_name -o $prf_name
  else
    $LLVM_PATH/opt -S -load $pass_path -$PASS -verify $lnk_name -o $prf_name
  fi

  # Compile our instrumented file, in IR format, to x86:
  $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name
  # Compile everything now, producing a final executable file:
  $LLVM_PATH/$COMPILER -lm $obj_name -o $exe_name
}
