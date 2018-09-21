#!/bin/bash

# this is left as an example 
function compile() {

  if [[ -n $CPU2006 && $CPU2006 -eq 1 ]]; then
    # Convert the program to SSA form:
    $LLVM_PATH/opt -mem2reg -load $PHOENIX_PATH/build/Count/Count.$suffix -Count -S $lnk_name -o $rbc_name ;
    $LLVM_PATH/opt $rbc_name -S -o $prf_name ;
    # Compile our file, in IR format, to x86:
    $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name ;
    # Compile everything now, producing a final executable file:
    $LLVM_PATH/$COMPILER -lm -L $PHOENIX_PATH/build/Collect/ -l collect $obj_name -o INS_$exe_name ;
    
    return
  fi

  # source_files is the variable with all the files we're gonna compile
  parallel --tty --jobs=${JOBS} $LLVM_PATH/$COMPILER $CXXFLAGS -Xclang -disable-O0-optnone -S -c -emit-llvm {} -o {.}.bc ::: "${source_files[@]}" ;
  # -debug-only=Count
  # parallel --tty --jobs=${JOBS} $LLVM_PATH/opt -mem2reg -S -load $PHOENIX_PATH/build/Count/Count.$suffix -Count {.}.bc -o {.}.rbc ::: "${source_files[@]}" ;
  parallel --tty --jobs=${JOBS} $LLVM_PATH/opt -mem2reg -S {.}.bc -o {.}.rbc ::: "${source_files[@]}" ;
  
  #Generate all the bcs into a big bc:
  $LLVM_PATH/llvm-link -S *.rbc -o $lnk_name ;

  # Insert instrumentation in the program:
  $LLVM_PATH/opt -load $PHOENIX_PATH/build/Count/Count.$suffix -Count $lnk_name -o $prf_name ;
    
  # Compile our instrumented file, in IR format, to x86:
  $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name ;
  # Compile everything now, producing a final executable file:
  $LLVM_PATH/$COMPILER -lm -L $PHOENIX_PATH/build/Collect -l Collect $obj_name -o INS_$exe_name ;
}
