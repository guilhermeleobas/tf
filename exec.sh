#!/bin/bash

function execute() {
  
  # Let's dump the command to init the profiler to a file called init.txt
  echo "cd $(pwd) && $PROF_PATH/init_prof_data.exe " >> $BASEDIR/init.txt ; 

  cmd="$TIMEOUT --signal=TERM ${RUNTIME} time ./$exe_name $RUN_OPTIONS < $STDIN > $STDOUT" ;

  echo "$cmd"
  echo "cd $(pwd) && $cmd" >> $BASEDIR/run.txt ;
  
  # Let's dump the command to read the profiler data to a file called read.txt
  echo "cd $(pwd) && $PROF_PATH/read_prof_data.exe " >> $BASEDIR/read.txt ;
}
