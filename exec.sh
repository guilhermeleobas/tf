#!/bin/bash

function execute() {
  
  if [[ $(pwd) =~ "cBench" ]]; then
    for i in $(seq 1 $CBENCH); do
      cmd="./__run $i $exe_name"
      echo "cd $(pwd) && $cmd" >> /tmp/run.txt
    done
    return
  fi

  if [[ $DIFF -eq 1 ]]; then
    cmd="$TIMEOUT --signal=TERM ${RUNTIME} ./$exe_name $RUN_OPTIONS < $STDIN &> $bench_name.output && \
         $BASEDIR/DiffOutput.sh $bench_name $bench_name.reference_output $bench_name.output"
  else
    cmd="$TIMEOUT --signal=TERM ${RUNTIME} ./$exe_name $RUN_OPTIONS < $STDIN > $STDOUT"
  fi

  echo "$cmd"
  
  if [[ -n $ASAN && $ASAN -eq 1 ]]; then
    echo "cd $(pwd) && ASAN_SYMBOLIZER_PATH=$HOME/Programs/llvm61/build/bin/llvm-symbolizer \
      ASAN_OPTIONS=halt_on_error=false:print_stats=true $cmd" >> /tmp/run.txt
  else
    echo "cd $(pwd) && $cmd" >> /tmp/run.txt
  fi
}
