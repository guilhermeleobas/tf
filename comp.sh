#!/bin/bash

function compile() {

  if [[ -n $CPU2006 && $CPU2006 -eq 1 ]]; then
    # Convert the program to SSA form:
    $LLVM_PATH/opt -mem2reg $lnk_name -o $rbc_name ;
    $LLVM_PATH/opt $rbc_name -o $prf_name ;
    # Compile our file, in IR format, to x86:
    $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name ;
    # Compile everything now, producing a final executable file:
    $LLVM_PATH/$COMPILER -g -lm $obj_name -o $exe_name ;
    
    return
  fi
  
  # source_files is the variable with all the files we're gonna compile
  parallel --tty --jobs=${JOBS} $LLVM_PATH/$COMPILER $COMPILE_FLAGS -Xclang -disable-O0-optnone -g -S -c -emit-llvm {} -o {.}.bc ::: "${source_files[@]}" ;
  parallel --tty --jobs=${JOBS} $LLVM_PATH/opt -S -mem2reg {.}.bc -o {.}.rbc ::: "${source_files[@]}" ;

  
  #Generate all the bcs into a big bc:
  $LLVM_PATH/llvm-link -S *.rbc -o $lnk_name ;

  $LLVM_PATH/opt -S -disable-loop-vectorization -disable-slp-vectorization -O2 $lnk_name -o $prf_name ;
  
  # Compile our instrumented file, in IR format, to x86:
  $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name ;
  $LLVM_PATH/$COMPILER $COMPILE_FLAGS -lm $obj_name -o $exe_name ;

}
