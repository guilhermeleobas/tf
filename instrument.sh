#!/bin/bash

# this is left as an example 
function compile() {
  
  # generate llvm ir for the instrumented code
  $LLVM_PATH/clang -Xclang -disable-O0-optnone $PHOENIX_PATH/Collect/collect.c -S -c -emit-llvm -o $PHOENIX_PATH/Collect/collect.bc 
  
  pass_path=( $(find $PHOENIX_PATH/build -name $PASS.$suffix) )
  
  if [[ -n $CPU2006 && $CPU2006 -eq 1 ]]; then
    # Convert the program to SSA form:
    $LLVM_PATH/opt -O2 -mem2reg -load $pass_path -$PASS -S $lnk_name -o $rbc_name ;
    $LLVM_PATH/opt $rbc_name -S -o $prf_name ;
    
    #Generate all the bcs into a big bc:
    $LLVM_PATH/llvm-link -S $prf_name $PHOENIX_PATH/Collect/collect.bc -o $prf_name ;
    
    # optimize prf ll
    $LLVM_PATH/opt -O3 -S $prf_name -o $prf_name
    
    # Compile our file, in IR format, to x86:
    $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name ;
    # Compile everything now, producing a final executable file:
    $LLVM_PATH/$COMPILER -lm -flto=thin -O3 $obj_name -o INS_$exe_name ;
    # $LLVM_PATH/$COMPILER -lm -L $PHOENIX_PATH/build/Collect/ -l collect $obj_name -o INS_$exe_name ;
    
    return
  fi
  
  # source_files is the variable with all the files we're gonna compile
  parallel --tty --jobs=${JOBS} $LLVM_PATH/$COMPILER $CXXFLAGS -Xclang -disable-O0-optnone -fno-vectorize -S -c -emit-llvm {} -o {.}.bc ::: "${source_files[@]}" ;
  # -debug-only=Count
  parallel --tty --jobs=${JOBS} $LLVM_PATH/opt -S {.}.bc -o {.}.rbc ::: "${source_files[@]}" ;
  
  #Generate all the bcs into a big bc:
  $LLVM_PATH/llvm-link -S *.rbc -o $lnk_name ;

  # Optmize 
  $LLVM_PATH/opt -S -O2 $lnk_name -o $lnk_name ; 

  # Run llvm pass in the big bc:
  $LLVM_PATH/opt -S -mem2reg -load $pass_path -$PASS $lnk_name -o $prf_name ;
  
  # merge the previous bc with instrumentation lib
  $LLVM_PATH/llvm-link -S $prf_name $PHOENIX_PATH/Collect/collect.bc -o $prf_name ;
  
  # Optimize
  $LLVM_PATH/opt -O3 -S $prf_name -o $prf_name
    
  # Compile our instrumented file, in IR format, to x86:
  $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name ;
  # Compile everything now, producing a final executable file:
  $LLVM_PATH/$COMPILER -lm -flto=thin -O3 $obj_name -o INS_$exe_name ;
  # $LLVM_PATH/$COMPILER -flto=thin -O3 -lm -L $PHOENIX_PATH/build/Collect -l Collect $obj_name -o INS_$exe_name ;
}
