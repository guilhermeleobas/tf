#!/bin/bash

function execute_and_read() {

  cmd="$TIMEOUT --signal=TERM ${RUNTIME} time ./$exe_name $RUN_OPTIONS < $STDIN > $STDOUT" ;

  echo "$cmd"
  echo "cd $(pwd) && $cmd" >> $BASEDIR/run.txt ;
  
}