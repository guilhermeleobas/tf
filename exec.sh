#!/bin/bash

function execute() {
  
  exe=$exe_name ;

  if [[ -n $INSTRUMENT && $INSTRUMENT -eq 1 ]]; then
    exe=INS_$exe_name ;
  fi
  
  if [[ -n $SANITIZE && $SANITIZE -eq 1 ]]; then
    exe=SAN_$exe_name ;
  fi

  cmd="$TIMEOUT --signal=TERM ${RUNTIME} ./$exe $RUN_OPTIONS < $STDIN > $STDOUT" ;

  echo "$cmd"
  
  if [[ -n $SANITIZE && $SANITIZE -eq 1 ]]; then
    echo "cd $(pwd) && ASAN_OPTIONS=halt_on_error=0 $cmd" >> $BASEDIR/run.txt ;
  else
    echo "cd $(pwd) && $cmd" >> $BASEDIR/run.txt ;
  fi
}
