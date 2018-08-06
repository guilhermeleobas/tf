#!/bin/bash

# this is left as an example 
function compile() {

  if [[ -n $CPU2006 && $CPU2006 -eq 1 ]]; then
    # Convert the program to SSA form:
    $LLVM_PATH/opt -debug-only=StoreTagger -instcount -load DCC888.${suffix} -ssProf \
      $lnk_name -o $prf_name 2> /dev/null ;
    # Compile our file, in IR format, to x86:
    $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name ;
    # Compile everything now, producing a final executable file:
    $LLVM_PATH/$COMPILER -lm $obj_name $PROF_PATH/store_data_collector.o -o INS_$exe_name ;
    
    return
  fi

  # source_files is the variable with all the files we're gonna compile
  parallel --tty --jobs=${JOBS} $LLVM_PATH/$COMPILER $CXXFLAGS -S -g -c -emit-llvm {} -o {.}.bc ::: "${source_files[@]}" ;
  parallel --tty --jobs=${JOBS} $LLVM_PATH/opt -S -mem2reg {.}.bc -o {.}.rbc ::: "${source_files[@]}" ;

  #Generate all the bcs into a big bc:
  $LLVM_PATH/llvm-link -S *.rbc -o $lnk_name ;

  # Insert instrumentation in the program:
  $LLVM_PATH/opt -debug-only=StoreTagger -instcount -load DCC888.$suffix -ssProf \
    $lnk_name -o $prf_name 2> /dev/null ;
    
  # Compile our instrumented file, in IR format, to x86:
  $LLVM_PATH/llc -filetype=obj $prf_name -o $obj_name ;
  # Compile everything now, producing a final executable file:
  $LLVM_PATH/$COMPILER -lm $obj_name $PROF_PATH/store_data_collector.o -o INS_$exe_name ;
}
