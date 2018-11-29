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
    
    parallel --tty --jobs=${JOBS} $LLVM_PATH/opt -S {.}.bc -o {.}.rbc ::: "${source_files[@]}"
  
    #Generate all the bcs into a big bc:
    $LLVM_PATH/llvm-link -S *.rbc -o $lnk_name
  fi
  
  # common optimizations
  $LLVM_PATH/opt -S -mem2reg -instcombine -early-cse -instnamer $lnk_name -o $prf_name.1
  # -O3
  $LLVM_PATH/opt -S -O3 $prf_name.1 -o $prf_name.3
  # Compile our instrumented file, in IR format, to x86:
  $LLVM_PATH/llc -filetype=obj $prf_name.3 -o $obj_name ;
  # Compile everything now, producing a final executable file:
  $LLVM_PATH/$COMPILER -lm $obj_name -o $exe_name ;
  
}
