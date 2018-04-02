#!/bin/bash

function execute() {

  if [[ -n $TASKMINER && $TASKMINER -eq 1 ]]; then
    exe_name="AI_"$exe_name ;
  fi

  cmd="$TIMEOUT --signal=TERM ${RUNTIME} ./$exe_name $RUN_OPTIONS < $STDIN > $STDOUT" ;

  if [[ -f $exe_name ]]; then
    echo "$cmd"
    echo "cd $(pwd) && $cmd" >> $BASEDIR/run.txt ;
  else
    echo "skipping $exe_name   - FILE NOT EXISTS"
  fi
  
}
