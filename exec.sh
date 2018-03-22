#!/bin/bash

function execute() {

  cmd="$TIMEOUT --signal=TERM ${RUNTIME} time ./$exe_name $RUN_OPTIONS < $STDIN > $STDOUT" ;

  echo "$cmd"
  echo "cd $(pwd) && $cmd" >> $BASEDIR/run.txt ;
  
}