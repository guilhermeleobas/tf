#!/bin/bash

function execute() {
  
  exe=$exe_name ;

  if [[ -n $INSTRUMENT && $INSTRUMENT -eq 1 ]]; then
    exe=INS_$exe_name
  fi
  
  if [[ $(pwd) =~ "cBench" ]]; then
    for i in $(seq 1 1); do # this must be changed
      cmd="./__run $i $exe_name"
      echo "cd $(pwd) && $cmd" >> /tmp/run.txt
    done
    return
  fi

  if [[ $DIFF -eq 1 ]]; then
    cmd="$TIMEOUT --signal=TERM ${RUNTIME} ./$exe $RUN_OPTIONS < $STDIN &> $bench_name.output && \
         $BASEDIR/DiffOutput.sh $bench_name $bench_name.reference_output $bench_name.output"
  else
    cmd="$TIMEOUT --signal=TERM ${RUNTIME} ./$exe $RUN_OPTIONS < $STDIN &> $STDOUT"
  fi

  echo "$cmd"
  echo "cd $(pwd) && $cmd" >> /tmp/run.txt
  
}
