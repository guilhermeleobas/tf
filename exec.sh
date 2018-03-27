#!/bin/bash

function execute() {

  if [[ -n $TASKMINER && $TASKMINER -eq 1 ]]; then
    cmd="$TIMEOUT --signal=TERM ${RUNTIME} time ./AI_$exe_name $RUN_OPTIONS < $STDIN > $STDOUT" ;
  else
    cmd="$TIMEOUT --signal=TERM ${RUNTIME} time ./$exe_name $RUN_OPTIONS < $STDIN > $STDOUT" ;
  fi

  echo "$cmd"
  echo "cd $(pwd) && $cmd" >> $BASEDIR/run.txt ;
  
}
