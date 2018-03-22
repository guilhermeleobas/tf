#!/bin/bash

function execute() {

  cmd="$TIMEOUT --signal=TERM ${RUNTIME} time \
       $PIN_PATH/pin -t $PIN_LIB/obj-intel64/MyPinTool.${suffix} \
       $PIN_FLAGS \
       -- ./$exe_name $RUN_OPTIONS < $STDIN > $STDOUT" ;

  echo "$cmd"
  echo "cd $(pwd) && $cmd" >> $BASEDIR/run.txt ;
  
}