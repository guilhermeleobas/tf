#!/bin/bash

function execute() {

  if [[ -n $TASKMINER && $TASKMINER -eq 1 ]]; then
    exe_name="AI_"$exe_name ;
  fi

  if [[ $DIFF -eq 1 ]]; then
    cmd="$TIMEOUT --signal=TERM ${RUNTIME} ./$exe_name $RUN_OPTIONS < $STDIN &> $bench_name.output && \
         $BASEDIR/DiffOutput.sh $bench_name $bench_name.reference_output $bench_name.output"
  else
    cmd="$TIMEOUT --signal=TERM ${RUNTIME} ./$exe_name $RUN_OPTIONS < $STDIN > $STDOUT"
  fi

  if [[ -f $exe_name ]]; then
    echo "$cmd"
    echo "cd $(pwd) && $cmd" >> $BASEDIR/run.txt ;
  else
    echo "skipping $exe_name   - FILE NOT EXISTS"
  fi
  
}
