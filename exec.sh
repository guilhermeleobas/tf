#!/bin/bash

function execute() {
  
  exe=$exe_name ;

  if [[ -n $INSTRUMENT && $INSTRUMENT -eq 1 ]]; then
    exe=INS_$exe_name ;
  fi
  
  if [[ -n $SANITIZE && $SANITIZE -eq 1 ]]; then
    exe=SAN_$exe_name ;
  fi
  
  if [[ -n $NO_SSA && $NO_SSA -eq 1 ]]; then
    exe=NO_SSA_$exe_name ;
  fi

  cmd="$TIMEOUT --signal=TERM ${RUNTIME} ./$exe $RUN_OPTIONS < $STDIN > $STDOUT" ;

  echo "$cmd"
  
  if [[ -n $SANITIZE && $SANITIZE -eq 1 ]]; then
    # echo "cd $(pwd) && SANITIZER_STATS_PATH=a.stats ASAN_OPTIONS=halt_on_error=0 $cmd" >> $BASEDIR/run.txt ;
    echo "cd $(pwd) && ASAN_SYMBOLIZER_PATH=$HOME/Programs/llvm61/build/bin/llvm-symbolizer ASAN_OPTIONS=halt_on_error=false:print_stats=true:atexit=true $cmd" >> $BASEDIR/run.txt ;
  else
    echo "cd $(pwd) && $cmd" >> $BASEDIR/run.txt ;
  fi
}
