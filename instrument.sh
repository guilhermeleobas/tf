#!/bin/bash

# this is left as an example 
function compile() {

  # source_files is the variable with all the files we're gonna compile

  for file_name in "${source_files[@]}"; do
    base_name=$(basename $file_name .c) ;
    btc_name="$base_name.bc" ;
    rbc_name="$base_name.rbc" ;
    # Convert the target program to LLVM IR:
    $LLVM_PATH/$COMPILER $CXXFLAGS -g -c -emit-llvm $file_name -o $btc_name ;
    # Convert the target IR program to SSA form:
    $LLVM_PATH/opt $btc_name -o $rbc_name ;

    # You can add llvm pass in the command above:
    # $LLVM_PATH/opt -mem2reg -instnamer -load DCC888.$suffix -vssa $btc_name -o $rbc_name ;
  done

  #Generate all the bcs into a big bc:
  $LLVM_PATH/llvm-link *.rbc -o $lnk_name ;

  # Insert instrumentation in the program:
  $LLVM_PATH/opt -debug-only=StoreTagger -instcount -load DCC888.$suffix -ssProf \
    $lnk_name -o $prf_name 2> /dev/null ;
    
  # Compile our instrumented file, in IR format, to x86:
  $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name ;
  # Compile everything now, producing a final executable file:
  $LLVM_PATH/$COMPILER -lm $obj_name $PROF_PATH/store_data_collector.o -o $exe_name ;
}