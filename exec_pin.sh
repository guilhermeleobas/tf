#!/bin/bash

function execute() {
  
  # Let's dump the command to init the profiler to a file called init.txt
  echo "cd $(pwd) && $PROF_PATH/init_prof_data.exe " >> $BASEDIR/init.txt ; 

  exe=$exe_name ;

  if [[ -n $INSTRUMENT && $INSTRUMENT -eq 1 ]]; then
    exe=INS_$exe_name ;
  fi

  cmd="$TIMEOUT --signal=TERM ${RUNTIME} \
       $PIN_PATH/pin -t $PIN_LIB/obj-intel64/MyPinTool.${suffix} \
       $PIN_FLAGS \
       -- ./$exe $RUN_OPTIONS < $STDIN > $STDOUT" ;

  echo "$cmd"
  echo "cd $(pwd) && $cmd" >> $BASEDIR/run.txt ;
  
    # Let's dump the command to read the profiler data to a file called read.txt
  echo "cd $(pwd) && $PROF_PATH/read_prof_data.exe " >> $BASEDIR/read.txt ;
  
}
